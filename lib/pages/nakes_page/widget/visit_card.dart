import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../utils/epragnancy_color.dart';

class VisitCard extends StatelessWidget {
   VisitCard({Key? key, this.user}) : super(key: key);
   UserVisitModel? user = const UserVisitModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    var safeHeight = height - padding.top - padding.bottom;
    var safeWidth = width - padding.left - padding.right;
    String outputDate = "";
    DateFormat outputFormat = DateFormat.yMMMMd('id');
    outputDate = outputFormat.format(DateTime.parse(
        user?.createdDate ?? "0000-00-00"));
    DateFormat formatFixing = DateFormat('yyyy-MM-dd HH:mm:ss');
    var dateNow = DateTime.parse(formatFixing.format(DateTime.now()));
    var createDate = DateTime.parse(formatFixing.format(DateTime.parse(
        user?.createdDate ?? "0000-00-00")));
    final hours = dateNow.difference(createDate).inHours;
    final minutes = dateNow.difference(createDate).inMinutes;
    if (hours<24){
      if(minutes<60){
        outputDate = "$minutes menit yang lalu";
      }else {
        outputDate = "$hours jam yang lalu";
      }
    }
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/1.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:  user?.user?.imageUrl!= null? FadeInImage(
                  placeholder: AssetImage(
                      'assets/ic_no_photo_blue.png'),
                  image: NetworkImage(
                      user?.user?.imageUrl??''),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ):FadeInImage(
                  placeholder: AssetImage(
                      'assets/ic_no_photo_blue.png'),
                  image: AssetImage(
                      'assets/ic_no_photo_blue.png'),
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
                    Container(
                      width: safeWidth/1.6,
                      child: Row(
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
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              outputDate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: EpregnancyColors
                                      .primer,
                                  fontSize: 10.sp,
                                  fontWeight:
                                  FontWeight.w500),
                            ),
                          )
                        ],
                      ),
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
                          'Kehamilan ${user?.user?.pregnancyWeek??'0'} Minggu',
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
