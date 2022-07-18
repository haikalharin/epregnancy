import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/chat_model/chat_model.dart';
import '../../model/event_model/event_model.dart';
import '../../model/room_model/room_model.dart';

class EventEvent {

  static Future<List<EventModel>> fetchCategoriEvent({
    String? type,
  }) async {
    List<EventModel> listEvent = [];
    try {
      EventModel? eventModel;
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
        }
      }
      ).catchError((onError) => print(onError));
      return listEvent;
    } catch (e) {
      print(e);
      return listEvent;
    }
  }
}
