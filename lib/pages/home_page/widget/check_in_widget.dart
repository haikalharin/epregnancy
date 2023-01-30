import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/epragnancy_color.dart';

class CheckinWidget extends StatelessWidget {
  const CheckinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: EpregnancyColors.grey),
          borderRadius: BorderRadius.circular(8.w)
      ),
      child: Column(
        children: [
          Text("Kunjungan ke Puskesmas", style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),),
          SizedBox(height: 4.h,),
          Text("Klik tombol ini untuk memulai kunjungan Anda", style: TextStyle(color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.w400),),
          SizedBox(height: 16.h,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: (){
                // todo checkin puskesmas
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 11.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_rounded, color: Colors.white,),
                    SizedBox(width: 9.w,),
                    Text("Check-in Kunjungan", style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w700),)
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: EpregnancyColors.primer,
                onSurface: EpregnancyColors.primer.withOpacity(0.25),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
