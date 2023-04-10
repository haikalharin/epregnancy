import 'package:PregnancyApp/pages/login_page/bloc/login_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../common/widget/primary_btn.dart';
import '../../utils/string_constans.dart';

class NewBornSuccessPage extends StatefulWidget {
  const NewBornSuccessPage({Key? key, this.username, this.password}) : super(key: key);
  final String? username;
  final String? password;

  @override
  State<NewBornSuccessPage> createState() => _NewBornSuccessPage();
}

class _NewBornSuccessPage extends State<NewBornSuccessPage> {



  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3), () {
      Navigator.pop(context);
      // Injector.resolve<LoginBloc>()
      //     .add(LoginSubmittedFromRegister(widget.username, widget.password));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(true);
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
                      arguments: {"is_edit": false, "edit_name": false, "from_register": true});
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
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                setState(() {
                    Navigator.pop(context);
                });
              },
            ),
          ),
          backgroundColor: EpregnancyColors.primerSoft,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: EpregnancyColors.primerSoft,
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/bg_survey_baby.png'),
                        fit: BoxFit.cover)),),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Lottie.asset("assets/lottie/new_born_congrats.json", repeat: false)),
                      SizedBox(height: 28.h,),
                      // Text("Selamat Bunda !", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.sp),),
                      // SizedBox(height: 8.h,),
                      // Text("Anda bisa masuk dengan akun terdaftar\ndi aplikasi", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.only(bottom: 20.h),
          //   child: BtnPrimary(
          //     function: (){
          //       // Navigator.pop(context);
          //       },
          //     text: "Masuk ke Aplikasi",
          //   ),
          // ),
        ),
      ),
    );
  }
}
