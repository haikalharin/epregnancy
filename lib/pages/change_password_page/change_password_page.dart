import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import '../signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'bloc/change_password_bloc.dart';

const _horizontalPadding = 30.0;

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _ChangePasswordPage createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  DateTime? selectedDate;
  bool _isHiddenCurrentPassword = true;
  bool _isHiddenNewPassword = true;
  bool _isHiddenConfirmNewPassword = true;

  @override
  void dispose() {
    Injector.resolve<ChangePasswordBloc>()
        .add(ChangeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) async {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            var message = state.errorMessage?? '';
            final snackBar =
            SnackBar(content: Text(message), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess) {
            final snackBar =
            SnackBar(content: Text("Berhasil"), backgroundColor: Colors.blue);
            Scaffold.of(context).showSnackBar(snackBar);
            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);

          }
        },
        child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
                      Image.asset("assets/signup_questionnaire_icon.png",
                          height: 220, fit: BoxFit.fitWidth),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: _horizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ganti Kata Sandi",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              "Kata Sandi harus terdiri dari angka, huruf Besar dan kecil, dan karakter spesial",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 30),
                            const Text(
                              "Kata Sandi Sekarang",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: _isHiddenCurrentPassword,
                              onChanged: (value) {
                                Injector.resolve<ChangePasswordBloc>()
                                    .add(ChangeCurrentPasswordChanged(value));
                              },
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Masukan kata sandi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorText: state.currentPassword.invalid ? state.currentPassword.invalidPassword : null,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                   var  _isHiddenTap = _isHiddenCurrentPassword == true ? false : true;

                                   setState(() {
                                     _isHiddenCurrentPassword =_isHiddenTap;
                                   });
                                  },
                                  child: Icon(
                                    _isHiddenCurrentPassword == true ? Icons.visibility_off : Icons.visibility,
                                    color: _isHiddenCurrentPassword == true ? Colors.grey : EpregnancyColors.black,
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 20),
                            const Text(
                              "Kata Sandi Baru",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                Injector.resolve<ChangePasswordBloc>()
                                    .add(ChangeNewPasswordChanged(value));
                              },
                              obscureText: _isHiddenNewPassword,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Masukan kata sandi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorText: state.newPassword.invalid ? state.newPassword.invalidPassword : null,

                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    var  _isHiddenTap = _isHiddenNewPassword== true ? false : true;

                                    setState(() {
                                      _isHiddenNewPassword =_isHiddenTap;
                                    });
                                  },
                                  child: Icon(
                                    _isHiddenNewPassword == true ? Icons.visibility_off : Icons.visibility,
                                    color: _isHiddenNewPassword == true ? Colors.grey : EpregnancyColors.black,
                                  ),
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
                                Injector.resolve<ChangePasswordBloc>()
                                    .add(ChangeConfirmNewPasswordChanged(value));
                              },
                              obscureText: _isHiddenConfirmNewPassword,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Konfirmasi kata sandi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorText: state.confirmPassword.invalid ? 'Password tidak sama' : null,

                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    var  _isHiddenTap = _isHiddenConfirmNewPassword== true ? false : true;

                                    setState(() {
                                      _isHiddenConfirmNewPassword =_isHiddenTap;
                                    });
                                  },
                                  child: Icon(
                                    _isHiddenConfirmNewPassword == true ? Icons.visibility_off : Icons.visibility,
                                    color: _isHiddenConfirmNewPassword == true ? Colors.grey : EpregnancyColors.black,
                                  ),
                                ),

                              ),
                            ),

                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Container(
                       height: 60,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () async {
                            Injector.resolve<ChangePasswordBloc>()
                                .add(ChangePasswordSubmitted());
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
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
