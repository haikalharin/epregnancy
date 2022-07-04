import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import 'bloc/signup_bloc.dart';

const _horizontalPadding = 24.0;
var _signUpWithEmail = false;
var _signUpWithMobile = false;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

final _codeController = TextEditingController();
var authService = AuthService();


class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) async {
                if (state.status == FormzStatus.submissionFailure) {
                  const snackBar = SnackBar(
                      content: Text("failed"), backgroundColor: Colors.red);
                  Scaffold.of(context).showSnackBar(snackBar);
                } else if (state.status == FormzStatus.submissionSuccess) {
                  if (state.userModelFirebase!.status == 'Active') {
                    Navigator.of(context).pushNamed(RouteName.navBar);
                  } else {
                    Navigator.of(context).pushNamed(RouteName.surveyPage);
                  }
                }
              },
              child: Stack(
                children: [
                  Center(
                    child: BlocBuilder<SignupBloc, SignupState>(
                      builder: (context, state) {
                        return ListView(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: _horizontalPadding,
                          ),
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                "assets/signup_background.png",
                                alignment: Alignment.center,
                                height: 280,
                              ),
                            ),
                            // Image.asset(
                            //   'assets/signup_background.png',
                            // ),
                            Text(
                              "Selamat Datang",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 38,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Daftar dengan akun telepon seluler",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            IntlPhoneField(
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              initialCountryCode: 'ID',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Kamu akan menerima verifikasi SMS untuk masuk ke akun",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Atau daftar dengan akun email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            _EmailInput(),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => OtpPage()),
                                );
                              },
                              child: Text("Daftar/Masuk"),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(50, 50),
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            // _PasswordTextField(),
                          ],
                        );
                      },
                    ),
                  ),
                  _Loading(),
                ],
              ))),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      if (state.status == FormzStatus.submissionInProgress) {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (username) =>
              Injector.resolve<SignupBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'email@mail.com',
            errorText: state.username.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}
