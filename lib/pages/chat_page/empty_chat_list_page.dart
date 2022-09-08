import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyChatListPage extends StatelessWidget {
  const EmptyChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgEmptyChat.png'),
            SizedBox(height: 35.h,),
            Text(StringConstant.noConsultationYet, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,
            fontSize: 24.sp), textAlign: TextAlign.center,),
            SizedBox(height: 5.h,),
            Text(StringConstant.noConsultationDetail, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,
                fontSize: 16.sp), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
