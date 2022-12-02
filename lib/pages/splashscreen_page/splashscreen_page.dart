import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../main_development.dart' as dev;
import 'bloc/splash_screen_bloc.dart';
import 'package:intl/intl_standalone.dart';

late final FirebaseRemoteConfig remoteConfig;

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  bool? skipOnboarding = false;
  static FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  bool _isLoading = true;
  late Color _color;
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
    _initializeRemoteConfig();
    super.initState();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      await _remoteConfig.fetch();
      await _remoteConfig.activate();

      print('Last fetch status: ' + _remoteConfig.lastFetchStatus.toString());
      print('Last fetch time: ' + _remoteConfig.lastFetchTime.toString());
      print('New color enabled?: ' + _remoteConfig.getBool('new_color_enabled').toString());

      setState(() {
        remoteConfig = _remoteConfig;
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }

  }

  _initializeRemoteConfig() async {
    if (_remoteConfig == null) {
      _remoteConfig = await RemoteConfig.instance;

      final Map<String, dynamic> defaults = <String, dynamic>{
        'new_color_enabled': false
      };
      await _remoteConfig.setDefaults(defaults);

      _remoteConfig.setConfigSettings(RemoteConfigSettings(
       fetchTimeout:  Duration(milliseconds: 1), minimumFetchInterval: Duration(milliseconds: 1),
      ));

      await _fetchRemoteConfig();
    }



    setState(() {
      _isLoading = false;
    });
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
                arguments: {'name': state.userModel?.name, 'hospital_id': _hospital.id, 'image_url': state.userModel?.imageUrl}
            );
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: {'role': state.role, 'inital_index': 0, 'user_id':state.userModel?.id ??''});
          }
        } else{
          if(skipOnboarding == false || skipOnboarding == null){
            Navigator.of(context).pushReplacementNamed(RouteName.onboarding);
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.login, arguments: {'token_expired': false, 'is_from_register': false});
          }
        }
      }
      },
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/splashscreen.png", fit: BoxFit.fill),
              )
          );
        },
      ),
    );
  }
}
