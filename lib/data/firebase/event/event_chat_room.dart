import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/chat_model/chat_model.dart';
import '../../model/room_model/room_model.dart';

class EventChatRoom {
  static Future<bool> checkRoomIsExist({
    bool isSender = false,
    String? myUid,
    String? personUid,
  }) async {
    DocumentSnapshot response = await FirebaseFirestore.instance
        .collection('person')
        .doc(isSender ? personUid : myUid)
        .collection('room')
        .doc(isSender ? myUid : personUid)
        .get();
    return response.exists;
  }

  static updateRoom({
    bool isSender = false,
    String? myUid,
    String? personUid,
    RoomModel? room,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .update(room!.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static addRoom({
    bool isSender = false,
    String? myUid,
    String? personUid,
    RoomModel? room,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .set(room!.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static addChat({
    bool isSender = false,
    String? myUid,
    String? personUid,
    ChatModel? chat,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .collection('chat')
          .doc(chat!.dateTime.toString())
          .set(chat.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> checkIsPersonInRoom({
    String? myUid,
    String? personUid,
  }) async {
    bool inRoom = false;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('room')
          .doc(personUid)
          .get()
          .catchError((onError) => print(onError));
      inRoom = cekPersonInRoom(documentSnapshot.data());


    } catch (e) {
      print(e);
    }
    return inRoom;
  }

  static updateChatIsRead({
    bool isSender = false,
    String? myUid,
    String? personUid,
    String? chatId,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .collection('chat')
          .doc(chatId)
          .update({'isRead': true})
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static void setMeInRoom(String myUid, String personUid) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(personUid)
          .collection('room')
          .doc(myUid)
          .update({'inRoom': true}).then((value) {
        _setAllMessageRead(
          isSender: true,
          myUid: myUid,
          personUid: personUid,
        );
        _setAllMessageRead(
          isSender: false,
          myUid: myUid,
          personUid: personUid,
        );
      }).catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static void setMeOutRoom(String myUid, String personUid) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(personUid)
          .collection('room')
          .doc(myUid)
          .update({'inRoom': false})
          .then((value) {})
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static void _setAllMessageRead({
    bool isSender = false,
    String? myUid,
    String? personUid,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .collection('chat')
          .where('isRead', isEqualTo: false)
          .get()
          .then((querySnapshot) {
        for (var docChat in querySnapshot.docs) {
          if (docChat.data()['uidSender'] == personUid) {
            docChat.reference
                .update({'isRead': true})
                .then((value) => null)
                .catchError((onError) => print(onError));
          }
        }
      }).catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static deleteMessage({
    bool isSender = false,
    String? myUid,
    String? personUid,
    String? chatId,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(isSender ? personUid : myUid)
          .collection('room')
          .doc(isSender ? myUid : personUid)
          .collection('chat')
          .doc(chatId)
          .update({'message': 'delete'})
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static deleteChatRoom({
    String? myUid,
    String? personUid,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('room')
          .doc(personUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('room')
          .doc(personUid)
          .collection('chat')
          .get()
          .then((querySnapshot) {
        for (var docChat in querySnapshot.docs) {
          docChat.reference.delete();
        }
      }).catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }
}
