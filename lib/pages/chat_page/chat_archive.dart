import 'dart:io';
import 'dart:ui';


import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'event/event_chat_room.dart';
import '../../data/firebase/event/event_person_example.dart';
import '../../data/firebase/event/event_storage_example.dart';
import 'event/event_user.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/chat_model/chat_model.dart';
import '../../data/model/person_model/person_model.dart';
import '../../data/model/room_model/room_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/notif_controller.dart';
import '../../utils/remote_utils.dart';

class ChatArchive extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const ChatArchive({ Key? key, required this.arguments}) : super(key: key);

  @override
  _ChatArchiveState createState() => _ChatArchiveState();
}

class _ChatArchiveState extends State<ChatArchive> with WidgetsBindingObserver {
  UserModelFirebase? _myPerson;
  Stream<QuerySnapshot>? _streamChat;
  String _inputMessage = '';
  var _controllerMessage = TextEditingController();
  ChatModel? _selectedChat;



  void getSelectedDefault() {
    setState(() {
      _selectedChat = ChatModel(
        dateTime: 0,
        isRead: false,
        message: '',
        type: '',
        uidReceiver: '',
        uidSender: '',
      );
    });
  }

  void getMyPerson() async {
    UserModelFirebase person = await AppSharedPreference.getUserFirebase();
    setState(() {
      _myPerson = person;
    });
    EventChatRoom.setMeInRoom(_myPerson!.uid!, widget.arguments["room"].uid!);
    _streamChat = FirebaseFirestore.instance
        .collection('USERS')
        .doc(_myPerson!.uid)
        .collection('ARCHIVE')
        .doc(widget.arguments["room"].uid)
        .collection('CHAT')
        .snapshots(includeMetadataChanges: true);
  }

