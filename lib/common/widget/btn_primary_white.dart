import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/epragnancy_color.dart';

class BtnPrimaryWhite extends StatelessWidget {
  const BtnPrimaryWhite({Key? key, this.function, this.text}) : super(key: key);

  final VoidCallback? function;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: function,
        child: Padding(
          padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
          child: Text(text ?? "", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: EpregnancyColors.primer),),
        ),
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          // onSurface: EpregnancyColors.primer.withOpacity(0.25), // masih bisa dipakai jika perlu
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
