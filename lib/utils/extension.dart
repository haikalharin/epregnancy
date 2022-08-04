

import 'package:flutter/material.dart';

  extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  List<String> toAdd4HoursList(String totalData) {
    int data = 0;
    List<String>? listScheduleTime = [];
    TimeOfDay time = TimeOfDay(hour: 09, minute: 00);
    if (totalData != null && totalData != "") {
      data = int.parse(totalData);
    }
    for (var i = 0; i < data; i++) {

      if (i > 0) {
        time =TimeOfDay(hour:  time.hour + 4, minute: 00);
        if(time.hour > 24){
          time =TimeOfDay(hour:  time.hour%24, minute: 00);
        }

      }
      var timeFix = time.to24hours();
      listScheduleTime.add(timeFix);
    }
    return listScheduleTime;
  }

  String toTimerNotif() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    if(this.hour == 0) {
      return "$min menit";
    } else{
      return "$hour jam $min menit";
    }
  }

}