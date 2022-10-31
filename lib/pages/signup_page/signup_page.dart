import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:PregnancyApp/common/constants/regex_constants.dart';
import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import '../../common/validators/email_address_username_validator.dart';
import '../../common/validators/phone_validator.dart';
import '../../utils/string_constans.dart';
import 'bloc/signup_bloc.dart';

const _horizontalPadding = 24.0;
var _signUpWithEmail = false;
var _signUpWithMobile = false;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

final _codeController = TextEditingController();
var authService = AuthService();

class _SignUpPageState extends State<SignUpPage> {

   final TextEditingController _controllerEmail = TextEditingController() ;
   final TextEditingController _controllerPhone = TextEditingController() ;
  bool isEdit = false;

  @override
  void initState() {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());

    super.initState();
  }

  @override
  Future<void> dispose() async {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) async {
                if (state.submitStatus == FormzStatus.submissionFailure) {
                  var snackBar = SnackBar(
                      content: Text(state.errorMessage != null
                          ? state.errorMessage!
                          : 'failed'),
                      backgroundColor: Colors.red);
                  Scaffold.of(context).showSnackBar(snackBar);
                } else if (state.submitStatus ==
                    FormzStatus.submissionSuccess) {
                  if (state.isExist == true) {
                    if (state.isSurvey == true) {
                      var snackBar = SnackBar(
                          content: Text("Akun Telah Terdaftar"),
                          backgroundColor: Colors.red);
                      Injector.resolve<SignupBloc>().add(SignupInitEvent());
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.of(context).pushNamed(RouteName.surveyPage,arguments: false);
                    }
                  } else {
                    if (state.type == 'toRequestOtp' ) {
                      if (state.userId!.contains('@')) {
                        Injector.resolve<SignupBloc>().add(const RequestOtp(true));
                      } else {
                        Injector.resolve<SignupBloc>().add(const RequestOtp(false));
                      }
                    } else {
                      Navigator.of(context).pushNamed(RouteName.otpPage);
                    }
                  }
                }
              },
              child: Stack(
                children: [
                  Center(
                    child: BlocBuilder<SignupBloc, SignupState>(
                      builder: (context, state) {
                        if(isEdit){
                          _controllerEmail.text = "";
                          _controllerPhone.text = "";
                          isEdit =false;
                        }

                        return ListView(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: _horizontalPadding,
                          ),
                          children: [
                            Image.asset(
                              "assets/signup_background.png",
                              alignment: Alignment.center,
                              height: 280,
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
                            state.email.value.length < 1|| state.email == EmailAddressUsernameValidator.pure()
                                ? Column(
                                    children: [
                                      Text(
                                        "Daftar dengan akun telepon seluler",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 20),
                                      IntlPhoneField(
                                        controller: _controllerPhone,
                                        validator: (_val){
                                          // if(_val?.completeNumber[0] != "8"){
                                          //   print("_val : ${_val?.completeNumber}");
                                          //   return "Format Nomor Salah";
                                          // } else {
                                          //   return null;
                                          // }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(RegexConstants
                                                  .validPhoneFirstNotZeroRegex)),
                                        ],
                                        decoration: InputDecoration(
                                          labelText: 'Mobile Number',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorText: state.phoneNumber.invalid
                                              ? 'Format nomor salah'
                                              : null,
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        initialCountryCode: 'ID',
                                        onChanged: (phone) {
                                          Injector.resolve<SignupBloc>().add(
                                              SignupPhoneNumberChanged(
                                                  "0${phone.number}"));
                                        },
                                      ),
                                      Text(
                                        "Kamu akan menerima verifikasi SMS untuk masuk ke akun",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  )
                                : Container(),

                            state.phoneNumber.value.length <= 1 || state.email == PhoneValidator.pure()
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:  [
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
                                      _EmailInput(_controllerEmail),
                                      SizedBox(height: 50),
                                    ],
                                  )
                                : Container(),

                            ElevatedButton(
                              onPressed: () async {
                                Injector.resolve<SignupBloc>()
                                    .add(SignupSubmitted());
                                isEdit = true;
                                //
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => OtpPage()),
                                // );
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
      if (state.submitStatus == FormzStatus.submissionInProgress) {
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
   const _EmailInput(this._controllerEmail);
  final TextEditingController _controllerEmail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          controller: _controllerEmail,
          key: const Key('SignupForm_emailInput_textField'),
          onChanged: (username) => Injector.resolve<SignupBloc>()
              .add(SignupUsernameChanged(username)),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'email@mail.com',
            errorText: state.email.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}
