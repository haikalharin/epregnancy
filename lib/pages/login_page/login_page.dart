import 'package:PregnancyApp/main.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/pages/splashscreen_page/splashscreen_page.dart';
import 'package:PregnancyApp/pages/state_page/registration_success_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/configurations/configurations.dart';
import '../../common/services/auth_service.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';
import '../home_page/home_page.dart';
import '../signup_page/bloc/signup_bloc.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _horizontalPadding = 24.0;

class LoginPage extends StatefulWidget {
  const LoginPage(
      {Key? key, this.tokenExpired = false, this.isFromRegister = false})
      : super(key: key);
  final bool tokenExpired;
  final bool isFromRegister;

  @override
  _LoginPageState createState() => _LoginPageState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _LoginPageState extends State<LoginPage> {
  bool _isHiddenPassword = true;
  String nama = "";

  @override
  void initState() {
    super.initState();
    getRemoteConfig();

    if (widget.tokenExpired == true) {
      if (widget.isFromRegister) {
        WidgetsBinding.instance?.addPostFrameCallback((_) async {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const RegistrationSuccessPage();
          }));
        });
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) async {
          await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) {
              return WillPopScope(
                  child: Center(
                    child: Container(
                      width: 240.w,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4.w))),
                      child: Material(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              widget.isFromRegister
                                  ? "Selamat!!!"
                                  : "Sesi Berakhir.",
                              style: TextStyle(
                                  color: EpregnancyColors.blueDark,
                                  fontSize: 14.sp,
                                  fontFamily: "bold"),
                            ),
                            Padding(padding: EdgeInsets.only(top: 4.w)),
                            Text(
                              widget.isFromRegister
                                  ? "Registrasi Berhasil"
                                  : "Mohon maaf sesi Anda telah berakhir.",
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                            ),
                            InkWell(
                              child: Padding(
                                  padding:
                                  EdgeInsets.fromLTRB(0.w, 24.w, 0.w, 0.w),
                                  child: SizedBox(
                                    height: 46.w,
                                    width: MediaQuery.of(context).size.width,
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(4.w)),
                                        color: EpregnancyColors.blueDark,
                                        disabledColor: Colors.grey,
                                        child: Text('Oke',
                                            style: TextStyle(
                                                fontFamily: "bold",
                                                fontSize: 13.sp,
                                                color: Colors.white)),
                                        onPressed: () {
                                          // Navigator.pop(context);
                                          aliceDev.getNavigatorKey()?.currentState?.pop();
                                        }),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  onWillPop: () => Future.value(false));
            },
          );
        });
      }
    }
  }

  void getRemoteConfig() async {
    FirebaseRemoteConfig _remoteConfig = await FirebaseRemoteConfig.instance;
    nama = _remoteConfig.getString('term_and_condition');
  }

  @override
  void dispose() {
    Injector.resolve<LoginBloc>().add(LoginDispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) async {
                if (state.submitStatus == FormzStatus.submissionFailure) {
                  if (state.typeEvent == StringConstant.signUpGoogle) {
                    var snackBar = SnackBar(
                        content: Text(state.errorMessage != null
                            ? state.errorMessage!
                            : 'Gagal mendaftar'),
                        backgroundColor: Colors.red);
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    var snackBar = SnackBar(
                        content: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: "Maaf, ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: state.errorMessage),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.red);
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                } else if (state.submitStatus ==
                    FormzStatus.submissionSuccess) {
                  if (state.typeEvent == StringConstant.signUpGoogle) {
                    if (state.isExist == true) {
                      if (state.isSurvey == true) {
                        var snackBar = SnackBar(
                            content: Text("Akun Telah Terdaftar"),
                            backgroundColor: Colors.red);
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else {
                        Navigator.of(context)
                            .pushNamed(RouteName.surveyPage, arguments: false);
                      }
                    } else {
                      if (Configurations.mode == StringConstant.prod &&
                          state.type == 'toRequestOtp') {
                        if (state.userId!.contains('@')) {
                          Injector.resolve<LoginBloc>()
                              .add(const LoginRequestOtp());
                        } else {
                          Injector.resolve<LoginBloc>()
                              .add(const LoginRequestOtp());
                        }
                      } else {
                        Navigator.of(context).pushNamed(RouteName.otpPage);
                      }
                    }
                  } else if (state.typeEvent == StringConstant.submitLogin) {
                    if (state.userModel?.isPatient == true) {
                      if (state.userModel?.isAgree == true) {
                        if (state.userModel!.totalLogin! > 1) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteName.navBar,
                            (Route<dynamic> route) => false,
                            arguments: {
                              'role': state.userModel?.isPatient == true
                                  ? StringConstant.patient
                                  : StringConstant.midwife,
                              'initial_index': 0
                            },
                          );
                        } else {
                          Navigator.of(context).pushReplacementNamed(
                              RouteName.surveyPageBaby,
                              arguments: {"is_edit": false, "edit_name": false});
                        }
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteName.disclaimer,
                            (Route<dynamic> route) => false,
                            arguments: {
                              'user_id': state.userId,
                              'is_patient': state.userModel?.isPatient,
                              'from': "login"
                            });
                      }
                    } else {
                      if (state.userModel?.isAgree == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteName.dashboardNakesPage,
                            (Route<dynamic> route) => false,
                            arguments: {
                              'name': state.userModel?.name,
                              'image_url': state.userModel?.imageUrl,
                              'hospital_id': state.userModel?.hospitalId
                            });
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteName.disclaimer,
                            (Route<dynamic> route) => false,
                            arguments: {
                              'user_id': state.userId,
                              'getIsPatient': state.userModel?.isPatient,
                              'from': "login"
                            });
                      }
                    }
                  }
                }
              },
              child: Stack(
                children: [
                  // Positioned.fill(
                  //   child: Image.asset(
                  //     "assets/ePregnancy_login_logo.png",
                  //     fit: BoxFit.fitWidth,
                  //     alignment: Alignment.bottomLeft,
                  //   ),
                  // ),
                  Center(
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ListView(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: _horizontalPadding,
                          ),
                          children: [
                            SizedBox(height: 60),
                            // SizedBox(height: 120),
                            //_HeadingText(),
                            Hero(
                              tag: 'ibu',
                                child: SvgPicture.asset("assets/img_login.svg")),
                            SizedBox(height: 36.h),
                            Text(
                              "Selamat Datang",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Masuk dengan akun email atau nomor telepon seluler",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(height: 20),
                            _UsernameInput(),
                            SizedBox(height: 16.h),
                            _PasswordInput(),
                            _ForgotPasswordButton(),
                            SizedBox(height: 0.h),
                            Container(
                                height: 56,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ElevatedButton(
                                  child: const Text('Masuk'),
                                  onPressed: () {
                                    // dismiss active keyboard
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }

                                    Injector.resolve<LoginBloc>()
                                        .add(LoginSubmitted());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: EpregnancyColors.primer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),),
                                )),
                            // SizedBox(height: 10),
                            // Container(
                            //   height: 50,
                            //   padding:
                            //       const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            //   child: ElevatedButton(
                            //       onPressed: () async {
                            //         // GAuthentication.signOut(context: context);
                            //         // GAuthentication.signInWithGoogle();
                            //         // alice.showInspector();
                            //         final GoogleSignIn _googleSignIn = new GoogleSignIn();
                            //
                            //         await _googleSignIn.signOut();
                            //         Injector.resolve<LoginBloc>()
                            //             .add(LoginWithGoogleSubmitted());
                            //       },
                            //       child: Text("Lanjut dengan Google"),
                            //       style: ElevatedButton.styleFrom(
                            //           primary: Colors.white,
                            //           onPrimary: Colors.black)),
                            // ),
                            SizedBox(height: 50.h),
                            _RegisterButton(),
                            SizedBox(height: 8.h,),
                            Container(
                                height: 56,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ElevatedButton(
                                  child: Text('Daftar', style: TextStyle(color: EpregnancyColors.primer ),),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(RouteName.signup);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(
                                      width: 1.w,
                                      color: EpregnancyColors.primer
                                    ),
                                    primary: EpregnancyColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),),
                                )),
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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

class _HeadingText extends StatelessWidget {
  const _HeadingText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: const <Widget>[
                Text(
                  "Masuk dengan email",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Masuk dengan akun email yang terdaftar",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              Injector.resolve<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'E-mail / Nomor Telepon Seluler',
            errorText: state.username.invalid ? 'Silahkan isi username' : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(color: EpregnancyColors.primer),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  _PasswordInput();

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              Injector.resolve<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: _isHiddenPassword,
          decoration: InputDecoration(
            labelText: 'Kata Sandi',
            errorText: state.password.invalid ? 'Kata Sandi salah' : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(color: EpregnancyColors.primer),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                var _isHiddenTap = _isHiddenPassword == true ? false : true;

                setState(() {
                  _isHiddenPassword = _isHiddenTap;
                });
              },
              child: Icon(
                _isHiddenPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: _isHiddenPassword == true
                    ? Colors.grey
                    : EpregnancyColors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: Column(
              children: <Widget>[
                TextButton(
                  child: Text(
                    "Lupa kata sandi ?",
                    style: TextStyle(color: EpregnancyColors.primer, fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.forgotPassword);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Column(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style:  TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: EpregnancyColors.primer,
                    ),
                    children: const [
                      TextSpan(text: 'Belum punya akun ?'),
                      // WidgetSpan(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.of(context).pushNamed(RouteName.signup);
                      //     },
                      //     child: const Text("Register",
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: EpregnancyColors.primer)),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
