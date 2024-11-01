import 'dart:io';

import 'package:PregnancyApp/common/widget/primary_btn.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pin_checkin/bloc/pin_checkin_bloc.dart';

class SuccessEarnPoinPage extends StatelessWidget {
  const SuccessEarnPoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PinCheckInBloc, PinCheckInState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FadeInUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  SvgPicture.asset("assets/ic_launcher.svg"),
                  SizedBox(
                    height: 36.h,
                  ),
                  state.firstVisit == true
                      ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            "Check-in kunjungan Puskesmas sedang di proses",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22.sp),
                    textAlign: TextAlign.center,
                          ),
                      )
                      : Text(
                          "Hai Bunda,",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp),
                          textAlign: TextAlign.center,
                        ),
                  state.firstVisit == true
                      ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        child: Text(
                            "Bunda dapat menunggu konfirmasi dari Bidan",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22.sp),
                    textAlign: TextAlign.center,
                          ),
                      )
                      : Text(
                          "poin kunjungan Puskesmas sudah diperoleh hari ini. Bunda dapat kembali check-in saat kunjungan berikutnya",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp),
                          textAlign: TextAlign.center,
                        ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: Platform.isIOS ? 16:0),
        child: BtnPrimary(
          function: () {
            Navigator.pop(context, "earned-point");
            Navigator.pop(context, "earned-point");
          },
          text: "Kembali ke Beranda",
        ),
      ),
    );
  }
}
