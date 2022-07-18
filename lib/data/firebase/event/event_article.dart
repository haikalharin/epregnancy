import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/chat_model/chat_model.dart';
import '../../model/room_model/room_model.dart';

class EventArticle {
  static Future<List<ArticleModel>> fetchAllArticle({
    String? myUid,
  }) async {
    List<ArticleModel> listArticle = [];
    try {
      ArticleModel? articleModel;
      await FirebaseFirestore.instance
          .collection('INFOS')
          .get()
          .then((querySnapshot) {

        if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
          if (querySnapshot.docs.isNotEmpty) {
            List<QueryDocumentSnapshot> listData = querySnapshot.docs;
            listData.forEach((element) {
             final data = getDataValue(element.data());
             articleModel = ArticleModel.fromJson(data);
             listArticle.add(articleModel!);
           });
          }
        }
      }
      ).catchError((onError) => print(onError));
      return listArticle;
    } catch (e) {
      print(e);
      return listArticle;
    }
  }

  static Future<List<ArticleModel>> fetchCategoriArticle({
    String? condition,
  }) async {
    List<ArticleModel> listArticle = [];
    try {
      ArticleModel? articleModel;
      await FirebaseFirestore.instance
          .collection('INFOS')
          .where('Condition', isEqualTo: condition)
          .get()
          .then((querySnapshot) {

        if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
          if (querySnapshot.docs.isNotEmpty) {
            List<QueryDocumentSnapshot> listData = querySnapshot.docs;
            listData.forEach((element) {
              final data = getDataValue(element.data());
              articleModel = ArticleModel.fromJson(data);
              listArticle.add(articleModel!);
            });
          }
        }
      }
      ).catchError((onError) => print(onError));
      return listArticle;
    } catch (e) {
      print(e);
      return listArticle;
    }
  }
}
