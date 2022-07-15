import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
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

  @override
  void initState() {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.signup);
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
                        mainAxisAlignment : MainAxisAlignment.center,
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
                        widget.userId??"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      OTPTextField(
                          controller: otpController,
                          length: 5,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 10,
                          style: TextStyle(fontSize: 25),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpQuestionnairePage()),
                            );
                          }),
                    ]
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
