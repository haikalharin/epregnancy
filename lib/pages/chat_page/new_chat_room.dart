import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/entity/chat_message_entity.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/remote_datasource/remote_datasource.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gugor_emoji/emoji_picker_flutter.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/injector/injector.dart';
import '../../data/model/chat_model/chat_pending_send_request.dart';
import '../../env.dart';
import 'bloc/chat_bloc/chat_bloc.dart';

class NewChatRoom extends StatefulWidget {
  const NewChatRoom({Key? key, this.chatMessageList, this.pendingChat = false, this.toName, required this.fromId, required this.toId, required this.toImageUrl})
      : super(key: key);
  final List<ChatMessageEntity>? chatMessageList;
  final String? fromId;
  final String? toId;
  final bool? pendingChat;
  final String? toName;
  final String? toImageUrl;

  @override
  State<NewChatRoom> createState() => _NewChatRoomState();
}

class _NewChatRoomState extends State<NewChatRoom> {
  _NewChatRoomState();
  final ScrollController _scrollController = ScrollController();
  bool isOpenBottomSheet = false;
  FocusNode keyboardFocusNode = FocusNode();
  final TextEditingController _messageEditingController = TextEditingController();

  bool mine = true;
  bool showEmoji = false;
  bool isPendingChat = false;
  String? toName;
  String? toId;
  late WebSocket _webSocket;

  List<ChatMessageEntity>? chatMessageList = [];

