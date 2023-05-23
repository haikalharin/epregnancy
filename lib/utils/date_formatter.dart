
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static  DateFormat dateFormatForCheckinFilter =  DateFormat('yyyy-MM-dd');

  static DateFormat hourOnly = DateFormat('HH:mm');
  static DateFormat monthOnly = DateFormat.MMMM('id');

  static  DateFormat dateFormatHistory =  DateFormat('dd MMM yyyy . HH:mm');

  static  DateFormat dateFormatWithSpace =  DateFormat('d MMMM yyyy');
  static  DateFormat dateFormatdMMyyyy =  DateFormat('d MMM yyyy');
  static  DateFormat dateFormatChat =  DateFormat('d MMM yyyy', 'id');
  static  DateFormat dateFormatChatToday =  DateFormat('HH:mm');
  static  DateFormat dateWithDay =  DateFormat.yMMMMEEEEd('id');


}