import 'dart:ui';

import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/chat_bloc/chat_bloc.dart';
import 'chat_room.dart';
import 'event/event_chat_room.dart';
import '../../data/model/chat_model/chat_model.dart';
import '../../data/model/person_model/person_model.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListChatRoomPatient extends StatefulWidget {
  @override
  _ListChatRoomPatientState createState() => _ListChatRoomPatientState();
}

class _ListChatRoomPatientState extends State<ListChatRoomPatient> {
  UserModel? _myPerson;

  // todo move to repository impl
  void getMyPerson() async {
    UserModel? person = await AppSharedPreference.getUser();
  }

  @override
  void initState() {
    getMyPerson();
    Injector.resolve<ChatBloc>().add(const FetchChatPendingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: BlocListener<ChatBloc, ChatState> (
          listener: (context, state) {
            print('state chat : ${state.status}');
          },
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if(state.status == FormzStatus.submissionSuccess){
                return ListView.builder(
                    itemCount: state.listChatPending?.length,
                    itemBuilder: (context, index) {
                      return ChatPlaceHolderWidget(name: state.listChatPending?[index].from?.name,
                      message: state.listChatPending?[index].message, unread: true,);
                    });
              } else {
                return  SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
          ),
        ),
      floatingActionButton: Align(
        alignment: Alignment(0.9, 1),
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: MediaQuery
              .of(context)
              .size
              .width / 2,
          height: 50,
          child: RaisedButton(
            color: EpregnancyColors.primer,
            child: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Text("+", style: TextStyle(color: Colors.white, fontSize: 40.sp),),
                    ),
                    SizedBox(width: 10,),
                    Padding(
                      padding:  EdgeInsets.only(top: 3.h),
                      child: Text("Mulai Konsultasi", style: TextStyle(color: Colors.white, fontSize: 14.sp),),
                    ),
                  ],
                )
            ),
            elevation: 8,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onPressed: () async {
              var data = await Navigator.of(context).pushNamed(RouteName.chatPage);
              if (data != null){
                Injector.resolve<ChatBloc>().add(FetchChatPendingEvent());
              }
            },
          ),
        ),
      ),
      );
  }

  // Widget _oldBuild() {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: _streamRoom,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(child: Text('Something went wrong'));
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
  //         List<QueryDocumentSnapshot> listRoom = snapshot.data!.docs;
  //         return ListView.separated(
  //           itemCount: listRoom.length,
  //           separatorBuilder: (context, index) {
  //             return Divider(thickness: 1, height: 1);
  //           },
  //           itemBuilder: (context, index) {
  //             final data = getDataValue(listRoom[index].data());
  //             RoomModel? room = RoomModel.fromJson(data);
  //             return itemRoom(room);
  //           },
  //         );
  //       } else {
  //         return _myRole.role == "PATIENT"
  //             ? InkWell(
  //             onTap: () {
  //               Navigator.of(context).pushNamed(RouteName.chatPage);
  //             },
  //             child: Container(
  //                 margin: EdgeInsets.only(left: 20, top: 20),
  //                 child: Row(
  //                   children: const [
  //                     Icon(Icons.text_snippet_outlined),
  //                     SizedBox(
  //                       width: 2,
  //                     ),
  //                     Text(
  //                       'Mulai percakapan',
  //                       style: TextStyle(
  //                           fontSize: 14, fontWeight: FontWeight.w600),
  //                     ),
  //                   ],
  //                 )))
  //             : Center(child: Text('Empty'));
  //       }
  //     },
  //   );
  // }

  // Widget itemRoom(RoomModel? room) {
  //   String today = DateFormat('yyyy/MM/dd').format(DateTime.now());
  //   String yesterday = DateFormat('yyyy/MM/dd')
  //       .format(DateTime.now().subtract(Duration(days: 1)));
  //   DateTime roomDateTime =
  //   DateTime.fromMicrosecondsSinceEpoch(room!.lastDateTime!);
  //   String stringLastDateTime = DateFormat('yyyy/MM/dd').format(roomDateTime);
  //   String time = '';
  //   if (stringLastDateTime == today) {
  //     time = DateFormat('HH:mm').format(roomDateTime);
  //   } else if (stringLastDateTime == yesterday) {
  //     time = 'Yesterday';
  //   } else {
  //     time = DateFormat('yyyy/MM/dd').format(roomDateTime);
  //   }
  //   return Material(
  //     color: Colors.white,
  //     child: InkWell(
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => ChatRoom(arguments: {'room': room})));
  //       },
  //       onLongPress: () {
  //         deleteChatRoom(room.uid!);
  //       },
  //       child: Padding(
  //         padding: EdgeInsets.all(16),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 PersonModel person = PersonModel(
  //                   phoneNumber: room.phoneNumber,
  //                   name: room.name,
  //                   photo: room.photo,
  //                   token: '',
  //                   uid: room.uid,
  //                 );
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => ProfilePerson(
  //                 //       person: person,
  //                 //       myUid: _myPerson.uid,
  //                 //     ),
  //                 //   ),
  //                 // );
  //               },
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(40),
  //                 child: FadeInImage(
  //                   placeholder: AssetImage('assets/ic_no_photo.png'),
  //                   image: NetworkImage(room.photo!),
  //                   width: 40,
  //                   height: 40,
  //                   fit: BoxFit.cover,
  //                   imageErrorBuilder: (context, error, stackTrace) {
  //                     return Image.asset(
  //                       'assets/ic_no_photo.png',
  //                       width: 40,
  //                       height: 40,
  //                       fit: BoxFit.cover,
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //             SizedBox(width: 16),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(room.name!.isEmpty
  //                       ? room.phoneNumber!
  //                       : room.role == "MIDWIFE"
  //                       ? "Bidan ${room.name!}"
  //                       : room.name!),
  //                   Row(
  //                     children: [
  //                       SizedBox(
  //                         child: room.type == 'image'
  //                             ? Icon(Icons.image,
  //                             size: 15, color: Colors.grey[700])
  //                             : null,
  //                       ),
  //                       SizedBox(height: 4),
  //                       Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             room.type! == 'text'
  //                                 ? room.lastChat!.length > 20
  //                                 ? room.lastChat!.substring(0, 20) + '...'
  //                                 : room.lastChat!
  //                                 : ' <Image>',
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   '$time',
  //                   style: TextStyle(fontSize: 12),
  //                 ),
  //                 SizedBox(height: 4),
  //                 countUnreadMessage(room.uid, room.lastDateTime),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget countUnreadMessage(String? personUid, int? lastDateTime) {
  //   return SizedBox();
  // }
}
