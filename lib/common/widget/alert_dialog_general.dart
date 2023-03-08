import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/epragnancy_color.dart';

AlertDialogGeneral(
  BuildContext context, {
  String title = "",
  String subTitle = "",
  String buttonPrimerText = "",
  String buttonSecondText = "",
  bool isTwoButton = false,
  Function()? functionButtonPrimer,
  Function()? functionButtonSecond,
}) {
  Widget cancelButton = FlatButton(
    minWidth: 200.w,
    height: 40.h,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: EpregnancyColors.primer, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8.w)),
    child: Container(
        child: Text(
      buttonSecondText,
      textAlign: TextAlign.center,
    )),
    onPressed: functionButtonSecond ?? () {},
  );
  Widget continueButton = FlatButton(
    height: 40.h,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
    color: EpregnancyColors.primer,
    textColor: EpregnancyColors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
                child: Text(
          buttonPrimerText,
          textAlign: TextAlign.center,
        ))),
      ],
    ),
    onPressed: functionButtonPrimer ?? () {},
  );
  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        const Text(
          "Pemakaian Kuota Internet",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 32.h,
        ),
        const Text(
          "Memainkan games ini akan menggunakan Kuota Internet",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 8.h),
        width: MediaQuery.of(context).size.width - 20.w,
        child: isTwoButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: cancelButton),
                  SizedBox(width: 8.h),
                  Flexible(flex: 1, child: continueButton),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: continueButton),
                ],
              ),
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: alert);
    },
  );
}
