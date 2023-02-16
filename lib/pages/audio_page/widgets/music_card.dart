import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w)
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.all(13.w),
                decoration: BoxDecoration(
                    color: EpregnancyColors.primerSoft2,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icMusic.svg',
                    color: EpregnancyColors.primer,
                  ),
                ),
            ),
            SizedBox(width: 10.w,),
            Expanded(child: Text(
              "Al-Fatihah", style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
            )),
            SvgPicture.asset("assets/icPlay.svg")
          ],
        ),
      ),
    );

  }
}
