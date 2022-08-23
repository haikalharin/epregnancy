import 'package:PregnancyApp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';
import '../home_page/home_page.dart';
import 'bloc/login_bloc.dart';

const _horizontalPadding = 24.0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Injector.resolve<LoginBloc>().add(LoginInitDataChanged());
    super.initState();
  }

  @override
  void dispose() {
    Injector.resolve<LoginBloc>().add(LoginDispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacementNamed(RouteName.signup);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {
                  if (state.submitStatus == FormzStatus.submissionFailure) {
                    const snackBar = SnackBar(
                        content: Text("failed"), backgroundColor: Colors.red);
                    Scaffold.of(context).showSnackBar(snackBar);
                    Injector.resolve<LoginBloc>().add(
                        LoginDispose());
                  } else if (state.submitStatus ==
                      FormzStatus.submissionSuccess) {
                    if (state.userModelFirebase!.status ==
                        StringConstant.active) {
                      if (state.role!.role == 'MIDWIFE') {
                        Navigator.of(context).pushReplacementNamed(
                            RouteName.navBar,
                            arguments: state.role!.role);
                      } else {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteName.navBar);
                      }
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteName.surveyPage);
                    }

                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //                 RouteName.homeScreen,
                    //                 ModalRoute.withName(RouteName.homeScreen),
                    //               );
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
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      // GAuthentication.signOut(context: context);
                                      // GAuthentication.signInWithGoogle();
                                      Injector.resolve<LoginBloc>()
                                          .add(LoginWithGoogleSubmitted());
                                    },
                                    child: Text("Lanjut dengan Google"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.black)),
                              ),
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
      ),
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
          controller: _userNameController,
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              Injector.resolve<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'E-mail/Nomor handphone',
            errorText: state.username.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              Injector.resolve<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Kata Sandi',
            errorText: state.password.invalid ? 'Kata Sandi salah' : null,
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
                    print('Pressed');
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
                  text:  TextSpan(
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
                          onTap: (){
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
