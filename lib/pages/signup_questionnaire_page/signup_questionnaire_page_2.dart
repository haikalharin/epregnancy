import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/pages/email_verification_page/email_verification_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import 'bloc/signup_questionnaire_bloc.dart';
import 'package:date_field/date_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

const _horizontalPadding = 30.0;

class SignUpQuestionnairePageTwo extends StatefulWidget {
  const SignUpQuestionnairePageTwo({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _SignUpQuestionnairePageTwo createState() => _SignUpQuestionnairePageTwo();
}

class _SignUpQuestionnairePageTwo extends State<SignUpQuestionnairePageTwo> {

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpQuestionnairePage()),
                      );
                    },
                    child: Image.asset(
                      'assets/back.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Image.asset(
                      "assets/signup_questionnaire_icon.png",
                      height: 220,
                      fit: BoxFit.fitWidth
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jawab Pertanyaan",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Anda akan mendapatkan konten yang sesuai dengan kebutuhan jika menjawab pertanyaan berikut",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Apakah Anda saat ini sedang hamil?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 350,
                                    child: ToggleSwitch(
                                      activeBorders: [
                                        Border.all(
                                          color: HexColor("65E3C5"),
                                          width: 1.0,
                                        ),
                                      ],
                                      activeFgColor: HexColor("65E3C5"),
                                      inactiveBgColor: Colors.white,
                                      inactiveFgColor: HexColor("75B3EB"),
                                      isVertical: true,
                                      minWidth: 150.0,
                                      minHeight: 50,
                                      radiusStyle: true,
                                      cornerRadius: 10.0,
                                      activeBgColors: [
                                        [Colors.white],
                                        [Colors.white],
                                        [Colors.white],
                                        [Colors.white]
                                      ],
                                      labels: ['Ya', 'Tidak, tapi saya sedang merencanakannya', 'Saya sudah punya bayi'],
                                      onToggle: (index) {
                                        print('switched to: $index');
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Text(
                                    "1 dari 2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 350,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => EmailVerificationPage()),
                                        );
                                      },
                                      child: Text("Selanjutnya"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                      )
                  ),
                ]
              )
            ]
          )
        )
    );
  }
}
