import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewChatRoom extends StatefulWidget {
  const NewChatRoom({Key? key}) : super(key: key);

  @override
  State<NewChatRoom> createState() => _NewChatRoomState();
}

class _NewChatRoomState extends State<NewChatRoom> {
  final ScrollController _scrollController = ScrollController();
  bool mine = true;

  var list = [
    'ini message', 'ada apa ', 'gpp', 'bayi brojol'
  ];
  var boolList = [true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BtnBackIosStyle(),
        title: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/dummies/dummy_avatar.png'),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Puskesma Duren Tiga',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: list.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 100),
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (boolList[index] ? Alignment.topRight : Alignment.topLeft),
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
                    color:
                    (boolList[index] != true ? EpregnancyColors.greyChatBubble : EpregnancyColors.primer),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    list[index],
                    style: TextStyle(
                        fontSize: 15,
                        color: boolList[index] != true ? Colors.black : Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
