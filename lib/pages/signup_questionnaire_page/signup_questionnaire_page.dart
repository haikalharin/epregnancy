import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../common/services/auth_service.dart';
import 'bloc/signup_questionnaire_bloc.dart';

const _horizontalPadding = 30.0;

class SignUpQuestionnairePage extends StatefulWidget {
  const SignUpQuestionnairePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<SignUpQuestionnairePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocListener<SignUpQuestionnaireBloc, SignUpQuestionnaireState>(
        listener: (context, state) {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            const snackBar =
                SnackBar(content: Text("Mohon lengkapi data"), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess) {
            Navigator.of(context).pushNamed(RouteName.surveyPage);
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
                              "Untuk personalisasi kebutuhan Anda dalam kehamilan",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Nama Depan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                Injector.resolve<SignUpQuestionnaireBloc>()
                                    .add(SignupFirstnameChanged(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                fillColor: Colors.white70,
                                hintText: 'Isi dengan nama depan Anda',
                                errorText: state.firstName.invalid ? 'Mohon lengkapi Data' : null,

                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Nama Belakang",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                Injector.resolve<SignUpQuestionnaireBloc>()
                                    .add(SignupSecondnameChanged(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                fillColor: Colors.white70,
                                hintText: 'Isi dengan nama belakang Anda',
                                errorText: state.secondName.invalid ? 'Mohon lengkapi Data' : null,

                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Kata Sandi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                Injector.resolve<SignUpQuestionnaireBloc>()
                                    .add(SignupPasswordChanged(value));
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Masukan kata sandi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorText: state.password.invalid ? state.password.invalidPassword : null,

                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Konfirmasi Kata Sandi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              onChanged: (value) {
                                Injector.resolve<SignUpQuestionnaireBloc>()
                                    .add(SignupConfirmPasswordChanged(value));
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Konfirmasi kata sandi',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorText: state.confirmPassword.invalid ? 'Password tidak sama' : null,

                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Tanggal lahir",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            DateTimeFormField(
                              dateFormat:   DateFormat('dd/MM/yyyy'),
                              mode: DateTimeFieldPickerMode.date,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: Icon(Icons.event_note),
                                hintText: 'DD / MM / YYYY',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorText: state.date.invalid ? 'Mohon lengkapi Data' : null,

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
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "1 dari 4",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 350,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Injector.resolve<SignUpQuestionnaireBloc>()
                                      .add(SignupSubmitted());
                                },
                                child: Text("Selanjutnya"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
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
