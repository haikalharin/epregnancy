import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import 'bloc/splash_screen_bloc.dart';
import 'package:intl/intl_standalone.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  bool? skipOnboarding = false;
  // final Alice _alice = Alice(
  //     showNotification: true,
  //     darkTheme: false);

  void getFirstInstall() async{
    bool? _skipOnboarding = await AppSharedPreference.getBool(AppSharedPreference.newInstall);
    setState(() {
      skipOnboarding = _skipOnboarding;
      // _alice.showInspector();
    });
    print('skip onboarding : $skipOnboarding');
  }

  @override
  void initState() {
    getFirstInstall();
    Injector.resolve<SplashscreenBloc>().add(SplashscreenCheckUserExist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenBloc, SplashscreenState>(
      listener: (context, state) async {
      if (state.submitStatus == FormzStatus.submissionSuccess) {
        if(state.isExist){
          // Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: state.role!.role);
          // todo handel login from API
          print('role splash : ${state.role}');
          if(state.role == 'MIDWIFE' || state.userModel?.isPatient == false) {
            HospitalModel _hospital = await AppSharedPreference.getHospital();
            Navigator.of(context).pushReplacementNamed(
                RouteName.dashboardNakesPage,
                arguments: {'name': state.userModel?.name, 'hospital_id': _hospital.id}
            );
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: {'role': state.role, 'inital_index': 0, 'user_id':state.userModel?.id ??''});
          }
        } else{
          if(skipOnboarding == false || skipOnboarding == null){
            Navigator.of(context).pushReplacementNamed(RouteName.onboarding);
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.login);
          }
        }
      }
      },
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          return Scaffold(
              body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child:  SvgPicture.asset(
                          'assets/ePregnancy_ss_logo.svg',
                          fit: BoxFit.fitHeight,
                          height: 200,
                          width: 200,
                        ),


                      )
                    ],
                  )));
        },
      ),
    );
  }
}
