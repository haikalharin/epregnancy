import 'package:PregnancyApp/data/model/event_model/event_model.dart';

class FunctionUtils {
  static Future<bool> checkDate({
    String? startDate,
    String? lastDate,
    String? dateCurrent,
  }) async {
    List<bool> isContaintsList = [];
    try {
      DateTime _startDate = DateTime.parse(startDate ?? "");
      DateTime _endDate = DateTime.parse(lastDate ?? "");
      DateTime _dateCurrent = DateTime.parse(dateCurrent ?? "");
      final differenceInDays = _endDate.difference(_startDate).inDays;

      for (var i = 0; i <= differenceInDays; i++) {
        var newDate =
            new DateTime(_startDate.year, _startDate.month, _startDate.day + i);
        if (newDate == _dateCurrent) {
          isContaintsList.add(true);
        } else {
          isContaintsList.add(false);
        }
      }
      if (isContaintsList.contains(true)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
