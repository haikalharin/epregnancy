import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/constants/router_constants.dart';
import '../../data/firebase/event/event_user.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import 'chat_room.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isChoise1 = false;
  bool isChoise2 = false;
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
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
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200),
                margin: EdgeInsets.only(top: 20, left: 10, right: 100),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Admin",
                          style: TextStyle(color: EpregnancyColors.primer),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Halo mama ! Mohon tunggu sebentar, kami akan segera membantu anda",
                          style: TextStyle(color: EpregnancyColors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200),
                margin: EdgeInsets.only(top: 20, left: 10, right: 100),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Admin",
                          style: TextStyle(color: EpregnancyColors.primer),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Untuk pengalaman konsultasi terbaik, hubungi kami pukul 15:00 - 16:00 WIB",
                          style: TextStyle(color: EpregnancyColors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200),
                margin: EdgeInsets.only(top: 20, left: 10, right: 100),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Admin",
                          style: TextStyle(color: EpregnancyColors.primer),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Apa tujuan mama konsultasi hari ini ?",
                          style: TextStyle(color: EpregnancyColors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 1,
                width: MediaQuery.of(context).size.width - 40,
                color: Colors.grey.shade200,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          type = 1;
                          isChoise1 = true;
                          isChoise2 = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 120,
                        decoration: isChoise1
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: EpregnancyColors.primer)
                            : BoxDecoration(
                                border: Border.all(
                                  color: EpregnancyColors.primer,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                        margin: EdgeInsets.only(top: 20, left: 10, right: 20),
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Permasalahan Umum",
                                style: TextStyle(
                                    color: isChoise1
                                        ? EpregnancyColors.white
                                        : EpregnancyColors.primer,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pantangan, saran atau mitos tentang kehamilan",
                                style: TextStyle(
                                    color: isChoise1
                                        ? EpregnancyColors.white
                                        : EpregnancyColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          type = 2;
                          isChoise2 = true;
                          isChoise1 = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: isChoise2
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: EpregnancyColors.primer)
                            : BoxDecoration(
                                border: Border.all(
                                  color: EpregnancyColors.primer,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                        margin: EdgeInsets.only(top: 20, left: 10, right: 20),
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Permasalahan Umum",
                                style: TextStyle(
                                    color: isChoise2? EpregnancyColors.white: EpregnancyColors.primer,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pantangan, saran atau mitos tentang kehamilan",
                                style: TextStyle(color: isChoise2?EpregnancyColors.white: EpregnancyColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(),
              Align(
                alignment: Alignment(0, 1),
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  width: MediaQuery.of(context).size.width-40,
                  height: 50,
                  child: RaisedButton(
                    color: EpregnancyColors.primer,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Mulai Konsultasi",
                        style: TextStyle(fontSize: 16, color: EpregnancyColors.white),
                      ),
                    ),
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    onPressed: () async {
                      if(type != 0){
                        final UserRolesModelFirebase role =
                        await EventUser.checkRoleExist("ACosa0u7gSm2nNqXgPLd");
                        RoomModel room = RoomModel(
                          phoneNumber: "uma.babu@allianz.co.id",
                          inRoom: false,
                          lastChat: '',
                          lastDateTime: 0,
                          lastUid: '',
                          name: "Uma Babu",
                          photo: "",
                          type: '',
                          uid: "ACosa0u7gSm2nNqXgPLd",
                          role: role.role?? '',
                        );
                        await AppSharedPreference.setPersonFirebase(room);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ChatRoom(arguments:{'room': room})),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
