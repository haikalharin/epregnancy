
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/firebase/event/event_contact_example.dart';
import '../../../data/firebase/event/event_person_example.dart';
import '../../../data/model/person_model/person_model.dart';
import '../../../data/model/room_model/room_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../chat_room_example.dart';

class ListContactExample extends StatefulWidget {
  @override
  _ListContactExampleState createState() => _ListContactExampleState();
}

class _ListContactExampleState extends State<ListContactExample> {
  var _controllerEmail = TextEditingController();
  PersonModel? _myPerson;
  Stream<QuerySnapshot>? _streamContact;
  void getMyPerson() async {
    PersonModel person = await AppSharedPreference.getPerson();
    setState(() {
      _myPerson = person;
    });
    _streamContact = FirebaseFirestore.instance
        .collection('person')
        .where('phoneNumber', isNotEqualTo: person.phoneNumber)
        // .doc(_myPerson!.uid)
        // .collection('contact')
        .snapshots(includeMetadataChanges: true);
  }

  void addNewContact() async {
    var value = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          contentPadding: EdgeInsets.all(16),
          title: Text('Add Contact'),
          children: [
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'email@gmail.com',
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(height: 16),
            RaisedButton(
              child: Text('Add'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pop(context, 'add'),
            ),
            OutlineButton(
              child: Text('Close'),
              textColor: Colors.blue,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
    if (value == 'add') {
      String personUid = await EventPersonExample.checkPhoneNumber(_controllerEmail.text);
      if (personUid != '') {
        EventPersonExample.getPerson(personUid).then((person) {
          EventContactExample.addContact(myUid: _myPerson!.uid, person: person);
        });
      }
    }
    _controllerEmail.clear();
  }

  @override
  void initState() {
    getMyPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _streamContact,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> listContact = snapshot.data!.docs;
              return ListView.separated(
                itemCount: listContact.length,
                separatorBuilder: (context, index) {
                  return Divider(thickness: 1, height: 1);
                },
                itemBuilder: (context, index) {
                  final data = getDataValue(listContact[index].data());
                  PersonModel person = PersonModel.fromJson(data);
                  return itemContact(person);
                },
              );
            } else {
              return Center(child: Text('Empty'));
            }
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              addNewContact();
            },
          ),
        ),
      ],
    );
  }

  Widget itemContact(PersonModel? person) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
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
        child: SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: FadeInImage(
              placeholder: AssetImage('assets/ic_no_photo.png'),
              image: NetworkImage(person!.photo!),
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
      ),
      title: Text(person.name!),
      subtitle: Text(person.phoneNumber!),
      trailing: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {
          RoomModel room = RoomModel(
            phoneNumber: person.phoneNumber,
            inRoom: false,
            lastChat: '',
            lastDateTime: 0,
            lastUid: '',
            name: person.name,
            photo: person.photo,
            type: '',
            uid: person.uid,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatRoomExample(arguments:{'room': room})),
          );
        },
      ),
    );
  }
}
