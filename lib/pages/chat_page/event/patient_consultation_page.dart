import 'dart:io';
import 'dart:ui';

import 'package:PregnancyApp/data/firebase/event/event_user.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/empty_chat_list_page.dart';
import 'package:PregnancyApp/pages/chat_page/list_chat_archive.dart';
import 'package:PregnancyApp/pages/chat_page/list_chat_room_patient.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/firebase/event/event_storage_example.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';
import '../list_chat_room.dart';

class PatientConsultationPage extends StatefulWidget {
  const PatientConsultationPage({Key? key, this.initialIndex = 0});
  final int initialIndex;

  @override
  _PatientConsultationPageState createState() => _PatientConsultationPageState();
}

class _PatientConsultationPageState extends State<PatientConsultationPage> {
  UserModel? _myPerson;

  final List<Widget> _listFragment = [
    ListChatRoomPatient(),
    ListChatRoomPatient(),
    ListChatArchive(),
  ];

  void getMyPerson() async {
    UserModel person = await AppSharedPreference.getUser();
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
          oldUrl: _myPerson?.imageUrl,
          uid: _myPerson?.id,
        );
        EventUser.getUser(_myPerson!.id!).then((person) {
          AppSharedPreference.setUserFirebase(person);
        });
      }
    }
    getMyPerson();
  }



  @override
  void initState() {
    getMyPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(StringConstant.consultation, style: TextStyle(color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            unselectedLabelColor: EpregnancyColors.greyDarkFontColor,
            labelColor: EpregnancyColors.primer,
            tabs: [
              Tab(text: StringConstant.pending),
              Center(child: Text(StringConstant.onGoing, overflow: TextOverflow.visible, textAlign: TextAlign.center,)),
              Tab(text: StringConstant.archive),
            ],
          ),
        ),
        body: TabBarView(children: _listFragment),
      ),
    );
  }



}
