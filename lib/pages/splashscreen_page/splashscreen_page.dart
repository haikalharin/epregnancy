import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import 'bloc/splash_screen_bloc.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {


  @override
  void initState() {
    Injector.resolve<SplashscreenBloc>().add(SplashscreenCheckUserExist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenBloc, SplashscreenState>(
      listener: (context, state) {
      if (state.submitStatus == FormzStatus.submissionSuccess) {
        if(state.isExist){
          // Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: state.role!.role);
          // todo handel login from API

          if(state.role == 'MIDWIFE' || state.userModel?.isPatient == true){
            Navigator.of(context).pushReplacementNamed(
                RouteName.dashboardNakesPage,
                arguments: state.userModel?.name
            );
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: {'role': state.role, 'inital_index': 0, 'user_id':state.userModel?.id ??''});
          }
        } else{
          Navigator.of(context).pushReplacementNamed(RouteName.login);

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
