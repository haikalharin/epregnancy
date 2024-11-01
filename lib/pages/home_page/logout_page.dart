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
        RaisedButton(
          onPressed: () async {
            await GAuthentication.signOut(context: context);
            // await AppSharedPreference.clear();
            AppSharedPreference.remove(AppSharedPreference.user);
            AppSharedPreference.remove(AppSharedPreference.userRegister);
            AppSharedPreference.remove(AppSharedPreference.baby);
            AppSharedPreference.remove(AppSharedPreference.baby);
            AppSharedPreference.remove(AppSharedPreference.hospital);
            AppSharedPreference.remove(AppSharedPreference.otp);
            AppSharedPreference.remove(AppSharedPreference.token);
            AppSharedPreference.remove(AppSharedPreference.cookie);
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.login, (Route<dynamic> route) => false, arguments: {'token_expired': false, 'is_from_register': false});
          },
          child: Text("Logout"),
        ),
      ],
    )));
  }
}
