
import 'package:intl/intl.dart';

class DateFormatter {
  static  DateFormat dateFormatForCheckinFilter =  DateFormat('yyyy-MM-dd');

  static DateFormat hourOnly = DateFormat('HH:mm');


  static  DateFormat dateFormatHistory =  DateFormat('dd MMM yyyy . hh:mm');

  static  DateFormat dateFormatWithSpace =  DateFormat('d MMMM yyyy');

}