  void archiveChatRoom(String personUid) async {
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
      // final response = await EventChatRoom.archiveRoomChat(
      //     myUid: _myPerson!.uid, personUid: personUid);
      // if (response) {
      //   EventChatRoom.deleteChatRoom(
      //       myUid: _myPerson!.uid, personUid: personUid);
      // }
    }
  }

  @override
  void initState() {
    setState(() {
      chatMessageList = widget.chatMessageList;
      toName = widget.toName;
      toId = widget.toId;
      isPendingChat = widget.pendingChat ?? false;
    });
    _initWebSocket();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollDown();
    });
    super.initState();
  }


  @override
  void dispose() {
    _webSocket.close();
    super.dispose();
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  _initWebSocket() async {
    UserModel userModel = await AppSharedPreference.getUser();
    print('initwebsocket run url : ${environment['websockets']}${userModel.id}');
    Future<WebSocket> futureWebSocket = WebSocket.connect(
        '${environment['websockets']}${userModel.id}');
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;
      print('websocket ready state: ' + _webSocket.readyState.toString());

      _webSocket.listen((d) {
        if(widget.toId == null){
          Navigator.pop(context);
        }
        // TODO HANDLE CHAT WEBSOCKET TO ADD TO BUBLE
        // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        _scrollDown();
        String _response = d as String;
        Map<String, dynamic> socketResponse = jsonDecode(_response);
        // ResponseModel<ChatResponse> _chatResponse = ResponseModel.fromJson(d, ChatResponse.fromJson);
        // String? newToName = _chatResponse.data?.to.name;
        String fromIdPayload = socketResponse['data']['from_id'];
        String _toId = socketResponse['data']['to_id'];

        // setState(() {
        //   toId = socketResponse['data']['to_id'];
        // });
        print('ispending chat : $isPendingChat');
        if(socketResponse['action'] == StringConstant.updateLatestChat){
          if(fromIdPayload == widget.toId && _toId == widget.fromId){
            setState(() {
              chatMessageList?.add(
                  ChatMessageEntity(
                    name: socketResponse['data']['id'],
                    message: socketResponse['data']['message'],
                    dateTime: socketResponse['data']['created_date'],
                    mine: socketResponse['data']['from_id'] == widget.fromId ? true : false,
                    profileImage: socketResponse['data']['from_id'] == widget.fromId ? socketResponse['data']['from']['image_url'] : socketResponse['data']['to']['image_url'],
                  )
              );
              // toId = toId;
              isPendingChat = false;
              _scrollDown();
            });
          }
        } else {
          // toId = toId;
          isPendingChat = false;
          Toast.show('harap tekan kembali untuk merefresh percakapan');
        }
        print('ispending chat : $isPendingChat');
        log('websocket payload mentah : $d');
      }, onError: (e) {
        print("error");
        print(e);
      }, onDone: () => print("done"));
    });
  }


  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    print('chat lenght : ${chatMessageList?.length}');
    return Scaffold(
      backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BtnBackIosStyle(),
          title: Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: widget.toImageUrl == null ?  Image.asset('assets/dummies/dummy_avatar.png') : ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                    child: Image.network(widget.toImageUrl!)),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                toName ?? '',
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  archiveChatRoom("personUid");
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chatMessageList?.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // widget for sender
                    if (chatMessageList![index].mine!) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: (chatMessageList![index].mine!
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: chatMessageList![index].mine! != true
                                              ? Radius.circular(0)
                                              : Radius.circular(20),
                                          bottomRight: chatMessageList![index].mine! != true
                                              ? Radius.circular(20)
                                              : Radius.circular(0)),
                                      color: (chatMessageList![index].mine! != true
                                          ? EpregnancyColors.greyChatBubble
                                          : EpregnancyColors.primer),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          chatMessageList![index].message!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: chatMessageList![index].mine! != true
                                                  ? Colors.black
                                                  : Colors.white,
                                              overflow: TextOverflow.visible),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(DateFormatter.hourOnly.format(DateTime.parse(chatMessageList![index].dateTime!)),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: chatMessageList![index].mine! != true
                                                ? Colors.grey
                                                : Colors.white,
                                          ),
                                          textAlign: TextAlign.end,),
                                        )
                                      ],
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: chatMessageList![index].profileImage != null ? CircleAvatar(
                                backgroundImage: NetworkImage(chatMessageList![index].profileImage!, scale: 1.0),
                              ) : Image.asset('assets/dummies/dummy_avatar.png')
                            ),
                          ],
                        ),
                      );
                    } else {
                      // widget for other
                      return Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child:
                                Image.network(chatMessageList![index].profileImage!),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment: (chatMessageList![index].mine!
                                    ? Alignment.topRight
                                    : Alignment.topLeft),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: chatMessageList![index].mine! != true
                                            ? Radius.circular(0)
                                            : Radius.circular(20),
                                        bottomRight: chatMessageList![index].mine! != true
                                            ? Radius.circular(20)
                                            : Radius.circular(0)),
                                    color: (chatMessageList![index].mine! != true
                                        ? EpregnancyColors.greyChatBubble
                                        : EpregnancyColors.primer),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chatMessageList![index].message!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: chatMessageList![index].mine! != true
                                                ? Colors.black
                                                : Colors.white,
                                            overflow: TextOverflow.visible),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(DateFormatter.hourOnly.format(DateTime.parse(chatMessageList![index].dateTime!)),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: chatMessageList![index].mine! != true
                                                ? Colors.grey
                                                : Colors.white,
                                          ),
                                          textAlign: TextAlign.end,),
                                      )
                                    ],
                                  )
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: IconButton(
                            onPressed: () {
                              keyboardFocusNode.unfocus();
                              setState(() {
                                isOpenBottomSheet = !isOpenBottomSheet;
                              });
                            },
                            icon: FaIcon(FontAwesomeIcons.faceSmile)),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _messageEditingController,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (val){
                            if(val.isNotEmpty){
                              if (isPendingChat == false) {
                                print('to_id: $toId');
                                setState(() {
                                  chatMessageList?.add(
                                      ChatMessageEntity(
                                          mine: true,
                                          dateTime: DateTime.now().toString(),
                                          message: val,
                                          name: 'sender'
                                      )
                                  );
                                  _messageEditingController.clear();
                                  _scrollDown();
                                  ChatSendRequest _chatSendRequest = ChatSendRequest(
                                      fromId: widget.fromId, toId: toId, message: val);

                                  Injector.resolve<ChatBloc>().add(SendChatEvent(_chatSendRequest));
                                });
                              } else {
                                Toast.show('Mohon tunggu respon Nakes sebelum membuat chat baru', duration: 3, gravity: 1);
                              }
                            }
                          },
                          focusNode: keyboardFocusNode,
                          onTap: (){
                            if(isOpenBottomSheet){
                              setState(() {
                                isOpenBottomSheet = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 0.5),
                              border: InputBorder.none,
                              hintText: 'Tulis pesan...',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Toast.show('attachment is under construction');
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 12.h),
                          child:SvgPicture.asset('assets/icAttachment.svg')
                          ,
                        ),
                      )
                    ],
                  ),
                ),
                if (isOpenBottomSheet)
                  FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        padding: MediaQuery.of(context).viewInsets,
                        height: 250.h,
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            // Do something when emoji is tapped
                            String? _currentText = _messageEditingController.text;
                            _messageEditingController.text = _currentText + emoji.emoji;
                          },
                          // onBackspacePressed: () {
                          //   if (_messageEditingController.text != null && _messageEditingController.text.length > 0) {
                          //     _messageEditingController.text = _messageEditingController.text.substring(0, _messageEditingController.text.length - 1);
                          //   }
                          // },
                          config: Config(
                              columns: 7,
                              emojiSizeMax: 22 * (Platform.isIOS ? 1.30 : 1.0),
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              verticalSpacing: 0,
                              horizontalSpacing: 0,
                              initCategory: Category.RECENT,
                              bgColor: Color(0xFFF2F2F2),
                              indicatorColor: Colors.blue,
                              iconColor: Colors.grey,
                              iconColorSelected: Colors.blue,
                              progressIndicatorColor: Colors.blue,
                              backspaceColor: Colors.blue,
                              skinToneDialogBgColor: Colors.white,
                              skinToneIndicatorColor: Colors.grey,
                              enableSkinTones: true,
                              showRecentsTab: true,
                              recentsLimit: 28,
                              noRecentsText: "No Recents",
                              noRecentsStyle:
                              const TextStyle(fontSize: 20, color: Colors.black26),
                              tabIndicatorAnimDuration: kTabScrollDuration,
                              categoryIcons: const CategoryIcons(),
                              buttonMode: ButtonMode.MATERIAL),
                        ),
                      ))
              ],
            )
          ],
        ));
  }

  void showEmojiBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext subContext) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            height: 180.h,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                // Do something when emoji is tapped
                print('selected emoji : ${emoji.emoji}');
              },
              onBackspacePressed: () {
                // Backspace-Button tapped logic
                // Remove this line to also remove the button in the UI
              },
              config: Config(
                  columns: 7,
                  emojiSizeMax: 20 * (Platform.isIOS ? 1.30 : 1.0),
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  initCategory: Category.RECENT,
                  bgColor: Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  progressIndicatorColor: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  showRecentsTab: true,
                  recentsLimit: 28,
                  noRecentsText: "No Recents",
                  noRecentsStyle:
                      const TextStyle(fontSize: 20, color: Colors.black26),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL),
            ),
          );
        });
  }
}
