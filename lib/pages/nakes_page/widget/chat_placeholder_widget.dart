import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';
import '../../../utils/string_constans.dart';

class ChatPlaceHolderWidget extends StatelessWidget {
  const ChatPlaceHolderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: Image.asset('assets/dummies/dummy_avatar.png'),
          ),
          title: Text('Celine Dion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12.sp),),
          subtitle: Row(children: [
            SvgPicture.asset('assets/icMom.svg'),
            SizedBox(width: 10.w,),
            Text('Ibu dengan anak', style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w500),)
          ],),
          trailing: Container(
            height: 16.h,
            width: 16.w,
            decoration: const BoxDecoration(
                color: EpregnancyColors.primer,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Text('1', style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w500),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(StringConstant.topic, style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w500),)),
              Expanded(
                  flex: 6,
                  child: Text('Pantangan, saran, atau mitos tentang kehamilan', style: TextStyle(color: EpregnancyColors.primer, fontSize: 10.sp, fontWeight: FontWeight.w500),)),

            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20.h),
          child:  Divider(color: Colors.grey, height: 1.h),)
      ],
    );

  }
}
