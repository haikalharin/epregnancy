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
import 'bloc/event_page_bloc.dart';

const _horizontalPadding = 24.0;

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

final _codeController = TextEditingController();
final _userNameController = TextEditingController();
var authService = AuthService();

class _AddEventPageState extends State<AddEventPage> {
  @override
  void initState() {
    // Injector.resolve<EventPageBloc>().add(EventPageInitDataChanged());
    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<EventPageBloc>().add(EventPageDispose());
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
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Kunjugan Rumah Sakit",
                style: TextStyle(color: Colors.black),
              )),
          leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: SafeArea(
            child: BlocListener<EventPageBloc, EventPageState>(
                listener: (context, state) async {
                  if (state.submitStatus == FormzStatus.submissionFailure) {
                    const snackBar = SnackBar(
                        content: Text("failed"), backgroundColor: Colors.red);
                    Scaffold.of(context).showSnackBar(snackBar);
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

                    Center(
                      child: BlocBuilder<EventPageBloc, EventPageState>(
                        builder: (context, state) {
                          return ListView(
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: _horizontalPadding,
                            ),
                            children: [
                              SizedBox(height: 10),
                              // SizedBox(height: 120),
                              //_HeadingText(),
                              SizedBox(height: 20),
                              _ScheduleNameInput(),
                              SizedBox(height: 12),
                              _DescInput(),
                              SizedBox(height: 12),
                              _AddDateInput(),
                              SizedBox(height: 12),
                              _AddTimeInput(),

                              SizedBox(height: 20),

                              SizedBox(height: 10),


                              // _PasswordTextField(),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment(0, 1),
                            child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              child: RaisedButton(
                                color:
                                EpregnancyColors.primer,

                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Mulai Konsultasi",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                elevation: 8,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                                ),
                                onPressed: () async {

                                },
                              ),
                            ),
                          ),
                        ],
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
    return BlocBuilder<EventPageBloc, EventPageState>(
        builder: (context, state) {
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
    return BlocBuilder<EventPageBloc, EventPageState>(
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

class _ScheduleNameInput extends StatelessWidget {
  const _ScheduleNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        _userNameController.text = state.username.value;
        return TextField(
          controller: _userNameController,
          key: const Key('loginForm_usernameInput_textField'),
          // onChanged: (username) =>
          //     Injector.resolve<EventPageBloc>().add(EventPageUsernameChanged(username)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0),
            prefixIcon: Icon(Icons.add),
            labelText: 'E-mail/Nomor handphone',
            errorText: state.username.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}

class _DescInput extends StatelessWidget {
  const _DescInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        _userNameController.text = state.username.value;
        return TextField(
          controller: _userNameController,
          key: const Key('loginForm_usernameInput_textField'),
          // onChanged: (username) =>
          //     Injector.resolve<EventPageBloc>().add(EventPageUsernameChanged(username)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0),
            prefixIcon: Icon(Icons.event),
            labelText: 'E-mail/Nomor handphone',
            errorText: state.username.invalid ? 'Format e-mail salah' : null,
          ),
        );
      },
    );
  }
}

class _AddDateInput extends StatelessWidget {
  const _AddDateInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        _userNameController.text = state.username.value;
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.event),
                    Column(
                      children: [
                        Text("asdsadasd"),
                        Text("asdsadasd"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              )
            ],
          ),
        );
      },
    );
  }
}

class _AddTimeInput extends StatelessWidget {
  const _AddTimeInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        _userNameController.text = state.username.value;
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.event),
                    Column(
                      children: [
                        Text("asdsadasd"),
                        Text("asdsadasd"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              )
            ],
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
    return BlocBuilder<EventPageBloc, EventPageState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          // onChanged: (password) =>
          //     Injector.resolve<EventPageBloc>().add(EventPagePasswordChanged(password)),
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
    return BlocBuilder<EventPageBloc, EventPageState>(
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
