import 'package:PregnancyApp/pages/home_page/baby_tracker_detail_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../common/constants/router_constants.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/image_utils.dart';

class ChildSectionWidget extends StatelessWidget {
  ChildSectionWidget(
      {Key? key,
      this.one,
      required this.state,
      required this.tooltipController,
      required this.psTriggerTooltip})
      : super(key: key);
  final GlobalKey? one;
  final HomePageState state;
  final JustTheController tooltipController;
  final PublishSubject<bool> psTriggerTooltip;
  var duration = 0;

  Path defaultTailBuilder(Offset tip, Offset point2, Offset point3) {
    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(point2.dx, point2.dy)
      ..lineTo(point3.dx, point3.dy)
      ..close();
  }

  @override
  Widget build(BuildContext context) {
    return state.showGuide!
        ? Showcase(
            key: one ?? GlobalKey(),
            title: 'Selamat datang !',
            description:
                'Anda akan dengan mudah mengetahui fase kehamilan dengan gambar interaktif yang menunjukkan kondisi janin Anda',
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: EpregnancyColors.white,
                  boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )]),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 8),
                padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: EpregnancyColors.pink),
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Text(
                                    "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.grey[700])
                              ],
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
        :Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: EpregnancyColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )]),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 8),
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Berat",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: EpregnancyColors.greyDarkFontColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),


                    Text(
                      "30",
                      style: TextStyle(
                          fontSize: 24,
                          color: EpregnancyColors.primer,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Normal",
                      style: TextStyle(
                          fontSize: 12,
                          color: EpregnancyColors.greenMight,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: 2,
                  height: 100,
                  color: EpregnancyColors.greyDivider,
                ),
                Column(
                  children: [
                    Text(
                      "Tnggi",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: EpregnancyColors.greyDarkFontColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),


                    Text(
                      "10 cm",
                      style: TextStyle(
                          fontSize: 24,
                          color: EpregnancyColors.primer,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Tidak Sesuai",
                      style: TextStyle(
                          fontSize: 12,
                          color: EpregnancyColors.jingga,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: 2,
                  height: 100,
                  color: EpregnancyColors.greyDivider,
                ),
                Column(
                  children: [
                    Text(
                      "Lingkar kepala",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: EpregnancyColors.greyDarkFontColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),


                    Text(
                      "-",
                      style: TextStyle(
                          fontSize: 24,
                          color: EpregnancyColors.primer,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Tidak ada data",
                      style: TextStyle(
                          fontSize: 12,
                          color: EpregnancyColors.greenMight,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Icon(Icons.arrow_forward_ios,color: EpregnancyColors.primer,size: 18,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
