import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/person_model/person_model.dart';

class EventPerson {
  static Future<String> checkEmail(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('person')
        .where('email', isEqualTo: email)
        .get()
        .catchError((onError) => print(onError));
    if (querySnapshot != null && querySnapshot.docs.length > 0) {
      if (querySnapshot.docs.length > 0) {
        return getPersonUid(querySnapshot.docs[0].data());
      } else {
        return '';
      }
    }
    return '';
  }

  static void addPerson(PersonModel person) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(person.uid)
          .set(person.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static void updatePersonToken(String myUid, String token) async {
    try {
      // update profile
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .update({
            'token': token,
          })
          .then((value) => null)
          .catchError((onError) => print(onError));
      // update contact
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('person').get();
      querySnapshot.docs.forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        queryDocumentSnapshot.reference
            .collection('contact')
            .where('uid', isEqualTo: myUid)
            .get()
            .then((value) {
          value.docs.forEach((docContact) {
            docContact.reference
                .update({
                  'token': token,
                })
                .then((value) => null)
                .catchError((onError) => print(onError));
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<PersonModel> getPerson(String? uid) async {
    PersonModel? person;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('person')
          .doc(uid!)
          .get()
          .catchError((onError) => print(onError));
     final data = getDataFireBase(documentSnapshot.data());
     person = PersonModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return person!;
  }

  static Future<String> getPersonToken(String uid) async {
    String token = '';
    try {
      DocumentSnapshot response = await FirebaseFirestore.instance
          .collection('person')
          .doc(uid)
          .get()
          .catchError((onError) => print(onError));
      token = getPersonTokenFirebase(response.data());

    } catch (e) {
      print(e);
    }
    return token;
  }

  static void deleteAccount(String myUid) async {
    try {
      // delete in person
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
      // delete in contact
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('person').get();
      querySnapshot.docs.forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        queryDocumentSnapshot.reference
            .collection('contact')
            .where('uid', isEqualTo: myUid)
            .get()
            .then((value) {
          value.docs.forEach((docContact) {
            docContact.reference
                .delete()
                .then((value) => null)
                .catchError((onError) => print(onError));
          });
        });
      });
      // delete in room
      QuerySnapshot querySnapshot2 =
          await FirebaseFirestore.instance.collection('person').get();
      querySnapshot2.docs
          .forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        queryDocumentSnapshot.reference
            .collection('room')
            .where('uid', isEqualTo: myUid)
            .get()
            .then((value) {
          value.docs.forEach((docRoom) {
            docRoom.reference
                .delete()
                .then((value) => null)
                .catchError((onError) => print(onError));
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
