
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static  DateFormat dateFormatForCheckinFilter =  DateFormat('yyyy-MM-dd');

  static DateFormat hourOnly = DateFormat('HH:mm');
  static DateFormat monthOnly = DateFormat.MMMM('id');


  static  DateFormat dateFormatHistory =  DateFormat('dd MMM yyyy . hh:mm');

  static  DateFormat dateFormatWithSpace =  DateFormat('d MMMM yyyy');
  static  DateFormat dateFormatChat =  DateFormat('d MMM yyyy');

}