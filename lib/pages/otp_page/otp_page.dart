import 'dart:async';

import 'package:PregnancyApp/pages/otp_page/bloc/otp_page_bloc.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  int _start = 90;
  int _current = 90;
  StreamSubscription<CountdownTimer> sub =  CountdownTimer(
      const Duration(seconds: 90),
      const Duration(seconds: 1),).listen(null);


  void startTimer() {
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      isResend = true;
      sub.cancel();
    });
  }

  @override
  void initState() {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    Injector.resolve<OtpPageBloc>()
        .add(
        RequestResendOtp(true, widget.userId));
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Injector.resolve<SignupBloc>().add(SignupInitEvent());
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: BlocListener<OtpPageBloc, OtpPageState>(
            listener: (context, state) {
              if (state.submitStatus == FormzStatus.submissionFailure) {
                const snackBar = SnackBar(
                    content: Text("OTP Salah"), backgroundColor: Colors.red);
                Scaffold.of(context).showSnackBar(snackBar);
              } else if (state.submitStatus == FormzStatus.submissionSuccess &&
                  state.otpResendSuccess == true) {
                setState(() {
                  isResend = false;
                });
                startTimer();
              } else if (state.submitStatus == FormzStatus.submissionSuccess) {
                Navigator.of(context)
                    .pushNamed(RouteName.signUpQuestionnairePage);
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
                          Navigator.pop(context);
                          Injector.resolve<SignupBloc>().add(SignupInitEvent());
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
                                    "assets/otp_icon.png",
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
                              "Ketik kode 6 digit yang telah kami kirimkan ke",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            Text(
                              widget.userId ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 20),
                            OTPTextField(
                                controller: otpController,
                                length: 6,
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
                            SizedBox(height: 20),
                            isResend ? Container() : Text("$_current detik"),
                            SizedBox(height: 20),
                            isResend
                                ? InkWell(
                                onTap: () {
                                  Injector.resolve<OtpPageBloc>()
                                      .add(
                                      RequestResendOtp(true, widget.userId));
                                },
                                child: Text("kirim ulang OTP", style: TextStyle(
                                    color: EpregnancyColors.primer)))
                                : Text("kirim ulang OTP",
                                style: TextStyle(
                                  color: Colors.grey,
                                ))
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
