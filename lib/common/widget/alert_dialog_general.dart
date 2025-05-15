import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/epragnancy_color.dart';

void AlertDialogGeneral(
    BuildContext context, {
      String title = "Pemakaian Kuota Internet",
      String subTitle = "Memainkan games ini akan menggunakan Kuota Internet",
      String buttonPrimerText = "",
      String buttonSecondText = "",
      bool isTwoButton = false,
      Function()? functionButtonPrimer,
      Function()? functionButtonSecond,
    }) {
  Widget cancelButton = SizedBox(
    width: 200.w,
    height: 40.h,
    child: TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(
          color: EpregnancyColors.primer,
          width: 1,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      onPressed: functionButtonSecond ?? () {},
      child: Text(
        buttonSecondText,
        textAlign: TextAlign.center,
        style: TextStyle(color: EpregnancyColors.primer),
      ),
    ),
  );

  Widget continueButton = SizedBox(
    height: 40.h,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: EpregnancyColors.primer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
      onPressed: functionButtonPrimer ?? () {},
      child: Center(
        child: Text(
          buttonPrimerText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 32.h),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    actionsPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
    actions: [
      SizedBox(
        width: MediaQuery.of(context).size.width - 20.w,
        child: isTwoButton
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 1, child: cancelButton),
            SizedBox(width: 8.w),
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
    barrierDismissible: false, // supaya tidak bisa dismiss dialog klik di luar
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}
