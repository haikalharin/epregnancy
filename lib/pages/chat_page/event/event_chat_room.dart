import 'dart:math';

import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../data/model/chat_model/chat_model.dart';
import '../../../data/model/room_model/room_model.dart';

class EventChatRoom {
  static Future<bool> checkRoomIsExist({
    bool isSender = false,
    String? myUid,
    String? personUid,
  }) async {
    DocumentSnapshot response = await FirebaseFirestore.instance
        .collection('USERS')
        .doc(isSender ? personUid : myUid)
        .collection('ROOM')
        .doc(isSender ? myUid : personUid)
        .get();
    return response.exists;
  }

  static Future<bool> checkArchiveIsExist({
    String? myUid,
  }) async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('USERS')
        .doc(myUid)
        .collection('ARCHIVE')
        .get();
    return response.size != 0;
  }

  static updateRoom({
    bool isSender = false,
    String? myUid,
    String? personUid,
    RoomModel? room,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
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
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
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
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .collection('CHAT')
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
          .collection('USERS')
          .doc(myUid)
          .collection('ROOM')
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
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .collection('CHAT')
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
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
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
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
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
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .collection('CHAT')
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
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .collection('CHAT')
          .doc(chatId)
          .update({'message': 'delete'})
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static Future<RoomModel> checkMessageNow({
    String? myUid,
  }) async {
    try {
      RoomModel? roomModel;
      await FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .collection('ROOM')
          .get()
          .then((querySnapshot) {

        if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
          if (querySnapshot.docs.isNotEmpty) {
            List<QueryDocumentSnapshot> listRoom = querySnapshot.docs;
            final data = getDataValue(querySnapshot.docs[0].data());
             roomModel = RoomModel.fromJson(data);
          } else {
            roomModel = RoomModel.empty();
          }
        }
      }
      ).catchError((onError) => print(onError));
      return roomModel!;
    } catch (e) {
      print(e);
      return RoomModel.empty();
    }
  }

  static Future<bool> archiveRoomChat({
    bool isSender = false,
    String? myUid,
    String? personUid,
  }) async {
    try {
      // await FirebaseFirestore.instance
      //     .collection('USERS')
      //     .doc(isSender ? personUid : myUid)
      //     .collection('ROOM')
      //     .doc(isSender ? myUid : personUid)
      //     .get()
      //     .then((querySnapshot) {
      //   RoomModel roomModel = RoomModel.fromJson(querySnapshot.data()!);
      //   FirebaseFirestore.instance
      //       .collection('USERS')
      //       .doc(isSender ? personUid : myUid)
      //       .collection('ARCHIVE')
      //       .doc(isSender ? myUid : personUid)
      //       .set(roomModel.toJson())
      //       .then((value) => null)
      //       .catchError((onError) => print(onError));
      // }).catchError((onError) => print(onError));
      //
      // await FirebaseFirestore.instance
      //     .collection('USERS')
      //     .doc(isSender ? personUid : myUid)
      //     .collection('ROOM')
      //     .doc(isSender ? myUid : personUid)
      //     .collection('CHAT')
      //     .get()
      //     .then((querySnapshot) {
      //   List<QueryDocumentSnapshot> listChat = querySnapshot.docs;
      //   listChat.forEach((element) {
      //     final data = getDataValue(element.data());
      //     ChatModel? chatModel = ChatModel.fromJson(data);
      //     FirebaseFirestore.instance
      //         .collection('USERS')
      //         .doc(isSender ? personUid : myUid)
      //         .collection('ARCHIVE')
      //         .doc(isSender ? myUid : personUid)
      //         .collection("CHAT")
      //         .doc(chatModel.dateTime.toString())
      //         .set(chatModel.toJson())
      //         .then((value) => null)
      //         .catchError((onError) => print(onError));
      //   });
      // }).catchError((onError) => print(onError));
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random _rnd = Random();

      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

      String random = getRandomString(28);
      await FirebaseFirestore.instance
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .get()
          .then((querySnapshot) {
        RoomModel roomModel = RoomModel.fromJson(querySnapshot.data()!);
        roomModel = RoomModel(
          phoneNumber: roomModel.phoneNumber,
          inRoom: roomModel.inRoom,
          lastChat: roomModel.lastChat,
          lastDateTime: roomModel.lastDateTime,
          lastUid: roomModel.lastUid,
          name: roomModel.name,
          photo: roomModel.photo,
          type: roomModel.type,
          uid: random,
        );

        FirebaseFirestore.instance
            .collection('USERS')
            .doc(isSender ? personUid : myUid)
            .collection('ARCHIVE')
            .doc(random)
            .set(roomModel.toJson())
            .then((value) => null)
            .catchError((onError) => print(onError));
      }).catchError((onError) => print(onError));

      await FirebaseFirestore.instance
          .collection('USERS')
          .doc(isSender ? personUid : myUid)
          .collection('ROOM')
          .doc(isSender ? myUid : personUid)
          .collection('CHAT')
          .get()
          .then((querySnapshot) {
        List<QueryDocumentSnapshot> listChat = querySnapshot.docs;
        listChat.forEach((element) {
          final data = getDataValue(element.data());
          ChatModel? chatModel = ChatModel.fromJson(data);
          FirebaseFirestore.instance
              .collection('USERS')
              .doc(isSender ? personUid : myUid)
              .collection('ARCHIVE')
              .doc(random)
              .collection("CHAT")
              .doc(chatModel.dateTime.toString())
              .set(chatModel.toJson())
              .then((value) => null)
              .catchError((onError) => print(onError));
        });
      }).catchError((onError) => print(onError));

      await FirebaseFirestore.instance
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
          .doc(myUid)
          .get()
          .then((querySnapshot) {
        RoomModel roomModel = RoomModel.fromJson(querySnapshot.data()!);

        FirebaseFirestore.instance
            .collection('USERS')
            .doc(personUid)
            .collection('ARCHIVE')
            .doc(random)
            .set(roomModel.toJson())
            .then((value) => null)
            .catchError((onError) => print(onError));
      }).catchError((onError) => print(onError));

      await FirebaseFirestore.instance
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
          .doc(myUid)
          .collection('CHAT')
          .get()
          .then((querySnapshot) {
        List<QueryDocumentSnapshot> listChat = querySnapshot.docs;
        listChat.forEach((element) {
          final data = getDataValue(element.data());
          ChatModel? chatModel = ChatModel.fromJson(data);
          FirebaseFirestore.instance
              .collection('USERS')
              .doc(personUid)
              .collection('ARCHIVE')
              .doc(random)
              .collection("CHAT")
              .doc(chatModel.dateTime.toString())
              .set(chatModel.toJson())
              .then((value) => null)
              .catchError((onError) => print(onError));
        });
      }).catchError((onError) => print(onError));

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static deleteArchiveRoom({
    String? myUid,
    String? personUid,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .collection('ARCHIVE')
          .doc(personUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .collection('ARCHIVE')
          .doc(personUid)
          .collection('CHAT')
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

  static deleteChatRoom({
    String? myUid,
    String? personUid,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .collection('ROOM')
          .doc(personUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .collection('ROOM')
          .doc(personUid)
          .collection('CHAT')
          .get()
          .then((querySnapshot) {
        for (var docChat in querySnapshot.docs) {
          docChat.reference.delete();
        }
      }).catchError((onError) => print(onError));

      FirebaseFirestore.instance
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
          .doc(myUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(personUid)
          .collection('ROOM')
          .doc(myUid)
          .collection('CHAT')
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
