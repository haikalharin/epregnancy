import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';

import '../../../common/style/custom_text_style.dart';

class ListNotifSeperator extends StatefulWidget {
  const ListNotifSeperator({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  State<ListNotifSeperator> createState() => _ListNotifSeperatorState();
}

class _ListNotifSeperatorState extends State<ListNotifSeperator> {

  late String today = DateFormatter.dateFormatChat.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: blackText12W500(_dateBuilder(widget.date)),
    );
  }

  String _dateBuilder(String date){

    DateTime now = DateTime.now();
    String? yesterday = DateFormatter.dateFormatChat.format(DateTime(now.year, now.month, now.day - 1));

    if(date == today){
      return "Hari ini";
    } else if (date == yesterday) {
      return "Kemarin";
    } else {
      return date;
    }
  }
}
