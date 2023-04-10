import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/forgot_password_page/forgot_password_page.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/constants/regex_constants.dart';
import '../../common/services/auth_service.dart';
import '../../utils/countly_analytics.dart';
import '../../utils/string_constans.dart';
import '../signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/forgot_password_page_bloc.dart';

const _horizontalPadding = 30.0;

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key, this.otp = ""}) : super(key: key);
  final String? otp;

  @override
  _NewPasswordPage createState() => _NewPasswordPage();
}

class _NewPasswordPage extends State<NewPasswordPage> {
  DateTime? selectedDate;
  bool _isHiddenCurrentPassword = true;
  bool _isHiddenNewPassword = true;
  bool _isHiddenConfirmNewPassword = true;
  final TextEditingController _passwordController = TextEditingController();
  String? passwordText;

  @override
  void initState() {
    CountlyAnalyticsService(context)
        .basicEvent({'key': 'Kata_sandi_baru_page', 'count': 1});
    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<ForgotPasswordPageBloc>().add(ChangeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        userNameController.clear();
       Injector.resolve<ForgotPasswordPageBloc>().add(ForgotPasswordInitEvent());
        Navigator.pop(context);
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: (){
              userNameController.clear();
              Injector.resolve<ForgotPasswordPageBloc>().add(ForgotPasswordInitEvent());
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,

          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: BlocListener<ForgotPasswordPageBloc, ForgotPasswordPageState>(
          listener: (context, state) async {
            if (state.submitStatus == FormzStatus.submissionFailure) {
              var message = state.errorMessage ?? 'gagal';
              final snackBar =
                  SnackBar(content: Text(message), backgroundColor: Colors.red);
              Scaffold.of(context).showSnackBar(snackBar);
            } else if (state.submitStatus == FormzStatus.submissionSuccess &&
                state.typeEvent == 'submitNewPaassword') {
              final snackBar = SnackBar(
                  content: Text("Berhasil"), backgroundColor: Colors.blue);
              Scaffold.of(context).showSnackBar(snackBar);
              await Future.delayed(const Duration(seconds: 1));
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteName.login, (Route<dynamic> route) => false, arguments: {'token_expired': false, 'is_from_register': false});

            }
          },
          child: BlocBuilder<ForgotPasswordPageBloc, ForgotPasswordPageState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/ic_forgot_password.png",
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: _horizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kata Sandi Baru",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(height: 10),
                              const Text(
                                "Silahkan masukan kata sandi baru",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 30),
                              Column(
                                children: [
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        passwordText = value;
                                      });

                                      Injector.resolve<ForgotPasswordPageBloc>()
                                          .add(
                                              ChangeNewPasswordChangedEvent(
                                                  value));
                                    },
                                    controller: _passwordController,
                                    obscureText: _isHiddenNewPassword,
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                      label: Text("Kata Sandi"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.w),
                                      ),
                                      errorText:
                                          state.newPassword.invalid ? "" : null,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          var _isHiddenTap =
                                              _isHiddenNewPassword == true
                                                  ? false
                                                  : true;

                                          setState(() {
                                            _isHiddenNewPassword = _isHiddenTap;
                                          });
                                        },
                                        child: Icon(
                                          _isHiddenNewPassword == true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: _isHiddenNewPassword == true
                                              ? Colors.grey
                                              : EpregnancyColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Material(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              // if(RegExp(RegexConstants.validPasswordlRegex).hasMatch(passwordText ?? "")) {
                                              if ((passwordText?.length ?? 0) >=
                                                  6 && (passwordText?.length ?? 0) <= 128 ) {
                                                return Icon(
                                                  Icons.check_circle_rounded,
                                                  color: EpregnancyColors.primer,
                                                  size: 14.sp,
                                                );
                                              } else {
                                                return Icon(
                                                  Icons.check_circle_rounded,
                                                  color: EpregnancyColors.grey,
                                                  size: 14.sp,
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            "Minimal 6 karakter dan maksimal 128 karakter",
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Builder(builder: (context) {
                                            if (RegExp(RegexConstants
                                                    .validPasswordlRegex)
                                                .hasMatch(passwordText ?? "")) {
                                              return Icon(
                                                Icons.check_circle_rounded,
                                                color: EpregnancyColors.primer,
                                                size: 14.sp,
                                              );
                                            } else {
                                              return Icon(
                                                Icons.check_circle_rounded,
                                                color: EpregnancyColors.grey,
                                                size: 14.sp,
                                              );
                                            }
                                          }),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                                "Setidaknya memiliki 1 huruf dan 1 angka ",
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w300)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Konfirmasi Kata Sandi baru",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                onChanged: (value) {
                                  Injector.resolve<ForgotPasswordPageBloc>().add(
                                      ChangeConfirmNewPasswordChangedEvent(
                                          value));
                                },
                                enabled: state.newPassword.valid,
                                obscureText: _isHiddenConfirmNewPassword,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  label: Text('Konfirmasi Kata Sandi'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorText: state.confirmPassword.invalid ||
                                          state.newPassword.value !=
                                              state.confirmPassword.value
                                      ? 'Password tidak sama'
                                      : null,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      var _isHiddenTap =
                                          _isHiddenConfirmNewPassword == true
                                              ? false
                                              : true;

                                      setState(() {
                                        _isHiddenConfirmNewPassword =
                                            _isHiddenTap;
                                      });
                                    },
                                    child: Icon(
                                      _isHiddenConfirmNewPassword == true
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _isHiddenConfirmNewPassword == true
                                          ? Colors.grey
                                          : EpregnancyColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        BlocBuilder<ForgotPasswordPageBloc,
                            ForgotPasswordPageState>(builder: (context, state) {
                          return Container(
                            height: 60,
                            margin: EdgeInsets.symmetric(
                                horizontal: 22.w, vertical: 16.h),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                CountlyAnalyticsService(context)
                                    .basicEvent({'key': 'Kata_sandi_baru_page_button_konfirmasi_kata_sandi', 'count': 1});
                                print(
                                    'state confirm password value : ${state.confirmPassword.value}');
                                if (state.confirmPassword != null &&
                                    state.newPassword != null &&
                                    state.confirmPassword.value ==
                                        state.newPassword.value) {
                                  Injector.resolve<ForgotPasswordPageBloc>().add(
                                      ForgotPasswordNewPasswordSubmitted(
                                          widget.otp ?? ""));
                                } else if (state.newPassword.value !=
                                    state.confirmPassword.value) {
                                  Toast.show("Konfirmasi password tidak sama!");
                                } else {
                                  Toast.show("Form harus diisi semua");
                                }
                              },
                              child: Text("Konfirmasi Kata Sandi"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    _Loading(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<ForgotPasswordPageBloc, ForgotPasswordPageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                  height: 1000,
                  color: Colors.white.withAlpha(90),
                  child: Center(child: CircularProgressIndicator())),
            ),
          ],
        );
      } else {
        return Text("");
      }
    });
  }
}
