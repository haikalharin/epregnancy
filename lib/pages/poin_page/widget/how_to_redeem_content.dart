import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/epragnancy_color.dart';

class HowToRedeemCard extends StatelessWidget {
  const HowToRedeemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.circle_rounded, color: Colors.black, size: 10.w,),
            SizedBox(width: 10.w,),
            Text("Lorem Ipsum dolor sit amet", style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.bold),)
          ],),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere aliquam efficitur. Nam placerat dui quis mollis ornare. Nam venenatis vulputate lorem, nec tincidunt ipsum consectetur non. Aliquam vestibulum dictum lacus.",
              maxLines: 5, overflow: TextOverflow.visible, style: TextStyle( color: EpregnancyColors.greyDark, fontSize: 10.sp, fontWeight: FontWeight.w500),),
          )
        ],
      ),
    );
  }
}
