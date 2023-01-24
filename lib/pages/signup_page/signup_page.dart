import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:PregnancyApp/common/constants/regex_constants.dart';
import 'package:PregnancyApp/main_default.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
FocusNode _phoneFocusNode = FocusNode();
FocusNode _emailFocusNode = FocusNode();

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPhone = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    _phoneFocusNode.addListener(_onFocusPhoneNumberChange);
    _emailFocusNode.addListener(_onFocusEmailChange);
    super.initState();
  }

  @override
  Future<void> dispose() async {
    Injector.resolve<SignupBloc>().add(SignupInitEvent());
    _phoneFocusNode.removeListener(_onFocusPhoneNumberChange);
    _emailFocusNode.removeListener(_onFocusEmailChange);
    super.dispose();
  }

  bool phoneIsFocus = false;
  bool emailIsFocus = false;

  void _onFocusPhoneNumberChange() {
    debugPrint("Focus: ${_phoneFocusNode.hasFocus.toString()}");
    setState(() {
      phoneIsFocus = _phoneFocusNode.hasFocus;
    });
  }

  void _onFocusEmailChange() {
    debugPrint("Focus: ${_emailFocusNode.hasFocus.toString()}");
    setState(() {
      emailIsFocus = _emailFocusNode.hasFocus;
    });
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
                      Navigator.of(context)
                          .pushNamed(RouteName.surveyPage, arguments: false);
                    }
                  } else {
                    if (state.type == 'toDisclaimer') {
                      Navigator.of(context).pushNamed(RouteName.disclaimer,
                          arguments: {'user_id': state.userId, 'from': "signUp"});
                    } else {
                      // Navigator.of(context).pushNamed(RouteName.otpPage, arguments: state.userId);
                    }
                  }
                }
              },
              child: Stack(
                children: [
                  Center(
                    child: BlocBuilder<SignupBloc, SignupState>(
                      builder: (context, state) {
                        if (isEdit) {
                          _controllerEmail.text = "";
                          _controllerPhone.text = "";
                          isEdit = false;
                        }

                        return ListView(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: _horizontalPadding,
                          ),
                          children: [
                            Hero(
                              tag: 'ibu',
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
                            state.email.value.length < 1 ||
                                    state.email ==
                                        EmailAddressUsernameValidator.pure()
                                ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      Text(
                                        "Daftar dengan akun telepon seluler",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 20),
                                      _PhoneNumberInput(_controllerPhone, phoneIsFocus),
                                      // Text(
                                      //   "Kamu akan menerima verifikasi SMS untuk masuk ke akun",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.normal,
                                      //       fontSize: 12),
                                      // ),
                                      SizedBox(height: 10),
                                    ],
                                  )
                                : Container(),

                            state.phoneNumber.value.length <= 2 ||
                                    state.email == PhoneValidator.pure()
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: state.email.value.isNotEmpty ? 0: 30),
                                      Text(
                                        state.email.value.isNotEmpty ? "Daftar dengan akun email" : "Atau daftar dengan akun email",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 30),
                                      // Text(
                                      //   "Email",
                                      //   style: TextStyle(
                                      //       color: Colors.black,
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 16),
                                      // ),
                                      // SizedBox(height: 10),
                                      _EmailInput(_controllerEmail, emailIsFocus),
                                      SizedBox(height: 50),
                                    ],
                                  )
                                : Container(),
                            // _PasswordTextField(),
                          ],
                        );
                      },
                    ),
                  ),
                  _Loading(),
                ],
              ))),
      bottomNavigationBar: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state){
          return Container(
            margin: EdgeInsets.all(24.w),
            child: ElevatedButton(
              onPressed: state.phoneNumber.valid || state.email.valid ? () async {
            Injector.resolve<SignupBloc>()
                .add(SignupSubmitted());
            isEdit = true;
            FocusScope.of(context).unfocus();                                //
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => OtpPage()),
            // );
            } : null,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text("Daftar", style: TextStyle(fontSize: 14.sp),),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 50),
                primary: EpregnancyColors.primer,
                onSurface: EpregnancyColors.primer.withOpacity(0.25),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          );
        },
      ),
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
  _EmailInput(this._controllerEmail, this.emailFocus);
  bool? emailFocus;
  final TextEditingController _controllerEmail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          focusNode: _emailFocusNode,
          controller: _controllerEmail,
          key: const Key('SignupForm_emailInput_textField'),
          onChanged: (username) => Injector.resolve<SignupBloc>()
              .add(SignupUsernameChanged(username)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 21.0, left: 16.w, right: 10.0, bottom: 21.0),
            fillColor: EpregnancyColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(color: EpregnancyColors.primer),
            ),
//            prefixIcon: Icon(
//              Icons.attach_money,
//              color: AppColor.warna_teks_sub,
//            ),
            hintStyle: TextStyle(color: EpregnancyColors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EpregnancyColors.primer, width: 2),
              borderRadius: BorderRadius.circular(4.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EpregnancyColors.grey),
              borderRadius: BorderRadius.circular(4.w),
            ),
            label: const Text('Email'),
            labelStyle: emailFocus ?? false ? TextStyle(fontSize: 14.sp) : TextStyle(fontSize: 14.sp, color: EpregnancyColors.greyText),
            errorText: state.email.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  _PhoneNumberInput(this._controllerPhone, this.phoneFocusNode);
  bool? phoneFocusNode;
  final TextEditingController _controllerPhone;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return TextField(
          maxLength: 13,
          focusNode: _phoneFocusNode,
          keyboardType: TextInputType.number,
          controller: _controllerPhone,
          style: TextStyle(fontSize: 14.sp),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(RegexConstants.validPhoneFirstNotZeroRegex)),
          ],
          key: const Key('SignupForm_PhoneInput_textField'),
          onChanged: (phone) => Injector.resolve<SignupBloc>()
              .add(SignupPhoneNumberChanged("62${phone}")),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 30.h, left: 10.0, right: 10.0, bottom: 10.h),
            fillColor: EpregnancyColors.white,
            filled: true,
            counter: const SizedBox.shrink(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(color: EpregnancyColors.primer),
            ),
//            prefixIcon: Icon(
//              Icons.attach_money,
//              color: AppColor.warna_teks_sub,
//            ),
            hintStyle: TextStyle(color: EpregnancyColors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EpregnancyColors.primer, width: 2),
              borderRadius: BorderRadius.circular(4.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: EpregnancyColors.grey),
              borderRadius: BorderRadius.circular(4.w),
            ),
            prefixIcon: Container(
              // padding: EdgeInsets.only(left: 10.w, top: 10.h),
              height: 20.h,
                width: 20.w,
                padding: EdgeInsets.only(left: 10.w, bottom: 1.5.h),
                child: Center(child: Text("+62", style: TextStyle(color: Colors.black, fontSize: 14.sp),))),
            label: const Text("Nomor Handphone"),
            labelStyle: phoneFocusNode ?? false ? TextStyle(fontSize: 14.sp) : TextStyle(fontSize: 14.sp, color: EpregnancyColors.greyText),
            errorText: state.phoneNumber.invalid ? 'Format nomor salah' : null,
          ),
        );
      },
    );
  }
}
