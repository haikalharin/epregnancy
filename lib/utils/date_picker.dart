import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DatePickerUtils {
  static Future<DateTime?> getDate(BuildContext context, DateTime dateTime,
      {DateTime? firstDate, DateTime? endDate, String? fieldLabelText }) {
    return showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: dateTime,
      firstDate: firstDate ?? DateTime(1945),
      lastDate: endDate ?? DateTime(2100),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: fieldLabelText ?? 'Date of Birth',
      fieldHintText: 'Month/Date/Year',
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData(
            accentColor: Colors.black,
            colorScheme:
                const ColorScheme.light(primary: EpregnancyColors.primer),
            dialogBackgroundColor: Colors.white,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: child,
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
