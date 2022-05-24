import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/constants/app_constants.dart';

abstract class BaseStateWidget<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context
    );

    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: buildContentView(context),
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildFloatingActionButton(BuildContext context) => const SizedBox();

  Widget buildContentView(BuildContext context);

  AppBar buildAppBar();
}
