import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/person_model/person_model.dart';

class EventContact {
  static void addContact({String? myUid, PersonModel? person}) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('contact')
          .doc(person!.uid)
          .set(person.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static void deleteContact({String? myUid, String? personUid}) {
    try {
      FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('contact')
          .doc(personUid)
          .delete()
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> checkIsMyContact({String? myUid, String? personUid}) async {
    bool isMyContact = false;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('person')
          .doc(myUid)
          .collection('contact')
          .where('uid', isEqualTo: personUid)
          .get()
          .catchError((onError) => print(onError));
      if (querySnapshot.docs.length > 0) {
        isMyContact = true;
      }
    } catch (e) {
      print(e);
    }
    return isMyContact;
  }
}
