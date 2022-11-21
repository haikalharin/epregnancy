import 'dart:io';
import 'dart:ui';

import 'package:PregnancyApp/data/firebase/event/event_user.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/list_chat_archive.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants/router_constants.dart';
import '../../data/firebase/event/event_person_example.dart';
import '../../data/firebase/event/event_storage_example.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/person_model/person_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import 'list_chat_room.dart';
import '../example_dashboard_chat_page/fragment/list_contact_example.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserModelFirebase? _myPerson;
  var _controllerPassword = TextEditingController();

  final List<Widget> _listFragment = [
    ListChatRoom(),
    ListChatArchive(),
  ];

  void getMyPerson() async {
    UserModelFirebase person = await AppSharedPreference.getUserFirebase();
    setState(() {
      _myPerson = person;
    });
  }

  void pickAndCropPhoto() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {
        EventStorageExample.editPhoto(
          filePhoto: File(croppedFile.path),
          oldUrl: _myPerson?.photo,
          uid: _myPerson?.uid,
        );
        EventUser.getUser(_myPerson!.uid!).then((person) {
          AppSharedPreference.setUserFirebase(person);
        });
      }
    }
    getMyPerson();
  }

  void logout() async {
    var value = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('You sure for logout?'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, 'logout'),
            child: Text('Yes'),
          ),
        ],
      ),
    );
    if (value == 'logout') {
      // AppSharedPreference.clear();
      AppSharedPreference.remove(AppSharedPreference.user);
      AppSharedPreference.remove(AppSharedPreference.userRegister);
      AppSharedPreference.remove(AppSharedPreference.baby);
      AppSharedPreference.remove(AppSharedPreference.baby);
      AppSharedPreference.remove(AppSharedPreference.hospital);
      AppSharedPreference.remove(AppSharedPreference.otp);
      AppSharedPreference.remove(AppSharedPreference.token);
      AppSharedPreference.remove(AppSharedPreference.cookie);
      await GAuthentication.signOut(context: context);
      Navigator.of(context).pushReplacementNamed(RouteName.login, arguments: {'token_expired': false, 'is_from_register': false});
    }
  }

  void deleteAccount() async {
    var value = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          contentPadding: EdgeInsets.all(16),
          title: Text('Delete Account'),
          children: [
            TextField(
              controller: _controllerPassword,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: true,
            ),
            SizedBox(height: 16),
            RaisedButton(
              child: Text('Delete'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                if (_controllerPassword.text != null &&
                    _controllerPassword.text != '') {
                  Navigator.pop(context, 'delete');
                }
              },
            ),
            OutlineButton(
              child: Text('Close'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
    if (value == 'delete') {
      Navigator.pop(context);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _myPerson!.email!,
        password: _controllerPassword.text,
      );
      if (userCredential != null) {
        userCredential.user?.delete().then((value) {
          EventPersonExample.deleteAccount(_myPerson!.uid!);
        });
      }
      _controllerPassword.clear();
      Navigator.of(context).pushReplacementNamed(RouteName.login, arguments: {'token_expired': false, 'is_from_register': false});
    }
  }

  @override
  void initState() {
    getMyPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              })),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20,bottom: 10),
              child: Text(
                "Percakapan Saya",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
                color: EpregnancyColors.white,
                height: MediaQuery.of(context).size.height / 10,
                child: ListChatRoom()),


            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              padding: EdgeInsets.only(left: 20,bottom: 20,top: 20),
              child: Text(
                "Arsip",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: Container(color:Colors.grey.shade200,child: ListChatArchive())),
          ],
        ),
      ),
    );
  }



}
