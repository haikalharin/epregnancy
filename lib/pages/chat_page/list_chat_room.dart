import 'dart:ui';

import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/constants/router_constants.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'chat_room.dart';
import 'event/event_chat_room.dart';
import '../../data/model/chat_model/chat_model.dart';
import '../../data/model/person_model/person_model.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';

class ListChatRoom extends StatefulWidget {
  @override
  _ListChatRoomState createState() => _ListChatRoomState();
}

class _ListChatRoomState extends State<ListChatRoom> {
  UserModelFirebase? _myPerson;
  UserRolesModelFirebase _myRole = UserRolesModelFirebase.empty();
  Stream<QuerySnapshot>? _streamRoom;
  Stream<QuerySnapshot>? _streamChat;

  void getMyPerson() async {
    UserModelFirebase? person = await AppSharedPreference.getUserFirebase();
    UserRolesModelFirebase? role =
        await AppSharedPreference.getUserRoleFirebase();
    setState(() {
      _myPerson = person;
      _myRole = role ;
    });
    _streamRoom = FirebaseFirestore.instance
        .collection('USERS')
        .doc(_myPerson!.uid)
        .collection('ROOM')
        .snapshots(includeMetadataChanges: true);
  }

  void deleteChatRoom(String personUid) async {
    var value = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          children: [
            ListTile(
              onTap: () => Navigator.pop(context, 'delete'),
              title: Text('Delete Chat Room'),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              title: Text('Close'),
            ),
          ],
        );
      },
    );
    if (value == 'delete') {
      EventChatRoom.deleteChatRoom(myUid: _myPerson!.uid, personUid: personUid);
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
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamRoom,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
            List<QueryDocumentSnapshot> listRoom = snapshot.data!.docs;
            return ListView.separated(
              itemCount: listRoom.length,
              separatorBuilder: (context, index) {
                return Divider(thickness: 1, height: 1);
              },
              itemBuilder: (context, index) {
                final data = getDataValue(listRoom[index].data());
                RoomModel? room = RoomModel.fromJson(data);
                return itemRoom(room);
              },
            );
          } else {
            return _myRole.role == "PATIENT"
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.chatPage);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: const [
                            Icon(Icons.text_snippet_outlined),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Mulai percakapan',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )))
                : Center(child: Text('Empty'));
          }
        },
      ),
    );
  }

  Widget itemRoom(RoomModel? room) {
    String today = DateFormat('yyyy/MM/dd').format(DateTime.now());
    String yesterday = DateFormat('yyyy/MM/dd')
        .format(DateTime.now().subtract(Duration(days: 1)));
    DateTime roomDateTime =
        DateTime.fromMicrosecondsSinceEpoch(room!.lastDateTime!);
    String stringLastDateTime = DateFormat('yyyy/MM/dd').format(roomDateTime);
    String time = '';
    if (stringLastDateTime == today) {
      time = DateFormat('HH:mm').format(roomDateTime);
    } else if (stringLastDateTime == yesterday) {
      time = 'Yesterday';
    } else {
      time = DateFormat('yyyy/MM/dd').format(roomDateTime);
    }
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatRoom(arguments: {'room': room})));
        },
        onLongPress: () {
          deleteChatRoom(room.uid!);
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  PersonModel person = PersonModel(
                    phoneNumber: room.phoneNumber,
                    name: room.name,
                    photo: room.photo,
                    token: '',
                    uid: room.uid,
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfilePerson(
                  //       person: person,
                  //       myUid: _myPerson.uid,
                  //     ),
                  //   ),
                  // );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/ic_no_photo.png'),
                    image: NetworkImage(room.photo!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/ic_no_photo.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(room.name!.isEmpty
                        ? room.phoneNumber!
                        : room.role == "MIDWIFE"
                            ? "Bidan ${room.name!}"
                            : room.name!),
                    Row(
                      children: [
                        SizedBox(
                          child: room.type == 'image'
                              ? Icon(Icons.image,
                                  size: 15, color: Colors.grey[700])
                              : null,
                        ),
                        SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.type! == 'text'
                                  ? room.lastChat!.length > 20
                                      ? room.lastChat!.substring(0, 20) + '...'
                                      : room.lastChat!
                                  : ' <Image>',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$time',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  countUnreadMessage(room.uid, room.lastDateTime),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countUnreadMessage(String? personUid, int? lastDateTime) {
    _streamChat = FirebaseFirestore.instance
        .collection('USERS')
        .doc(_myPerson!.uid ?? "")
        .collection('ROOM')
        .doc(personUid ?? "")
        .collection('CHAT')
        .snapshots(includeMetadataChanges: true);
    return StreamBuilder<QuerySnapshot?>(
      stream: _streamChat,
      builder: (BuildContext? context, AsyncSnapshot<QuerySnapshot?> snapshot) {
        if (snapshot.hasError) {
          return SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (snapshot.data == null) {
          return SizedBox();
        }
        List<QueryDocumentSnapshot>? listChat = [];
        listChat = snapshot.data!.docs;
        // int lastTime = 0;
        var data;
        if (listChat.isNotEmpty) {
          QueryDocumentSnapshot? lastChat;
          listChat.forEach((element) {
            final datas = getDateTimeFirebase(element.data());
            if (datas == lastDateTime) {
              lastChat = element;
              data = getDataValue(lastChat!.data());
            }
          });

          // QueryDocumentSnapshot? lastChat = listChat
          //     .where((element) =>
          // getDateTimeFirebase(element.data()) == lastDateTime)
          //     .toList().first;
          //  data = getDataValue(lastChat.data());
        }
        ChatModel? lastDataChat =
            data != null ? ChatModel.fromJson(data) : ChatModel.empty();

        if (lastDataChat.uidSender == _myPerson!.uid) {
          return Icon(
            Icons.check,
            size: 20,
            color: lastDataChat.isRead! ? Colors.blue : Colors.grey,
          );
        } else {
          int? unRead = 0;
          for (var doc in listChat) {
            final data = getDataValue(doc.data());
            ChatModel? docChat = ChatModel.fromJson(data);
            if (!docChat.isRead! && docChat.uidSender == personUid) {
              unRead = unRead! + 1;
            }
          }

          if (unRead == 0) {
            return SizedBox();
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(4),
              child: Text(
                unRead!.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }
        }
      },
    );
  }
}
