import 'package:PregnancyApp/main_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import 'package:date_field/date_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

const _horizontalPadding = 30.0;

class VerificationSuccessPage extends StatefulWidget {
  const VerificationSuccessPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<VerificationSuccessPage> {

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
                      Navigator.of(context).pushNamed(RouteName.signup);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginPage()),
                      // );
                    },
                    child: Image.asset(
                      'assets/back.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 150),
                      Image.asset(
                        "assets/verification_success_icon.png",
                        height: 120,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Verifikasi Berhasil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Anda bisa melanjutkan menggunakan aplikasi ini",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
