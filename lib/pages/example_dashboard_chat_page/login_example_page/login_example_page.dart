import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../../utils/string_constans.dart';
import 'bloc/login_example_bloc.dart';

const _horizontalPadding = 24.0;

class LoginExamplePage extends StatefulWidget {
  const LoginExamplePage({Key? key}) : super(key: key);

  @override
  _LoginExamplePageState createState() => _LoginExamplePageState();
}

final _codeController = TextEditingController();

class _LoginExamplePageState extends State<LoginExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocListener<LoginExampleBloc, LoginExampleState>(
              listener: (context, state) async {
                if (state.status == FormzStatus.submissionFailure) {
                  const snackBar = SnackBar(
                      content: Text("failed"), backgroundColor: Colors.red);
                  Scaffold.of(context).showSnackBar(snackBar);
                } else if (state.status == FormzStatus.submissionSuccess) {
                  if(state.userModelFirebase!.status == StringConstant.active){
                    // Navigator.of(context).pushNamed(RouteName.navBar,arguments: 0);
                  } else {
                    Navigator.of(context).pushNamed(RouteName.surveyPage);
                  }
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //                 RouteName.homeScreen,
                  //                 ModalRoute.withName(RouteName.homeScreen),
                  //               );
                }
              },
              child: Stack(
                children: [
                  BlocBuilder<LoginExampleBloc, LoginExampleState>(
                    builder: (context, state) {
                      return ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                        ),
                        children: [
                          SizedBox(height: 80),
                          SizedBox(height: 120),
                          _UsernameInput(),
                          SizedBox(height: 12),
                          _PasswordInput(),
                          // _PasswordTextField(),
                          SizedBox(height: 16),
                          RaisedButton(
                            onPressed: () async {


                              Injector.resolve<LoginExampleBloc>()
                                  .add(LoginSubmitted());
                            },
                            child: Text("Login With Google"),
                          ),
                        ],
                      );
                    },
                  ),
                  _Loading()
                ],
              ))),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginExampleBloc, LoginExampleState>(builder: (context, state) {
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

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginExampleBloc, LoginExampleState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              Injector.resolve<LoginExampleBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'username',
            errorText: state.username.invalid ? 'invalid username' : null,
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
    return BlocBuilder<LoginExampleBloc, LoginExampleState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              Injector.resolve<LoginExampleBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}
