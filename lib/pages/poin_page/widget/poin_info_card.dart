import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/epragnancy_color.dart';

class PoinInfoCard extends StatelessWidget {
  const PoinInfoCard({Key? key,
  required this.title, required this.subtitle, required this.image, this.game = false}) : super(key: key);
  final String? title;
  final String? image;
  final String? subtitle;
  final bool? game;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80.h,
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h),
        padding: EdgeInsets.only(left: 20.w, top: 16.h, right: 20.w),
        decoration: BoxDecoration(
            color: EpregnancyColors.purpleBg,
            borderRadius: BorderRadius.circular(10.w),
            image: const DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage('assets/circle_shadow.png'),
                fit: BoxFit.contain,
                opacity: 0.25,
                scale: 1.5
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: TextStyle(color: Colors
                .white, fontSize: 12.sp, fontWeight: FontWeight
                .w700),),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle!, style: TextStyle(color: Colors
                    .white, fontSize: 10.sp, fontWeight: FontWeight.w500),),
                game == false ? Expanded(child: Image.asset(image!)) : Image.asset(image!, alignment: Alignment.center,)
              ],
            )
          ],
        )
    );
  }
}
