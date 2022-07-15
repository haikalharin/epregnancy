import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_calendar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/event/event_user.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../chat_page/chat_room.dart';
import '../chat_page/event/event_chat_room.dart';
import '../home_page/list_calendar.dart';
import 'list_forum.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  UserModelFirebase user = UserModelFirebase.empty();
  UserRolesModelFirebase rolesModel = UserRolesModelFirebase.empty();

  void getMyPerson() async {
    UserModelFirebase userModelFirebase =
        await AppSharedPreference.getUserFirebase();
    UserRolesModelFirebase? userRolesModelFirebase =
        await AppSharedPreference.getUserRoleFirebase();
    setState(() {
      user = userModelFirebase;
      rolesModel = userRolesModelFirebase;
    });
  }

  @override
  void initState() {
    getMyPerson();
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
                        child: Text("Konsultasi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                UserModelFirebase myData =
                                    await AppSharedPreference.getUserFirebase();
                                bool isSenderRoomExist = false;
                                bool isSenderAchiveExist =
                                    await EventChatRoom.checkArchiveIsExist(
                                  myUid: myData.uid,
                                );
                                RoomModel roomModel =
                                    await EventChatRoom.checkMessageNow(
                                  myUid: myData.uid,
                                );

                                  if (roomModel.uid!.isNotEmpty) {
                                    isSenderRoomExist =
                                        await EventChatRoom.checkRoomIsExist(
                                      isSender: true,
                                      myUid: myData.uid,
                                      personUid: roomModel.uid,
                                    );
                                    if (isSenderRoomExist &&
                                        !isSenderAchiveExist) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChatRoom(
                                                      arguments: {
                                                        'room': roomModel
                                                      })));
                                    } else if (isSenderRoomExist &&
                                        isSenderAchiveExist) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Dashboard()));
                                    } else {
                                      Navigator.of(context)
                                          .pushNamed(RouteName.chatPage);
                                    }
                                  } else if (!isSenderRoomExist &&
                                      isSenderAchiveExist) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()));
                                  } else {
                                    Navigator.of(context)
                                        .pushNamed(RouteName.chatPage);
                                  }

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: EpregnancyColors.primer,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                margin: EdgeInsets.only(left: 20, right: 0),
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset('assets/icon-hubungi-profesional.png', height: 25),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        rolesModel.role == "PATIENT"
                                            ? Text("Hubungi profesional")
                                            : Text("Cek Konsultasi"),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            rolesModel.role == "PATIENT"?  Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: EpregnancyColors.primer),
                              margin: EdgeInsets.only(left: 10, right: 20),
                              child: Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Container(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset('assets/icon-emergency.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Darurat",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ): Container(),
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
                                    hintText: 'Tanya ke komunitas...',
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(),
                                  child: Icon(Icons.image)),
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
}
