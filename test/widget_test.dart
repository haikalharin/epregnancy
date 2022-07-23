// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:PregnancyApp/utils/function_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:PregnancyApp/main.dart';

void main() {

  testWidgets('checkdate', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final containt = await FunctionUtils.checkDate(
        startDate: "20220614", lastDate: "20220620", dateCurrent: "20220615");
    // Verify that our counter starts at 0.
    expect(true, containt);
  });
}
