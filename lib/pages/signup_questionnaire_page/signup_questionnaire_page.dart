import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/constants/regex_constants.dart';
import '../../common/services/auth_service.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';
import '../login_page/login_page.dart';
import 'bloc/signup_questionnaire_bloc.dart';

const _horizontalPadding = 30.0;

class SignUpQuestionnairePage extends StatefulWidget {
  const SignUpQuestionnairePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _SignUpQuestionnairePage createState() => _SignUpQuestionnairePage();
}

class _SignUpQuestionnairePage extends State<SignUpQuestionnairePage> {
  DateTime? selectedDate;
  bool _isHiddenNewPassword = true;
  bool _isHiddenConfirmNewPassword = true;
  final TextEditingController _passwordController = TextEditingController();
  String? passwordText;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: BlocListener<SignUpQuestionnaireBloc, SignUpQuestionnaireState>(
          listener: (context, state) {
            if (state.submitStatus == FormzStatus.submissionFailure) {
              var message = state.errorMessage ?? '';
              final snackBar =
                  SnackBar(content: Text(message), backgroundColor: Colors.red);
              Scaffold.of(context).showSnackBar(snackBar);
            } else if (state.submitStatus == FormzStatus.submissionSuccess) {
              // todo login page
              print('username : ${state.userModel?.username}');
              print('password : ${state.password.value}');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  LoginPage(
                          tokenExpired: true, isFromRegister: true, userFromRegister: state.userModel?.username, passwordFromRegister: state.password.value,)),
                  (route) => false);
              // Navigator.of(context).pushNamed(
              //     RouteName.surveyPageBaby,
              //     arguments: false);
            }
          },
          child: BlocBuilder<SignUpQuestionnaireBloc, SignUpQuestionnaireState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/back.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Image.asset("assets/signup_questionnaire_icon.png",
                            height: 220, fit: BoxFit.fitWidth),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: _horizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lengkapi data diri",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Untuk personalisasi kebutuhan Anda\ndalam kehamilan",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(height: 30),
                              // Text(
                              //   "Nama Depan",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // ),
                              // SizedBox(height: 10),
                              TextField(
                                onChanged: (value) {
                                  Injector.resolve<SignUpQuestionnaireBloc>()
                                      .add(SignupFirstnameChanged(value));
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  fillColor: Colors.white70,
                                  label: Text('Nama depan'),
                                  errorText: state.firstName.invalid
                                      ? 'Mohon lengkapi Data'
                                      : null,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Text(
                              //   "Nama Belakang",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // ),
                              // SizedBox(height: 10),
                              TextField(
                                onChanged: (value) {
                                  Injector.resolve<SignUpQuestionnaireBloc>()
                                      .add(SignupSecondnameChanged(value));
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  fillColor: Colors.white70,
                                  label: Text("Nama belakang"),
                                  errorText: state.secondName.invalid
                                      ? 'Mohon lengkapi Data'
                                      : null,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Text(
                              //   "Kata Sandi",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // ),
                              // SizedBox(height: 10),
                              Column(
                                children: [
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        passwordText = value;
                                      });

                                      Injector.resolve<
                                              SignUpQuestionnaireBloc>()
                                          .add(SignupPasswordChanged(value));
                                    },
                                    controller: _passwordController,
                                    obscureText: _isHiddenNewPassword,
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                      label: Text("Kata Sandi"),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                      ),
                                      errorText:
                                          state.password.invalid ? "" : null,
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          var _isHiddenTap =
                                              _isHiddenNewPassword == true
                                                  ? false
                                                  : true;

                                          setState(() {
                                            _isHiddenNewPassword = _isHiddenTap;
                                          });
                                        },
                                        child: Icon(
                                          _isHiddenNewPassword == true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: _isHiddenNewPassword == true
                                              ? Colors.grey
                                              : EpregnancyColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Material(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              // if(RegExp(RegexConstants.validPasswordlRegex).hasMatch(passwordText ?? "")) {
                                              if ((passwordText?.length ?? 0) >=
                                                  8) {
                                                return Icon(
                                                  Icons.check_circle_rounded,
                                                  color:
                                                      EpregnancyColors.primer,
                                                  size: 14.sp,
                                                );
                                              } else {
                                                return Icon(
                                                  Icons.check_circle_rounded,
                                                  color: EpregnancyColors.grey,
                                                  size: 14.sp,
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            "Minimal 8 karakter dan maksimal 128 karakter",
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Builder(builder: (context) {
                                            if (RegExp(RegexConstants
                                                    .validPasswordlRegex)
                                                .hasMatch(passwordText ?? "")) {
                                              return Icon(
                                                Icons.check_circle_rounded,
                                                color: EpregnancyColors.primer,
                                                size: 14.sp,
                                              );
                                            } else {
                                              return Icon(
                                                Icons.check_circle_rounded,
                                                color: EpregnancyColors.grey,
                                                size: 14.sp,
                                              );
                                            }
                                          }),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                                "Setidaknya memiliki 1 huruf besar, 1 huruf kecil dan 1 angka dan 1 simbol",
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Text(
                              //   "Konfirmasi Kata Sandi",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // ),
                              // SizedBox(height: 10),
                              TextField(
                                enabled: state.password.valid,
                                onChanged: (value) {
                                  Injector.resolve<SignUpQuestionnaireBloc>()
                                      .add(SignupConfirmPasswordChanged(value));
                                },
                                obscureText: _isHiddenConfirmNewPassword,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  label: Text('Konfirmasi Kata Sandi'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                  errorText: state.confirmPassword.invalid ||
                                          state.password.value !=
                                              state.confirmPassword.value
                                      ? 'Password tidak sama'
                                      : null,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      var _isHiddenTap =
                                          _isHiddenConfirmNewPassword == true
                                              ? false
                                              : true;

                                      setState(() {
                                        _isHiddenConfirmNewPassword =
                                            _isHiddenTap;
                                      });
                                    },
                                    child: Icon(
                                      _isHiddenConfirmNewPassword == true
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _isHiddenConfirmNewPassword == true
                                          ? Colors.grey
                                          : EpregnancyColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Text(
                              //   "Tanggal lahir",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // ),
                              // SizedBox(height: 10),
                              InkWell(
                                // todo used cupertino picker
                                onTap: () => _showDialog(
                                  CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    mode: CupertinoDatePickerMode.date,
                                    dateOrder: DatePickerDateOrder.dmy,
                                    maximumDate: DateTime.now(),
                                    use24hFormat: true,
                                    // This is called when the user changes the date.
                                    onDateTimeChanged: (DateTime newDate) {
                                      String dateTime = DateFormat('yyyy-MM-dd').format(newDate);

                                      Injector.resolve<SignUpQuestionnaireBloc>()
                                          .add(SignupDateChanged(dateTime));
                                    },
                                  ),
                                ),
                                child: DateTimeFormField(
                                  dateTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                                  dateFormat: DateFormat('dd / MM / yyyy'),
                                  enabled: true,
                                  lastDate: DateTime.now(),
                                  mode: DateTimeFieldPickerMode.date,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.black45),
                                    errorStyle:
                                        TextStyle(color: Colors.redAccent),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.w),
                                    ),
                                    suffixIcon: Icon(Icons.event_note),
                                    hintText: 'DD / MM / YYYY',
                                    label: Text("Tanggal Lahir"),
                                    // labelStyle: TextStyle(
                                    //   color: Colors.black,
                                    //   fontWeight: FontWeight.bold,
                                    // ),
                                    errorText: state.date.invalid
                                        ? 'Mohon lengkapi Data'
                                        : null,
                                  ),
                                  // firstDate: DateTime.now().add(const Duration(days: 10)),
                                  // lastDate: DateTime.now().add(const Duration(days: 40)),
                                  // initialDate: DateTime.now().add(const Duration(days: 20)),
                                  onDateSelected: (DateTime value) {
                                    String dateTime =
                                        DateFormat('yyyy-MM-dd').format(value);

                                    Injector.resolve<SignUpQuestionnaireBloc>()
                                        .add(SignupDateChanged(dateTime));
                                  },
                                ),
                              ),
                              // CupertinoButton(
                              //   // Display a CupertinoDatePicker in date picker mode.
                              //   onPressed: () => _showDialog(
                              //     CupertinoDatePicker(
                              //       initialDateTime: DateTime.now(),
                              //       mode: CupertinoDatePickerMode.date,
                              //       dateOrder: DatePickerDateOrder.dmy,
                              //       use24hFormat: true,
                              //       // This is called when the user changes the date.
                              //       onDateTimeChanged: (DateTime newDate) {
                              //         setState(() => date = newDate);
                              //       },
                              //     ),
                              //   ),
                              //   // In this example, the date value is formatted manually. You can use intl package
                              //   // to format the value based on user's locale settings.
                              //   child: Text(
                              //     '${date.month}-${date.day}-${date.year}',
                              //     style: const TextStyle(
                              //       fontSize: 22.0,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              // Text(
                              //   "1 dari 3",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //       color: Colors.grey,
                              //       fontWeight: FontWeight.normal,
                              //       fontSize: 12),
                              // ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: _horizontalPadding),
                                child: ElevatedButton(
                                  onPressed: state.password.invalid ||
                                          state.confirmPassword.invalid ||
                                          _passwordController.text.isEmpty
                                      ? null
                                      : () async {
                                          Injector.resolve<
                                                  SignUpQuestionnaireBloc>()
                                              .add(SignupSubmitted());
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 16.w, bottom: 16.w),
                                    child: Text(
                                      "Daftar",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: EpregnancyColors.primer,
                                    onSurface: EpregnancyColors.primer
                                        .withOpacity(0.25),
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                    _Loading()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpQuestionnaireBloc, SignUpQuestionnaireState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                  height: 1000,
                  color: Colors.white.withAlpha(90),
                  child: Center(child: CircularProgressIndicator())),
            ),
          ],
        );
      } else {
        return Text("");
      }
    });
  }
}
