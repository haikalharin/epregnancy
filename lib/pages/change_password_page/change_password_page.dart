import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
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
import '../../common/services/auth_service.dart';
import '../../utils/string_constans.dart';
import '../signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'bloc/change_password_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _horizontalPadding = 30.0;

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, this.title, this.isNakes = false})
      : super(key: key);
  final String? title;
  final bool? isNakes;

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
    Injector.resolve<ChangePasswordBloc>().add(ChangeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) async {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            var message = state.errorMessage ?? 'gagal';
            final snackBar =
                SnackBar(content: Text(message), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess &&
              state.type == 'change-password-success') {
            final snackBar = SnackBar(
                content: Text("Berhasil"), backgroundColor: Colors.blue);
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
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 50),
                          child: SvgPicture.asset(
                            'assets/bg_change_password.svg',
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
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
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    var _isHiddenTap =
                                        _isHiddenCurrentPassword == true
                                            ? false
                                            : true;

                                    setState(() {
                                      _isHiddenCurrentPassword = _isHiddenTap;
                                    });
                                  },
                                  child: Icon(
                                    _isHiddenCurrentPassword == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: _isHiddenCurrentPassword == true
                                        ? Colors.grey
                                        : EpregnancyColors.black,
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
                            Column(
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    Injector.resolve<ChangePasswordBloc>()
                                        .add(ChangeNewPasswordChanged(value));
                                  },
                                  obscureText: _isHiddenNewPassword,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.grey[500]),
                                    hintText: 'Masukan kata sandi',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                                state.newPassword.invalid
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              StringConstant.alertPassword1,
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            Text(StringConstant.alertPassword2,
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            Text(StringConstant.alertPassword3,
                                                style: TextStyle(
                                                    color: Colors.red))
                                          ],
                                        ),
                                      )
                                    : Container()
                              ],
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
                                Injector.resolve<ChangePasswordBloc>().add(
                                    ChangeConfirmNewPasswordChanged(value));
                              },
                              enabled: state.newPassword.valid,
                              obscureText: _isHiddenConfirmNewPassword,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Konfirmasi kata sandi',
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
                      BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) {
                        return Container(
                          height: 60,
                          margin: EdgeInsets.symmetric(
                              horizontal: 22.w, vertical: 16.h),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              print(
                                  'state confirm password value : ${state.confirmPassword.value}');
                              if (state.currentPassword.value == '') {
                                Toast.show('Mohon mengisi kata sandi sekarang');
                              } else if (state.currentPassword ==
                                  state.newPassword) {
                                Toast.show(
                                    'Kata sandi tidak boleh sama dengan password sebelumnya!');
                              } else if (state.currentPassword != null &&
                                  state.confirmPassword != null &&
                                  state.newPassword != null &&
                                  state.confirmPassword.value ==
                                      state.newPassword.value) {
                                Injector.resolve<ChangePasswordBloc>()
                                    .add(ChangePasswordSubmitted());
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
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
