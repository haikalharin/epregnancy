import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import '../signup_page/bloc/signup_bloc.dart';

const _horizontalPadding = 24.0;

class VerifikasiPage extends StatefulWidget {
  const VerifikasiPage({Key? key, this.userId}) : super(key: key);
  final String? userId;

  @override
  _VerifikasiPageState createState() => _VerifikasiPageState();
}

class _VerifikasiPageState extends State<VerifikasiPage> {
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/ic_verifikasi.png",
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Verifikasi Akun Anda",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Klik tautan dalam email yang kami kirimkan ke '),
                              TextSpan(
                                  text: widget.userId ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const TextSpan(text: ' untuk verifikasi akun'),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                      ]),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment(0, 1),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10),
                        width: MediaQuery.of(context)
                            .size
                            .width -
                            40,
                        // height: 50,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: RaisedButton(
                                color:
                                    EpregnancyColors
                                    .primer,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Ke aplikasi email",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        Colors.white),
                                  ),
                                ),
                                elevation: 8,
                                shape:
                                const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          7)),
                                ),
                                onPressed: () async {

                                },
                              ),
                            ),
                            SizedBox(height: 16,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: RaisedButton(
                                color:
                                EpregnancyColors
                                    .greyBlue,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Lewati sekarang",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        Colors.black),
                                  ),
                                ),
                                elevation: 8,
                                shape:
                                const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          7)),
                                ),
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUpQuestionnairePage()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
