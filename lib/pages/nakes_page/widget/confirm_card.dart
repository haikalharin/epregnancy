import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';

class ConfirmCard extends StatelessWidget {
  const ConfirmCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const FadeInImage(
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
                      "Mia Andi",
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
                      'Kehamilan 5 Minggu',
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
