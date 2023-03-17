import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import '../../utils/string_constans.dart';
import '../change_password_page/bloc/change_password_bloc.dart';
import '../signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'bloc/forgot_password_page_bloc.dart';

const _horizontalPadding = 30.0;
final userNameController = TextEditingController();
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {

  DateTime? selectedDate;

  bool _isHiddenNewPassword = true;
  bool _isHiddenConfirmNewPassword = true;

  @override
  void dispose() {
    userNameController.clear();
    Injector.resolve<ForgotPasswordPageBloc>()
        .add(const ForgotPasswordInitEvent());
    super.dispose();
  }

  @override
  void initState() {
    userNameController.clear();
    Injector.resolve<ForgotPasswordPageBloc>().add(ForgotPasswordInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: ElevatedButton(
          onPressed: () async {
            Injector.resolve<ForgotPasswordPageBloc>()
                .add(const ForgotPasswordSubmitted());
          },
          child: Text("Kirim"),
          style: ElevatedButton.styleFrom(
            primary: EpregnancyColors.primer,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      body: BlocListener<ForgotPasswordPageBloc, ForgotPasswordPageState>(
        listener: (context, state) async {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            var message = '${state.typeMessage} tidak tersedia';
            final snackBar =
                SnackBar(content: Text(message), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess &&
              state.typeEvent == 'checkUserExist') {
            final snackBar = SnackBar(
                content: Text(
                    "OTP berhasil dikirim, Silahkan cek ${state.typeMessage == "Nomor" ? "kotak pesan" : "email"} anda"),
                backgroundColor: Colors.blue);
            Scaffold.of(context).showSnackBar(snackBar);
            await Future.delayed(const Duration(seconds: 1));
            Navigator.of(context).pushNamed(RouteName.otpPage, arguments: {
              'username': state.userName.value,
              'from': "forgotPassword"
            });
          }
        },
        child: BlocBuilder<ForgotPasswordPageBloc, ForgotPasswordPageState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/back.png',
                          fit: BoxFit.cover,
                        ),
                      ),
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
                              "Lupa Kata Sandi ?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              "Silahkan isi email untuk mendapatkan tautan verifikasi dan masukan OTP",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              controller: userNameController,
                              onChanged: (value) {
                               var username = "";
                                if(!state.userName.value.contains("@") &&  value.contains("0",0)){
                                  username = value.replaceFirst("0","62");
                                } else{
                                  username = value;
                                }
                                Injector.resolve<ForgotPasswordPageBloc>()
                                    .add(EmailChangedEvent(username));
                              },
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                label: Text("Email"),
                                hintText:
                                    'email@mail.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  _Loading()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
