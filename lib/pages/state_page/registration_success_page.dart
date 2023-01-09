import 'package:PregnancyApp/pages/login_page/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../common/widget/primary_btn.dart';
import '../../utils/string_constans.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({Key? key, this.username, this.password}) : super(key: key);
  final String? username;
  final String? password;

  @override
  State<RegistrationSuccessPage> createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {



  @override
  void initState() {
    super.initState();
    Injector.resolve<LoginBloc>().add(LoginUsernameChanged(widget.username!));
    Injector.resolve<LoginBloc>().add(LoginPasswordChanged(widget.password!));

    Future.delayed(
      const Duration(seconds: 5), () {
      Injector.resolve<LoginBloc>()
          .add(LoginSubmitted());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state){
          if(state.typeEvent == StringConstant.submitLogin) {
            if (state.userModel?.isPatient == true) {
              if (state.userModel?.isAgree == true) {
                if (state.userModel!.totalLogin! > 1) {
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
                  Navigator.of(context).pushReplacementNamed(
                      RouteName.surveyPageBaby,
                      arguments: {"is_edit": false, "edit_name": false});
                }
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.disclaimer,
                        (Route<dynamic> route) => false,
                    arguments: {
                      'user_id': state.userId,
                      'is_patient': state.userModel?.isPatient,
                      'from': "login"
                    });
              }
            } else {
              if (state.userModel?.isAgree == true) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.dashboardNakesPage,
                        (Route<dynamic> route) => false,
                    arguments: {
                      'name': state.userModel?.name,
                      'image_url': state.userModel?.imageUrl,
                      'hospital_id': state.userModel?.hospitalId
                    });
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.disclaimer,
                        (Route<dynamic> route) => false,
                    arguments: {
                      'user_id': state.userId,
                      'getIsPatient': state.userModel?.isPatient,
                      'from': "login"
                    });
              }
            }
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 120.w,
                    height: 120.w,
                    child: Lottie.asset("assets/lottie/success_lottie.json", repeat: false)),
                SizedBox(height: 28.h,),
                Text("Registrasi Berhasil", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.sp),),
                SizedBox(height: 8.h,),
                Text("Anda bisa masuk dengan akun terdaftar\ndi aplikasi", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center)
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: BtnPrimary(
              function: (){
                // Navigator.pop(context);
                },
              text: "Masuk ke Aplikasi",
            ),
          ),
        ),
      ),
    );
  }
}