  void sendMessage(String type, String message) async {
    if (type == 'text') _controllerMessage.clear();
    if (message != '') {
      ChatModel chat = ChatModel(
        dateTime: DateTime
            .now()
            .microsecondsSinceEpoch,
        isRead: false,
        message: message,
        type: type,
        uidReceiver: widget.arguments["room"].uid,
        uidSender: _myPerson!.uid,
      );

      bool personInRoom = await EventChatRoom.checkIsPersonInRoom(
        myUid: _myPerson!.uid,
        personUid: widget.arguments["room"].uid,
      );
      RoomModel roomSender = RoomModel(
        phoneNumber: _myPerson!.email,
        inRoom: true,
        lastChat: message,
        lastDateTime: chat.dateTime,
        lastUid: _myPerson!.uid,
        name: _myPerson!.name,
        photo: _myPerson!.name,
        type: type,
        uid: _myPerson!.uid,
      );
      RoomModel roomReceiver = RoomModel(
        phoneNumber: widget.arguments["room"].phoneNumber,
        inRoom: personInRoom,
        lastChat: message,
        lastDateTime: chat.dateTime,
        lastUid: _myPerson!.uid,
        name: widget.arguments["room"].name,
        photo: widget.arguments["room"].photo,
        type: type,
        uid: widget.arguments["room"].uid,
      );

      // Sender Room
      bool isSenderRoomExist = await EventChatRoom.checkRoomIsExist(
        isSender: true,
        myUid: _myPerson!.uid,
        personUid: widget.arguments["room"].uid,
      );
      if (isSenderRoomExist) {
        EventChatRoom.updateRoom(
          isSender: true,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
          room: roomSender,
        );
      } else {
        EventChatRoom.addRoom(
          isSender: true,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
          room: roomSender,
        );
      }
      EventChatRoom.addChat(
        chat: chat,
        isSender: true,
        myUid: _myPerson!.uid,
        personUid: widget.arguments["room"].uid,
      );

      // Receiver Room
      bool isReceiverRoomExist = await EventChatRoom.checkRoomIsExist(
        isSender: false,
        myUid: _myPerson!.uid,
        personUid: widget.arguments["room"].uid,
      );
      if (isReceiverRoomExist) {
        EventChatRoom.updateRoom(
          isSender: false,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
          room: roomReceiver,
        );
      } else {
        EventChatRoom.addRoom(
          isSender: false,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
          room: roomReceiver,
        );
      }
      EventChatRoom.addChat(
        chat: chat,
        isSender: false,
        myUid: _myPerson!.uid,
        personUid: widget.arguments["room"].uid,
      );

      String token = await EventUser.getUserToken(
          widget.arguments["room"].uid!);
      if (token != '') {
        await NotifController.sendNotification(
          myLastChat: message,
          myName: _myPerson!.name,
          myUid: _myPerson!.uid,
          personToken: token,
          photo: _myPerson!.name,
          type: type,
        );
      }
      print(token);

      if (personInRoom) {
        EventChatRoom.updateChatIsRead(
          chatId: chat.dateTime.toString(),
          isSender: true,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
        );
        EventChatRoom.updateChatIsRead(
          chatId: chat.dateTime.toString(),
          isSender: false,
          myUid: _myPerson!.uid,
          personUid: widget.arguments["room"].uid,
        );
      }
    }
  }
  void pickAndCropImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {
        EventStorageExample.uploadMessageImageAndGetUrl(
          filePhoto: File(croppedFile.path),
          myUid: _myPerson!.uid,
          personUid:widget.arguments["room"].uid,
        ).then((imageUrl) {
          sendMessage('image', imageUrl);
        });
      }
    }
    getMyPerson();
  }

  void deleteSelectedMessage() {
    if (_selectedChat!.type == 'image') {
      EventStorageExample.deleteOldFile(_selectedChat!.message!);
    }

    EventChatRoom.deleteMessage(
      chatId: _selectedChat!.dateTime.toString(),
      isSender: true,
      myUid: _myPerson!.uid,
      personUid:widget.arguments["room"].uid,
    );
    EventChatRoom.deleteMessage(
      chatId: _selectedChat!.dateTime.toString(),
      isSender: false,
      myUid: _myPerson!.uid,
      personUid:widget.arguments["room"].uid,
    );
    getSelectedDefault();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    getMyPerson();
    getSelectedDefault();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.addObserver(this);
    EventChatRoom.setMeOutRoom(_myPerson!.uid!,widget.arguments["room"].uid!);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('-----------------AppLifecycleState.inactive');
        break;
      case AppLifecycleState.resumed:
        EventChatRoom.setMeInRoom(_myPerson!.uid!,widget.arguments["room"].uid!);
        print('-----------------AppLifecycleState.resumed');
        break;
      case AppLifecycleState.paused:
        EventChatRoom.setMeOutRoom(_myPerson!.uid!,widget.arguments["room"].uid!);
        print('-----------------AppLifecycleState.paused');
        break;

      case AppLifecycleState.detached:
        print('-----------------AppLifecycleState.detached');
        break;
      default:
        print('-----------------default');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                PersonModel person = PersonModel(
                  phoneNumber:widget.arguments["room"].phoneNumber,
                  name:widget.arguments["room"].name,
                  photo:widget.arguments["room"].photo,
                  token: '',
                  uid:widget.arguments["room"].uid,
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
                  image: NetworkImage(widget.arguments["room"].photo!),
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
            SizedBox(width: 8),
            Text(
             widget.arguments["room"].name!,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          SizedBox(
            child: _selectedChat!.message != 'delete' && _selectedChat!.type == 'text'
                ? IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      FlutterClipboard.copy(_selectedChat!.message!)
                          .then((value) => print('copied'));
                      getSelectedDefault();
                    },
                  )
                : null,
          ),
          SizedBox(
            child: _selectedChat!.message != 'delete' &&
                    _selectedChat!.uidSender == _myPerson!.uid
                ? IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteSelectedMessage();
                    },
                  )
                :  Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    deleteChatRoom( widget.arguments["room"].uid!);
                  },
                  child: Icon(
                      Icons.more_vert
                  ),
                )
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _streamChat,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> listChat = snapshot.data!.docs;
                return GroupedListView<QueryDocumentSnapshot, String>(
                  elements: listChat,
                  groupBy: (element) {
                    final data = getDataValue((element.data()));
                    ChatModel? chat = ChatModel.fromJson(data);
                    DateTime chatDateTime =
                        DateTime.fromMicrosecondsSinceEpoch(chat.dateTime!);
                    String dateTime =
                        DateFormat('yyyy/MM/dd').format(chatDateTime);
                    return dateTime;
                  },
                  groupSeparatorBuilder: (value) {
                    String group = '';
                    String today =
                        DateFormat('yyyy/MM/dd').format(DateTime.now());
                    String yesterday = DateFormat('yyyy/MM/dd')
                        .format(DateTime.now().subtract(Duration(days: 1)));
                    if (value == today) {
                      group = 'Today';
                    } else if (value == yesterday) {
                      group = 'Yesterday';
                    } else {
                      group = value;
                    }
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          group,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  itemComparator: (item1, item2) =>
                      item1.id.compareTo(item2.id),
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  indexedItemBuilder: (context, element, index) {
                    final reverseIndex = listChat.length - 1 - index;
                    final data = getDataValue(listChat[reverseIndex].data());
                    ChatModel? chat = ChatModel.fromJson(data);
                    return GestureDetector(
                      onLongPress: () {
                        if (chat.message != '') {
                          setState(() {
                            _selectedChat = chat;
                          });
                        }
                      },
                      onTap: () {
                        getSelectedDefault();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: reverseIndex == listChat.length - 1 ? 80 : 0,
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          16,
                          2,
                          16,
                          2,
                        ),
                        color: _selectedChat!.dateTime == chat.dateTime
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.transparent,
                        child: itemChat(chat),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text('Empty'));
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.blue,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.image, color: Colors.white),
                      onPressed: () {
                        pickAndCropImage();
                      }),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: _inputMessage.contains('\n') ? 4 : 8,
                        horizontal: 16,
                      ),
                      child: TextField(
                        controller: _controllerMessage,
                        maxLines: 3,
                        minLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Message...',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _inputMessage = value;
                          });
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        sendMessage('text', _controllerMessage.text);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemChat(ChatModel chat) {
    DateTime chatDateTime = DateTime.fromMicrosecondsSinceEpoch(chat.dateTime!);
    String dateTime = DateFormat('HH:mm').format(chatDateTime);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: chat.uidSender == _myPerson!.uid
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        SizedBox(
          child: chat.uidSender == _myPerson!.uid && chat.isRead!
              ? Icon(Icons.check, size: 20, color: Colors.blue)
              : null,
        ),
        SizedBox(width: 4),
        SizedBox(
          child: chat.uidSender == _myPerson!.uid
              ? Text(dateTime, style: TextStyle(fontSize: 12))
              : null,
        ),
        SizedBox(width: 4),
        chat.type == 'text' || (chat.message == ''&& chat.type == 'text')
            ? messageText(chat)
            : messageImage(chat),
        SizedBox(width: 4),
        SizedBox(
          child: chat.uidSender ==widget.arguments["room"].uid
              ? Text(dateTime, style: TextStyle(fontSize: 12))
              : null,
        ),
        SizedBox(width: 4),
      ],
    );
  }

  Widget messageText(ChatModel chat) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(
        color: chat.message == 'delete'
            ? Colors.blue.withOpacity(0.3)
            : chat.uidSender == _myPerson!.uid
                ? Colors.blue
                : Colors.blue[800],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            chat.uidSender == _myPerson!.uid ? 10 : 0,
          ),
          topRight: Radius.circular(
            chat.uidSender == _myPerson!.uid ? 0 : 10,
          ),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(8),
      child: ParsedText(
        text: chat.message! == 'delete' ? 'message was deleted' : chat.message!,
        style: TextStyle(
          color: chat.message == 'delete' ? Colors.grey[600] : Colors.white,
        ),
        parse: [
          MatchText(
              type: ParsedType.EMAIL,
              style: const TextStyle(
                color: Colors.yellow,
              ),
              onTap: (url) {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: url,
                );

                launchUrl(emailLaunchUri);
              }),
          MatchText(
              type: ParsedType.URL,
              style: TextStyle(
                color: Colors.yellow,
              ),
              onTap: (url) async {
                var a = await canLaunch(url);
                if (a) launch(url);
              }),
          MatchText(
              type: ParsedType.PHONE,
              style: TextStyle(
                color: Colors.yellow,
              ),
              onTap: (url) {
                launch("tel:" + url);
              }),
        ],
      ),
    );
  }

  Widget messageImage(ChatModel chat) {
    return GestureDetector(
      // onTap: () => showImageFull(chat.message!),
      child: Container(
        decoration: BoxDecoration(
          color:
              chat.uidSender == _myPerson!.uid ? Colors.blue : Colors.blue[800],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              chat.uidSender == _myPerson!.uid ? 10 : 0,
            ),
            topRight: Radius.circular(
              chat.uidSender == _myPerson!.uid ? 0 : 10,
            ),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              chat.uidSender == _myPerson!.uid ? 10 : 0,
            ),
            topRight: Radius.circular(
              chat.uidSender == _myPerson!.uid ? 0 : 10,
            ),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: FadeInImage(
            placeholder: AssetImage('assets/logo_flikchat.png'),
            image: NetworkImage(chat.message!),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
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
    );
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
              title: Text('Akhiri percakapan'),
            ),
            ListTile(
              onTap: () => Navigator.pop(context),
              title: Text(''
                  'kembali'),
            ),
          ],
        );
      },
    );
    if (value == 'delete') {
      final response = await EventChatRoom.archiveRoomChat(myUid: _myPerson!.uid, personUid: personUid);
      if (response) {
        EventChatRoom.deleteChatRoom(
            myUid: _myPerson!.uid, personUid: personUid);
      }
    }
  }

  // void showImageFull(String imageUrl) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Stack(
  //       children: [
  //         PhotoView(
  //           enableRotation: true,
  //           imageProvider: NetworkImage(imageUrl),
  //         ),
  //         Positioned(
  //           top: MediaQuery.of(context).padding.top,
  //           left: 0,
  //           right: 0,
  //           child: AppBar(
  //             backgroundColor: Colors.black.withOpacity(0.5),
  //             leading: IconButton(
  //               icon: Icon(Icons.arrow_back),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
