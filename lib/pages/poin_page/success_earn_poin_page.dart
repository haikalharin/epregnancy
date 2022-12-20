import 'package:PregnancyApp/common/widget/primary_btn.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessEarnPoinPage extends StatelessWidget {
  const SuccessEarnPoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FadeInUp(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4,),
                SvgPicture.asset("assets/ic_earned_poin.svg"),
                SizedBox(height: 36.h,),
                Text("Selamat! Anda", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.sp),),
                Text("mendapatkan 10 Poin", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.sp),),
              ],
            ),
        ),
      ),
      bottomSheet: BtnPrimary(
        function: (){
          Navigator.pop(context, "earned-point");
          Navigator.pop(context, "earned-point");
        },
        text: "Kembali ke Beranda",
      ),
    );
  }
}
