import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointCheckedIn extends StatelessWidget {
  const PointCheckedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: EpregnancyColors.blueDark
        ),
        child: Center(
          child: Icon(Icons.check_circle_rounded, color: Colors.white, size: 20.w,),
        )
    );
  }
}
