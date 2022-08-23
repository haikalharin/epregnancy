import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/chat_model/chat_model.dart';
import '../../model/event_model/event_model.dart';
import '../../model/room_model/room_model.dart';

class EventEvent {
  static Future<List<EventModel>> fetchCategoriEvent({
    String? type,
    String? userId,
  }) async {
    List<EventModel> listEvent = [];
    try {
      EventModel? eventModel;
      if (type == StringConstant.typePersonal) {
        await FirebaseFirestore.instance
            .collection('EVENTS_PERSONAL')
            .where('Userid', isEqualTo: userId)
            .get()
            .then((querySnapshot) {
          if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
            if (querySnapshot.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> listData = querySnapshot.docs;
              listData.forEach((element) {
                final data = getDataValue(element.data());
                eventModel = EventModel.fromJson(data);
                listEvent.add(eventModel!);
              });
            }
          } else {
            listEvent = [];
          }
        }).catchError((onError) => print(onError));
      } else {
        await FirebaseFirestore.instance
            .collection('EVENTS')
            .where('Type', isEqualTo: type)
            .get()
            .then((querySnapshot) {
          if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
            if (querySnapshot.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> listData = querySnapshot.docs;
              listData.forEach((element) {
                final data = getDataValue(element.data());
                eventModel = EventModel.fromJson(data);
                listEvent.add(eventModel!);
              });
            }
          } else {
            listEvent = [];
          }
        }).catchError((onError) => print(onError));
      }
      return listEvent;
    } catch (e) {
      print(e);
      return listEvent;
    }
  }

  static Future<List<EventModel>> fetchCategoriEventPersonal({
    String? type,
    String? userId,
  }) async {
    List<EventModel> listEvent = [];
    try {
      EventModel? eventModel;
      if (type == StringConstant.typePersonal) {
        await FirebaseFirestore.instance
            .collection('EVENTS_PERSONAL')
            .where('Userid', isEqualTo: userId)
            .get()
            .then((querySnapshot) {
          if (querySnapshot != null) {
            if (querySnapshot.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> listData = querySnapshot.docs;
              listData.forEach((element) {
                final data = getDataValue(element.data());
                eventModel = EventModel.fromJson(data);
                listEvent.add(eventModel!);
              });
            }
          }
        }).catchError((onError) {
          return listEvent;
        });
      }
      return listEvent;
    } catch (e) {
      print(e);
      return listEvent;
    }
  }

  static Future<bool> addEvent(EventModel eventModel) async {
    try {
      FirebaseFirestore.instance
          .collection('EVENTS_PERSONAL')
          .doc(eventModel.eventid)
          .set(eventModel.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
