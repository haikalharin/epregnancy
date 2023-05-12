import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        title: blackText16("Notifikasi"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 16.w, vertical: 8.h),
              child: blackText12W500("Hari ini"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              decoration: const BoxDecoration(
                color: EpregnancyColors.primer,
                  border: Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1,), bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackText16("Anda mendapatkan 500 poin"),
                  SizedBox(height: 5.h,),
                  blackText12W500("Selamat! Anda baru saja mendapatkan 500 Poin dari Check-in hari ini.")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1,), bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackText16("Anda mendapatkan 500 poin"),
                  SizedBox(height: 5.h,),
                  blackText12W500("Selamat! Anda baru saja mendapatkan 500 Poin dari Check-in hari ini.")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 16.w, vertical: 8.h),
              child: blackText12W500("Kemarin"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1,), bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackText16("Anda mendapatkan 500 poin"),
                  SizedBox(height: 5.h,),
                  blackText12W500("Selamat! Anda baru saja mendapatkan 500 Poin dari Check-in hari ini.")
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
