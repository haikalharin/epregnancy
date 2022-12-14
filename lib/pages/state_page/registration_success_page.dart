import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../common/widget/primary_btn.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessPage> createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 120.w,
                height: 120.w,
                child: Lottie.asset("assets/lottie/success_lottie.json", repeat: false)),
            SizedBox(height: 28.h,),
            Text("Registrasi Berhasil", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.sp),),
            SizedBox(height: 8.h,),
            Text("Anda bisa masuk dengan akun terdaftar\ndi aplikasi", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center)
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: BtnPrimary(
          function: (){Navigator.pop(context);},
          text: "Masuk ke Aplikasi",
        ),
      ),
    );
  }
}
