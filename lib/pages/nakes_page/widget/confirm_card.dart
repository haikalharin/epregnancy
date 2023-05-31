import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/model/user_visit_model/user_visit_model.dart';
import '../../../utils/epragnancy_color.dart';

class ConfirmCard extends StatelessWidget {
  const ConfirmCard({Key? key, this.userVisitModel}) : super(key: key);
  final UserVisitModel? userVisitModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: userVisitModel?.user?.imageUrl!= null? FadeInImage(
              placeholder: const AssetImage(
                  'assets/ic_no_photo_blue.png'),
              image:  NetworkImage(
                  userVisitModel?.user?.imageUrl??''),
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
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text(
                      userVisitModel?.user?.name??'',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight:
                          FontWeight.w700,
                          fontSize: 12.sp),
                    ),
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
                      'Kehamilan ${ userVisitModel?.user?.pregnancyWeek??'0'} Minggu',
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
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          color: EpregnancyColors.greyText.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.w)
      ),
    );
  }
}
