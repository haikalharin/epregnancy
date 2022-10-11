import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCheckInPage extends StatefulWidget {
  final String? phoneNumber;

  const PinCheckInPage({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCheckInPageState createState() => _PinCheckInPageState();
}

class _PinCheckInPageState extends State<PinCheckInPage> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PinCheckInBloc, PinCheckInState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess) {
          snackBar("Selamat Anda Berhasil CheckIn!");
          Injector.resolve<HomePageBloc>().add(PointFetchEvent());
          Navigator.pop(context);
        } else if (state.submitStatus == FormzStatus.submissionFailure) {
          snackBar("Terjadi Kesalahan, Silahkan Coba Lagi!");
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<PinCheckInBloc, PinCheckInState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              // height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 30),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 3,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(30),
                  //     child: Image.asset(Constants.otpGifImage),
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                    child: Text(
                      'Silahkan Masukan Pin Yang Anda Dapatkan Dari Puskesmas',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: true,
                          obscuringCharacter: '*',
                          // obscuringWidget: const FlutterLogo(
                          //   size: 24,
                          // ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          // validator: (v) {
                          //   if (v!.length < 4) {
                          //     return "Pin Tidak Lengkap";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          pinTheme: PinTheme(
                            inactiveColor: Colors.black,
                            shape: PinCodeFieldShape.underline,
                            activeColor: Colors.white,
                            disabledColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedColor: Colors.white,
                            selectedFillColor: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: false,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          // boxShadows: const [
                          //   BoxShadow(
                          //     offset: Offset(0, 1),
                          //     color: Colors.black12,
                          //     blurRadius: 10,
                          //   )
                          // ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "Mohon Lengkapi Pin" : "",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 30),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ButtonTheme(
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          // conditions for validating
                          if (currentText.length != 4) {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          } else {
                            setState(() {
                              hasError = false;
                            });
                            Injector.resolve<PinCheckInBloc>()
                                .add(PinSubmitted(currentText));
                            // setState(
                            //       () {
                            //     hasError = false;
                            //     snackBar("Pin Verified!!");
                            //   },
                            // );
                          }
                        },
                        child: Center(
                            child: state.submitStatus ==
                                    FormzStatus.submissionInProgress
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Check-In".toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: EpregnancyColors.blueDark,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.shade200,
                              offset: const Offset(1, -2),
                              blurRadius: 5),
                          BoxShadow(
                              color: Colors.green.shade200,
                              offset: const Offset(-1, 2),
                              blurRadius: 5)
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
