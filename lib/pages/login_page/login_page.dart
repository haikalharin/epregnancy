import 'package:PregnancyApp/pages/login_page/bloc/login_bloc.dart';
import 'package:PregnancyApp/pages/login_page/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';

const _horizontalPadding = 24.0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

          child:
              BlocListener<LoginBloc, LoginState>(listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          final snackBar = SnackBar(content: new Text("gagal"),
              backgroundColor: Colors.red);
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (state.status == FormzStatus.submissionSuccess) {
          Navigator.of(context).pushNamed(RouteName.homeScreen);
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //                 RouteName.homeScreen,
          //                 ModalRoute.withName(RouteName.homeScreen),
          //               );
        }
      }, child: Stack(
        children: [
          BlocBuilder<LoginBloc, LoginState>(
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
                    onPressed: () {
                      Injector.resolve<LoginBloc>().add(const LoginSubmitted());
                    },
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              Injector.resolve<LoginBloc>().add(LoginUsernameChanged(username)),
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
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              Injector.resolve<LoginBloc>().add(LoginPasswordChanged(password)),


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
