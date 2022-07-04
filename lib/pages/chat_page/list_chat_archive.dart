import 'dart:ui';

import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/chat_archive.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chat_room.dart';
import 'event/event_chat_room.dart';
import '../../data/model/chat_model/chat_model.dart';
import '../../data/model/person_model/person_model.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';


class ListChatArchive extends StatefulWidget {
  @override
  _ListChatArchiveState createState() => _ListChatArchiveState();
}

class _ListChatArchiveState extends State<ListChatArchive> {
  UserModelFirebase? _myPerson;
  Stream<QuerySnapshot>? _streamRoom;
  Stream<QuerySnapshot>? _streamChat;

  void getMyPerson() async {
    UserModelFirebase? person = await AppSharedPreference.getUserFirebase();
    setState(() {
      _myPerson = person;
    });
    _streamRoom = FirebaseFirestore.instance
        .collection('USERS')
        .doc(_myPerson!.uid)
        .collection('ARCHIVE')
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
              title: Text('Delete Archive Room'),
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
      AppSharedPreference.remove("person");
      EventChatRoom.deleteArchiveRoom(myUid: _myPerson!.uid, personUid: personUid);
    }
  }

  @override
  void initState() {
    getMyPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
              final reverseIndex = listRoom.length - 1 - index;
              final data = getDataValue(listRoom[index].data());
              RoomModel? room = RoomModel.fromJson(data);
              return itemRoom(room);
            },
          );
        } else {
          return Center(child: Text('Empty'));
        }
      },
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
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatArchive(arguments: {'room': room})));
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
                    placeholder: AssetImage('assets/logo_flikchat.png'),
                    image: NetworkImage(room.photo!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/logo_flikchat.png',
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
                    Text(room.name!.isEmpty? room.phoneNumber! : room.name!),
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
        .collection('person')
        .doc(_myPerson!.uid ?? "")
        .collection('room')
        .doc(personUid ?? "")
        .collection('chat')
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
            if ( datas == lastDateTime) {
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
