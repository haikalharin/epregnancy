import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../utils/epragnancy_color.dart';

class VisitCard extends StatelessWidget {
   VisitCard({Key? key, this.user}) : super(key: key);
   UserVisitModel? user = const UserVisitModel();

  @override
  Widget build(BuildContext context) {
    String outputDate = "";
    DateFormat outputFormat = DateFormat.yMMMMd('id');
    outputDate = outputFormat.format(DateTime.parse(
        user?.user?.lastVisit ?? "0000-00-00"));
    final hours = DateTime.now().difference(DateTime.parse(
        user?.user?.lastVisit ?? "0000-00-00")).inHours;
    if (hours<24){
      outputDate = "$hours yang lalu";
    }
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/1.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:  FadeInImage(
                  placeholder: AssetImage(
                      'assets/ic_no_photo_blue.png'),
                  image: NetworkImage(
                      user?.user?.imageUrl??''),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Text(
                          user?.user?.name??'',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:
                              FontWeight.w700,
                              fontSize: 12.sp),
                        ),
                        Text(
                          outputDate,
                          style: TextStyle(
                              color: EpregnancyColors
                                  .primer,
                              fontSize: 10.sp,
                              fontWeight:
                              FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icMom.svg'),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Kehamilan ${user?.user?.pregnancyWeek??''} Minggu',
                          style: TextStyle(
                              color: EpregnancyColors.primer,
                              fontSize: 10.sp,
                              fontWeight:
                              FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
              color: EpregnancyColors.primerSoft,
              borderRadius: BorderRadius.circular(8.w)
          ),
        ),
      ],
    );
  }
}
