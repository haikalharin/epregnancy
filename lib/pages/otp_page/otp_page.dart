import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

const _horizontalPadding = 24.0;

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cleaning_services),
          onPressed: () {
            print("Floating button was pressed.");
            otpController.clear();
            // otpController.set(['2', '3', '5', '5', '7']);
            // otpController.setValue('3', 0);
            // otpController.setFocus(1);
          },
        ),
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding,
                ),
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
                    "+62 812891XXX",
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
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
