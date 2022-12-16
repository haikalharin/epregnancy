import 'dart:async';

import 'package:PregnancyApp/pages/otp_page/bloc/otp_page_bloc.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quiver/async.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/string_constans.dart';
import '../signup_page/bloc/signup_bloc.dart';

const _horizontalPadding = 24.0;

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, this.userId}) : super(key: key);
  final String? userId;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();
  bool isResend = false;
  bool isResendLoading = false;
  int _start = 90;
  int _current = 90;
  bool wrongOtp = false;
  StreamSubscription<CountdownTimer>? sub;


  formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  void startTimer() {
    sub?.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub?.onDone(() {
      isResend = true;
      sub?.pause();
    });
  }

  void restartTimer() {
    sub?.resume();
  }

  @override
  void initState() {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    Injector.resolve<OtpPageBloc>()
        .add(
        RequestResendOtp(true, widget.userId));
    setState(() {
      sub = CountdownTimer(
        const Duration(seconds: 90),
        const Duration(seconds: 1),).listen(null);
    });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("countdown : $_current detik");
    return WillPopScope(
      onWillPop: () {
        Injector.resolve<SignupBloc>().add(SignupInitEvent());
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: BlocListener<OtpPageBloc, OtpPageState>(
            listener: (context, state) {
              if (state.submitStatus == FormzStatus.submissionFailure) {
                setState(() {
                  wrongOtp = true;
                  isResendLoading = false;
                });
                const snackBar = SnackBar(
                    content: Text("OTP Salah"), backgroundColor: Colors.red);
                Scaffold.of(context).showSnackBar(snackBar);
              } else if (state.submitStatus == FormzStatus.submissionSuccess &&
                  state.otpResendSuccess == true) {
                setState(() {
                  isResend = false;
                  isResendLoading = false;
                  _current = 90;
                  _start = 90;
                  sub = CountdownTimer(
                    const Duration(seconds: 90),
                    const Duration(seconds: 1),).listen(null);
                  sub?.resume();
                });
                startTimer();
              } else if (state.submitStatus == FormzStatus.submissionSuccess) {
                // todo navigator select puskesmas & bpjs
                Navigator.of(context)
                    .pushNamed(RouteName.signUpQuestionnairePage);
              } else if (state.submitStatus == FormzStatus.submissionInProgress) {
                setState(() {
                  isResendLoading = true;
                });
              }
            },
            child: SafeArea(
              child: Stack(
                children: [
                  ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Injector.resolve<SignupBloc>().add(SignupInitEvent());
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/back.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    widget.userId!.contains("@") ? "assets/email_otp.png" : "assets/otp_icon.png",
                                    height: 200,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Masukan Kode OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.userId!.contains("@") ? "Ketik kode 6 digit yang telah kami kirimkan ke email" : "Ketik kode 6 digit yang telah kami kirimkan ke ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            Text(
                              widget.userId!.contains("@") ? widget.userId?? "" : "+${widget.userId?.replaceAll("62", "62 ")}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 30.h),
                            OTPTextField(
                                controller: otpController,
                                length: 6,
                                hasError: wrongOtp,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                textFieldAlignment:
                                MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                                outlineBorderRadius: 10,
                                style: TextStyle(fontSize: 25),
                                onChanged: (pin) {
                                  print("Changed: " + pin);
                                },
                                onCompleted: (pin) {
                                  print("Completed: " + pin);
                                  Injector.resolve<OtpPageBloc>()
                                      .add(OtpNumberChanged(pin));
                                }),
                            wrongOtp ? Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w),
                              child: Text("Kode OTP yang Anda masukan salah. Silahkan ketik atau menunggu untuk kirim ulang",
                                maxLines: 2,
                                style: TextStyle(color: Colors.red, fontSize: 12.sp, fontWeight: FontWeight.w300),),
                            ) : const SizedBox.shrink(),
                            SizedBox(height: 20),
                            isResend ? Container() : Column(
                              children: [
                                Text("Menunggu untuk mengirim ulang OTP selama"),
                                SizedBox(height: 10.h,),
                                Text("${formatedTime(timeInSecond: _current)}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.sp),)
                              ],
                            ),
                            SizedBox(height: 20),
                            isResend
                                ? InkWell(
                                onTap: () {
                                  setState(() {
                                    wrongOtp = false;
                                  });
                                  Injector.resolve<OtpPageBloc>()
                                      .add(
                                      RequestResendOtp(true, widget.userId));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: EpregnancyColors.primer),
                                    borderRadius: BorderRadius.circular(12.w)
                                  ),
                                  child: Center(child: isResendLoading ? const CircularProgressIndicator(color: EpregnancyColors.primer) : Text("Kirim Ulang OTP", style: TextStyle(color: EpregnancyColors.primer, fontSize: 14.sp, fontWeight: FontWeight.w500),),),
                                )) : const SizedBox.shrink()
                                // : Text("kirim ulang OTP",
                                // style: TextStyle(
                                //   color: Colors.grey,
                                // ))
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
