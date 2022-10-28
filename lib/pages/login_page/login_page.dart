import 'package:PregnancyApp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  const LoginPage({Key? key, this.tokenExpired = false}) : super(key: key);
  final bool tokenExpired;

  @override
  _LoginPageState createState() => _LoginPageState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _LoginPageState extends State<LoginPage> {
  bool _isHiddenPassword = true;

  @override
  void initState() {
    super.initState();

    if (widget.tokenExpired == true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
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
                            "Sesi Berakhir.",
                            style: TextStyle(
                                color: EpregnancyColors.blueDark,
                                fontSize: 14.sp,
                                fontFamily: "bold"),
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.w)),
                          Text(
                            "Mohon maaf sesi Anda telah berakhir.",
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
                                      disabledColor:
                                      Colors.grey,
                                      child: Text('Oke',
                                          style: TextStyle(
                                              fontFamily: "bold",
                                              fontSize: 13.sp,
                                              color: Colors.white)),
                                      onPressed: () {
                                        Navigator.pop(context);
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

  @override
  void dispose() {
    Injector.resolve<LoginBloc>().add(LoginDispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                        Navigator.of(context).pushNamed(RouteName.surveyPage,
                            arguments: false);
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteName.dashboardNakesPage,
                          (Route<dynamic> route) => false,
                          arguments: {
                            'name': state.userModel?.name,
                            'image_url': state.userModel?.imageUrl,
                            'hospital_id': state.userModel?.hospitalId
                          });
                    }
                  }
                }
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/ePregnancy_login_logo.png",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
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
                            Text(
                              "Masuk dengan email",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              "Masuk dengan akun email/nomor handphone yang terdaftar",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(height: 20),
                            _UsernameInput(),
                            SizedBox(height: 12),
                            _PasswordInput(),
                            _ForgotPasswordButton(),
                            SizedBox(height: 20),
                            Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  child: const Text('Login'),
                                  onPressed: () {
                                    Injector.resolve<LoginBloc>()
                                        .add(LoginSubmitted());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: EpregnancyColors.primer),
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
                            SizedBox(height: 12),
                            _RegisterButton()
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
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              Injector.resolve<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'E-mail/Nomor handphone',
            errorText: state.username.invalid ? 'Silahkan isi username' : null,
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
                    'Lupa kata sandi?',
                    style: TextStyle(color: EpregnancyColors.primer),
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
          alignment: Alignment.centerRight,
          child: Container(
            child: Column(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Belum punya akun? '),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(RouteName.signup);
                          },
                          child: const Text("Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: EpregnancyColors.primer)),
                        ),
                      )
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
