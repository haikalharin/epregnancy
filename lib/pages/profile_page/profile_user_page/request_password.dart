import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../../utils/epragnancy_color.dart';
import '../bloc/profile_page_bloc.dart';
import 'change_profile_page.dart';

class RequestPasswordPage extends StatefulWidget {
  const RequestPasswordPage({Key? key}) : super(key: key);

  @override
  State<RequestPasswordPage> createState() => _RequestPasswordPageState();
}

class _RequestPasswordPageState extends State<RequestPasswordPage> {
  bool _isHiddenPassword = true;
  final TextEditingController _passwordEditingController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const BtnBackIosStyle(),
          ),
          body: BlocListener<ProfilePageBloc, ProfilePageState>(
            listener: (context, state) {
              if (state.submitStatus == FormzStatus.submissionFailure) {
                var snackBar = SnackBar(
                    content: Text(state.errorMessage != null
                        ? state.errorMessage!
                        : 'Terjadi Kesalahan, Silahkan Coba Lagi'),
                    backgroundColor: Colors.red);
                Scaffold.of(context).showSnackBar(snackBar);
              } else if (state.submitStatus == FormzStatus.submissionSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ChangeProfilePage(withPassword: true)));
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Form(
                key: _formKey,
                autovalidateMode: _autovalidateMode,
                child: ListView(
                  children: [
                    Center(
                        child: SvgPicture.asset("assets/icKeyCircle.svg")),
                    SizedBox(
                      height: 36.h,
                    ),
                    Center(
                        child: Text(
                          "Masukan kata sandi untuk melanjutkan",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      "Kata Sandi",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: _passwordEditingController,
                      enableInteractiveSelection: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (val) {
                        if (val == null) {
                          return "Password Tidak Boleh Kosong";
                        }
                        return null;
                      },
                      key: const Key('loginForm_passwordInput_textField'),
                      obscureText: _isHiddenPassword,
                      decoration: InputDecoration(
                        hintText: 'Kata Sandi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.w),
                          borderSide:
                          BorderSide(color: EpregnancyColors.primer),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            var _isHiddenTap =
                            _isHiddenPassword == true ? false : true;

                            setState(() {
                              _isHiddenPassword = _isHiddenTap;
                            });
                          },
                          child: Icon(
                            _isHiddenPassword == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isHiddenPassword == true
                                ? Colors.grey
                                : EpregnancyColors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                "Lupa kata sandi ?",
                                style: TextStyle(
                                    color: EpregnancyColors.primer,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RouteName.forgotPassword);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              child: ElevatedButton(
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                        color: EpregnancyColors.white, fontSize: 14.sp),
                  ),
                  onPressed: _formKey.currentState?.validate() == true
                      ? () async {
                    // todo save to local
                    Injector.resolve<ProfilePageBloc>().add(
                        BiodataViewEvent(
                            _passwordEditingController.text));
                    // await AppSharedPreference.setHospital(_hospitalModel!);
                    // await AppSharedPreference.setBool(
                    //     AppSharedPreference.haveBpjsorKis, haveBpjs);
                    // Navigator.pop(context, _hospitalModel);
                  }
                      : (){
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: _formKey.currentState?.validate() == true ? MaterialStateProperty.all<Color>(
                          EpregnancyColors.primer) : MaterialStateProperty.all<Color>(
                          EpregnancyColors.greyText),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))))),
        ),
        _Loading()
      ],
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
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
