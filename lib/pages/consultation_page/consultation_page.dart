import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/chat_page/event/patient_consultation_page.dart';
import 'package:PregnancyApp/pages/chat_page/new_chat_room.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_event_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/event/event_user.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../chat_page/chat_patient_page/initial_consultation_load_page.dart';
import '../chat_page/chat_room.dart';
import '../chat_page/event/event_chat_room.dart';
import '../home_page/list_event.dart';
import 'list_forum.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key, required this.role}) : super(key: key);
  final String? role;
  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  void initState() {
    print('role : ${widget.role}');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 0, top: 20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 40, left: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Konsultasi",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SvgPicture.asset('assets/icArchive.svg')
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10,right:20, left: 20 ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: EpregnancyColors.primer,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child:  FlatButton(
                                  minWidth: MediaQuery.of(context).size.width/4,
                                  padding: EdgeInsets.only(top: 20, bottom: 20,right: 10,left: 10),
                                  onPressed: () async {
                                    // UserModelFirebase myData =
                                    //     await AppSharedPreference.getUserFirebase();
                                    // bool isSenderRoomExist = false;
                                    // bool isSenderAchiveExist =
                                    //     await EventChatRoom.checkArchiveIsExist(
                                    //   myUid: myData.uid,
                                    // );
                                    // RoomModel roomModel =
                                    //     await EventChatRoom.checkMessageNow(
                                    //   myUid: myData.uid,
                                    // );
                                    //
                                    // if (roomModel.uid!.isNotEmpty) {
                                    //   isSenderRoomExist =
                                    //       await EventChatRoom.checkRoomIsExist(
                                    //     isSender: true,
                                    //     myUid: myData.uid,
                                    //     personUid: roomModel.uid,
                                    //   );
                                    //   if (isSenderRoomExist &&
                                    //       !isSenderAchiveExist) {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) => ChatRoom(
                                    //                 arguments: {
                                    //                   'room': roomModel
                                    //                 })));
                                    //   } else if (isSenderRoomExist &&
                                    //       isSenderAchiveExist) {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 Dashboard()));
                                    //   } else {
                                    //     Navigator.of(context)
                                    //         .pushNamed(RouteName.chatPage);
                                    //   }
                                    // } else if (!isSenderRoomExist &&
                                    //     isSenderAchiveExist) {
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) => Dashboard()));
                                    // } else {
                                    //   Navigator.of(context)
                                    //       .pushNamed(RouteName.chatPage);
                                    // }

                                    // new method for hubungi profesional
                                    Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       const InitialConsultationLoadPage()));

                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset('assets/icon-hubungi-profesional.png', height: 25),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        widget.role == "PATIENT"
                                            ? Text("Hubungi profesional", style: TextStyle(fontSize: 12),)
                                            : Text("Cek Konsultasi",style: TextStyle(fontSize: 12),),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                         // Container(
                         //      decoration: BoxDecoration(
                         //          borderRadius: BorderRadius.circular(15.0),
                         //          color: EpregnancyColors.primer),
                         //      child: FlatButton(
                         //        minWidth: MediaQuery.of(context).size.width/5,
                         //        padding: EdgeInsets.only(top: 20, bottom: 20,right: 20,left: 20),
                         //        onPressed: () {
                         //
                         //        },
                         //        child: Container(
                         //          child: Row(
                         //            children: [
                         //              SizedBox(
                         //                width: 5,
                         //              ),
                         //              Image.asset('assets/icon-emergency.png'),
                         //              SizedBox(
                         //                width: 10,
                         //              ),
                         //              Text(
                         //                "Darurat",
                         //                style: TextStyle(color: Colors.white),
                         //              ),
                         //              SizedBox(
                         //                width: 5,
                         //              )
                         //            ],
                         //          ),
                         //        ),
                         //      ),
                         //    ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                          margin: EdgeInsets.only(
                              top: 20, bottom: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: const FadeInImage(
                                  placeholder:
                                      AssetImage('assets/photo_dummy.png'),
                                  image: AssetImage('assets/photo_dummy.png'),
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: 260,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: TextField(
                                  maxLines: 3,
                                  minLines: 1,
                                  decoration: const InputDecoration(
                                    // prefixIcon: Image(image: image),
                                    hintText: 'Tanya ke komunitas...',
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child: Container(
                                    margin: EdgeInsets.only(),
                                    child: Icon(Icons.image)),
                              ),
                            ],
                          )),
                      Divider(),
                    ],
                  ),
                ],
              )),
          Expanded(child: ListForumWidget(tipeAcara: 'Acara umum')),
        ],
      ),
    );
  }
  void pickAndCropImageGallery() async {
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
      // if (croppedFile != null) {
      //   EventStorageExample.uploadMessageImageAndGetUrl(
      //     filePhoto: File(croppedFile.path),
      //     myUid: _myPerson!.uid,
      //     personUid: widget.arguments["room"].uid,
      //   ).then((imageUrl) {
      //     sendMessage('image', imageUrl);
      //   });
      // }
    }
  }
  void pickAndCropImageCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
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
      // if (croppedFile != null) {
      //   EventStorageExample.uploadMessageImageAndGetUrl(
      //     filePhoto: File(croppedFile.path),
      //     myUid: _myPerson!.uid,
      //     personUid: widget.arguments["room"].uid,
      //   ).then((imageUrl) {
      //     sendMessage('image', imageUrl);
      //   });
      // }
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () async {
                        pickAndCropImageGallery();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () async {
                      pickAndCropImageCamera();

                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

}
