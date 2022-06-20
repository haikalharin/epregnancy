import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/constants/router_constants.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/shared_preference/app_shared_preference.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text("Welcome"),
        ),
        RaisedButton(
          onPressed: () async {
            await GAuthentication.signOut(context: context);
            AppSharedPreference.clear();
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.login, (Route<dynamic> route) => false);
          },
          child: Text("Logout"),
        ),
      ],
    )));
  }
}
