import 'dart:io';

import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/entity/chat_message_entity.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gugor_emoji/emoji_picker_flutter.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewChatRoom extends StatefulWidget {
  const NewChatRoom({Key? key, this.chatMessageList, this.pendingChat = false})
      : super(key: key);
  final List<ChatMessageEntity>? chatMessageList;
  final bool? pendingChat;

  @override
  State<NewChatRoom> createState() => _NewChatRoomState();
}

class _NewChatRoomState extends State<NewChatRoom> {
  final ScrollController _scrollController = ScrollController();
  bool isOpenBottomSheet = false;
  FocusNode keyboardFocusNode = FocusNode();
  final TextEditingController _messageEditingController = TextEditingController();

  bool mine = true;
  bool showEmoji = false;

  var list = [
    'Saya punya keluhan, pagi hari perut sering merasa sakit, dan susah untuk bangun tidur',
    'gpp',
    'Yakin ini tidak papa sus ? ',
    'Hal itu wajar di trimester 2'
  ];
  var boolList = [true, false, true, false];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
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
                child: Image.asset('assets/dummies/dummy_avatar.png'),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Puskesmas Duren Tiga',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Toast.show('still in progress');
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
                  itemCount: list.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 100),
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // widget for sender
                    if (boolList[index]) {
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
                                  alignment: (boolList[index]
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: boolList[index] != true
                                              ? Radius.circular(0)
                                              : Radius.circular(20),
                                          bottomRight: boolList[index] != true
                                              ? Radius.circular(20)
                                              : Radius.circular(0)),
                                      color: (boolList[index] != true
                                          ? EpregnancyColors.greyChatBubble
                                          : EpregnancyColors.primer),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      list[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: boolList[index] != true
                                              ? Colors.black
                                              : Colors.white,
                                          overflow: TextOverflow.visible),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                  'assets/dummies/dummy_avatar.png'),
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
                                Image.asset('assets/dummies/dummy_avatar.png'),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment: (boolList[index]
                                    ? Alignment.topRight
                                    : Alignment.topLeft),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: boolList[index] != true
                                            ? Radius.circular(0)
                                            : Radius.circular(20),
                                        bottomRight: boolList[index] != true
                                            ? Radius.circular(20)
                                            : Radius.circular(0)),
                                    color: (boolList[index] != true
                                        ? EpregnancyColors.greyChatBubble
                                        : EpregnancyColors.primer),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    list[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: boolList[index] != true
                                            ? Colors.black
                                            : Colors.white),
                                  ),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
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
                        setState(() {
                          list.add(val);
                          boolList.add(true);
                          _messageEditingController.clear();
                          print('pressed with data : $val');
                        });
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
                duration: Duration(seconds: 1),
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
