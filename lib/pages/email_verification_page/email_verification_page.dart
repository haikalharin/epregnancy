import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';


const _horizontalPadding = 30.0;

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<EmailVerificationPage> {

  DateTime? selectedDate;

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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpQuestionnairePageTwo()),
                      );
                    },
                    child: Image.asset(
                      'assets/back.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30),
                      Image.asset(
                        "assets/email_verification_icon.png",
                        height: 220,
                      ),
                      Text(
                        "Verifikasi Akun Anda",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Klik tautan dalam email yang kami kirimkan ke",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                      Text(
                        "abc@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "ntuk verifikasi akun",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                      SizedBox(height: 60),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => EmailVerificationPage()),
                            );
                          },
                          child: Text("Ke aplikasi email"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => EmailVerificationPage()),
                            );
                          },
                          child: Text("Lewati sekarang"),
                          style: ElevatedButton.styleFrom(
                            primary: HexColor("#F1F6FB"),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ]
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
