import 'dart:convert';
import 'dart:io';

import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:intl/intl.dart';

class FunctionUtils {
  static Future<List<EventModel>> getCheckDate({
    List<EventModel> listEvent = const [],
    DateTime? date
  }) async {
    List<EventModel> listEventFix = [];
    var outputFormat = DateFormat('yyyy-MM-dd');
    var dateCurent = outputFormat.format(date?? DateTime.now());
    try{
      listEvent.forEach((element) async {
        var isContain = await FunctionUtils.checkDate(
            startDate: element.startDate,
            lastDate: element.endDate,
            eventDate: element.date,
            dateCurrent: dateCurent);

        if (isContain) {
          listEventFix.add(element);
        }
      });
      return listEventFix;
    }catch (e) {
      print(e);
      return listEventFix;
    }
  }
  static Future<bool> checkDate({
    String? startDate,
    String? lastDate,
    String? dateCurrent,
    String? eventDate,
  }) async {
    List<bool> isContaintsList = [];
    try {
      DateTime _startDate = DateTime.parse(startDate ?? "");
      DateTime _endDate = DateTime.parse(lastDate ?? "");
      DateTime _dateCurrent = DateTime.parse(dateCurrent ?? "");
      DateTime? _eventDate = DateTime.parse(eventDate ?? startDate!);
      final differenceInDays = _endDate.difference(_startDate).inDays;
      // for (var i = 0; i <= differenceInDays; i++) {
      //   var newDate = new DateTime(_startDate.year, _startDate.month, _startDate.day + i);
      //   print("newdate : $newDate");
      //   print("datecurrent : $_dateCurrent");
      //   if (newDate == _dateCurrent) {
      //     isContaintsList.add(true);
      //   } else {
      //     isContaintsList.add(false);
      //   }
      // }

      if (eventDate != null) {
        if(_eventDate == _dateCurrent){
          isContaintsList.add(true);
        } else {
          isContaintsList.add(false);
        }
      } else {
        for (var i = 0; i <= differenceInDays; i++) {
          print('date loop $i');
          var newDate = new DateTime(_startDate.year, _startDate.month, _startDate.day + i);
          if (newDate == _dateCurrent) {
            isContaintsList.add(true);
          } else {
            isContaintsList.add(false);
          }
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

  static Future<List<EventModel>> sortDate({
    List<EventModel> listEvent  = const [],
  }) async {
    try {
      DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
      listEvent.sort((a, b) => format
          .parse(b.createdDate ?? "")
          .compareTo(format.parse(a.createdDate ?? "")));
      return listEvent;

    } catch (e) {
      print(e);
      return listEvent;
    }
  }
}

String convertImageToBase64(String filePath) {
  File file = File(filePath);
  List<int> imageBytes = file.readAsBytesSync();
  String base64Image = base64Encode(imageBytes);
  return base64Image;
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
