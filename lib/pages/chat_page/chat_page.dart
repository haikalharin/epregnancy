import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/new_chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../data/entity/chat_message_entity.dart';
import '../../data/firebase/event/event_user.dart';
import '../../data/model/hospital_model/hospital_model.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/model/user_model_api/user_model.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import 'chat_room.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isChoice1 = false;
  bool isChoice2 = false;
  int type = 0;
  HospitalModel? hospitalModel;

  void getHospital() async {
    HospitalModel _hospitalModel = await AppSharedPreference.getHospital();
    if(_hospitalModel != null && mounted){
      setState(() {
        hospitalModel = _hospitalModel;
      });
    }
  }


  @override
  void initState() {
    getHospital();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
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
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocListener<ChatBloc, ChatState>(
          listener: (blocContext, state) {
            print('state chat : ${state.type}');
            if(state.type == 'send-pending-success' && state.chatPendingSendResponse != null){
              List<ChatMessageEntity> chatMessageList = [];
              chatMessageList.add(
                  ChatMessageEntity(
                      name: state.chatPendingSendResponse?.from?.hospital?.name,
                      message: state.chatPendingSendResponse?.message,
                      dateTime: state.chatPendingSendResponse?.createdDate,
                      mine: state.chatPendingSendResponse?.fromId == widget.userId ? true: false
                  )
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewChatRoom(
                fromId: state.chatPendingSendResponse?.fromId,
                toImageUrl: state.chatPendingSendResponse?.to?.imageUrl,
                toId: state.chatPendingSendResponse?.hospitalId,
                chatMessageList: chatMessageList,
                toName: state.chatPendingSendResponse?.to?.name ?? hospitalModel?.name ,
                pendingChat: true,
              ))).then((value) {
                if(value != null){
                  print('back with data');
                  Navigator.pop(context, "back");
                }
              });
            }
          },
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (blocContext, state) {
              if(state.status == FormzStatus.submissionInProgress && state.type == 'send-pending-loading' ) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Stack(
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
                                    "Untuk pengalaman diskusi terbaik, hubungi kami pukul 15:00 - 16:00 WIB",
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
                                    "Apa tujuan mama diskusi hari ini ?",
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
                                    isChoice1 = true;
                                    isChoice2 = false;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 120,
                                  decoration: isChoice1
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
                                          "Informasi Umum",
                                          style: TextStyle(
                                              color: isChoice1
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
                                              color: isChoice1
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
                                    isChoice2 = true;
                                    isChoice1 = false;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 100,
                                  decoration: isChoice2
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
                                          "Informasi Kesehatan",
                                          style: TextStyle(
                                              color: isChoice2? EpregnancyColors.white: EpregnancyColors.primer,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Pantangan, saran atau mitos tentang kehamilan",
                                          style: TextStyle(color: isChoice2?EpregnancyColors.white: EpregnancyColors.black),
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
                              color: type!= 0?EpregnancyColors.primer:Colors.grey.shade200,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "Mulai Diskusi",
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                              elevation: 8,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              onPressed: () async {
                                // with firebase

                                // if(type != 0){
                                //   final UserRolesModelFirebase role =
                                //   await EventUser.checkRoleExist("ACosa0u7gSm2nNqXgPLd");
                                //   RoomModel room = RoomModel(
                                //     phoneNumber: "uma.babu@allianz.co.id",
                                //     inRoom: false,
                                //     lastChat: '',
                                //     lastDateTime: 0,
                                //     lastUid: '',
                                //     name: "Puskesmas",
                                //     photo: "",
                                //     type: '',
                                //     uid: "ACosa0u7gSm2nNqXgPLd",
                                //     role: role.role?? '',
                                //   );
                                //   Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(builder: (context) => ChatRoom(arguments:{'room': room})),
                                //   );
                                // }

                                // send pending chat with API
                                final UserModel userModel = await AppSharedPreference.getUser();
                                final HospitalModel _hospital = await AppSharedPreference.getHospital();

                                ChatPendingSendRequest _chatPendingSendRequest = ChatPendingSendRequest(
                                    fromId: userModel.id, hospitalId: _hospital.id, message: "Pantangan, saran atau mitos tentang kehamilan");

                                Injector.resolve<ChatBloc>().add(SendChatPendingEvent(_chatPendingSendRequest, firsTime: true));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
          )
        ),
    );
  }
}
