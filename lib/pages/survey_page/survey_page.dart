import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../main.dart';
import '../../utils/epragnancy_color.dart';

import '../../utils/string_constans.dart';
import '../login_page/login_page.dart';
import 'bloc/survey_page_bloc.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key, this.isEdit = false}) : super(key: key);
  final bool? isEdit;

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  bool isPage1 = true;
  bool isPage2 = false;

  Color color1 = Colors.black;
  Color color2 = Colors.black;
  bool _value = false;
  String condition = "";
  bool isPregnant = false;
  bool isPlanningPregnancy = false;
  bool isHaveBaby = false;
  int val = -1;
  int val2 = -1;
  bool isEdit = false;

  @override
  void initState() {
    Injector.resolve<SurveyPageBloc>()
        .add(SurveyInitEvent(isUpdate: widget.isEdit ?? false));
    isEdit = widget.isEdit!;
    super.initState();
  }

  @override
  void dispose() {
    // Injector.resolve<SurveyPageBloc>().add(const SurveyDisposeEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isPage1) {
      setState(() {
        color1 = Colors.black;
        color2 = Colors.grey;
      });
    } else {
      setState(() {
        color2 = Colors.black;
        color1 = Colors.grey;
      });
    }
    return Scaffold(
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
              if (isPage2) {
                isPage1 = true;
                isPage2 = false;
              } else if (isPage1) {
                Navigator.pop(context);
              }
            });
          },
        ),
      ),
      body: BlocListener<SurveyPageBloc, SurveyPageState>(
        listener: (context, state) {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            const snackBar =
                SnackBar(content: Text("failed"), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess && state.type == 'submit') {
              if (state.choice == 1) {
                if (widget.isEdit == true) {
                  Navigator.of(context).pushReplacementNamed(
                      RouteName.surveyPageBaby,
                      arguments: {"is_edit": widget.isEdit, "edit_name": false});
                } else{
                  Navigator.of(context).pushNamed(
                      RouteName.surveyPageBaby,
                      arguments: {"is_edit": widget.isEdit, "edit_name": false});
                }
              } else {
                // todo handle edit
                if (widget.isEdit == true) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.navBar,
                        (Route<dynamic> route) => false,
                    arguments: {'role': StringConstant.patient, 'initial_index': 0},
                  );
                  // if(F.appFlavor == Flavor.PRODUCTION){
                  //   aliceProd.getNavigatorKey()?.currentState?.pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) => const LoginPage(
                  //               tokenExpired: true, isFromRegister: true)),
                  //           (route) => false);
                  // } else {
                  //   aliceDev.getNavigatorKey()?.currentState?.pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) => const LoginPage(
                  //               tokenExpired: true, isFromRegister: true)),
                  //           (route) => false);
                  // }

                } else {
                  if(F.appFlavor == Flavor.PRODUCTION){
                    aliceProd
                        .getNavigatorKey()
                        ?.currentState
                        ?.pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const LoginPage(
                                tokenExpired: true,
                                isFromRegister: true)),
                            (route) => false);
                  } else {
                    aliceMain
                        .getNavigatorKey()
                        ?.currentState
                        ?.pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const LoginPage(
                                tokenExpired: true,
                                isFromRegister: true)),
                            (route) => false);
                  }
                }
              }
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //                 RouteName.homeScreen,
            //                 ModalRoute.withName(RouteName.homeScreen),
            //               );
          }
        },
        child: BlocBuilder<SurveyPageBloc, SurveyPageState>(
          builder: (context, state) {
            return Container(
              color: Colors.white,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(left: 50, right: 50),
                              child: SvgPicture.asset(
                                'assets/survey_logo.svg',
                                fit: BoxFit.fitHeight,
                                // height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 30, top: 10),
                              color: Colors.white,
                              child: Center(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: const Text(
                                          "Jawab Pertanyaan",
                                          style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 0, left: 30, right: 30),
                                        child: const Text(
                                          "Anda akan mendapatkan konten yang sesuai dengan kebutuhan jika menjawabpertanyaan berikut",
                                          maxLines: 5,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                    ),
                                    child: const Text(
                                      "Apakah saat ini Anda sedang Hamil?",
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  isPage1
                                      ? Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {

                                                    Injector.resolve<
                                                            SurveyPageBloc>()
                                                        .add(const SurveyChoice(
                                                            1));
                                                    isPregnant = true;
                                                    isEdit = false;

                                                },
                                                child: Container(
                                                    decoration: (isEdit && state.user?.isPregnant == true) || state.choice == 1
                                                        ? BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primer)
                                                        : BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  EpregnancyColors
                                                                      .primerSoft,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 30,
                                                            left: 30,
                                                            bottom: 30),
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 25,
                                                              bottom: 25,
                                                              left: 20,
                                                              right: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            // margin: EdgeInsets.only(left: 20),
                                                            child: Text(
                                                              "Ya ",
                                                              style: TextStyle(
                                                                  color: (isEdit &&
                                                                              state.user?.isPregnant ==
                                                                                  true) ||
                                                                          state.choice ==
                                                                              1
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 14),
                                                              maxLines: 3,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                              InkWell(
                                                onTap: () {

                                                    Injector.resolve<
                                                            SurveyPageBloc>()
                                                        .add(const SurveyChoice(
                                                            2));
                                                    isPlanningPregnancy = true;
                                                    isEdit = false;

                                                },
                                                child: Container(
                                                    decoration: (isEdit && state.user?.isPlanningPregnancy == true) || state.choice == 2
                                                        ? BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primer)
                                                        : BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  EpregnancyColors
                                                                      .primerSoft,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 30,
                                                            left: 30,
                                                            bottom: 30),
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 25,
                                                              bottom: 25,
                                                              left: 20,
                                                              right: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              child: Text(
                                                                "Tidak, tapi saya sedang merencanakannya ",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: (isEdit && state.user?.isPlanningPregnancy == true) ||
                                                                            state.choice ==
                                                                                2
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        14),
                                                                maxLines: 3,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                              InkWell(
                                                onTap: () {

                                                    Injector.resolve<
                                                            SurveyPageBloc>()
                                                        .add(const SurveyChoice(
                                                            3));
                                                    isHaveBaby = true;
                                                    isEdit = false;

                                                },
                                                child: Container(
                                                    decoration: (isEdit &&
                                                                state.user
                                                                        ?.isHaveBaby ==
                                                                    true) ||
                                                            state.choice == 3
                                                        ? BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primer)
                                                        : BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  EpregnancyColors
                                                                      .primerSoft,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 30,
                                                            left: 30,
                                                            bottom: 30),
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 25,
                                                              bottom: 25,
                                                              left: 20,
                                                              right: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Text(
                                                              "Saya sudah punya bayi ",
                                                              style: TextStyle(
                                                                  color: (isEdit &&
                                                                              state.user?.isHaveBaby ==
                                                                                  true) ||
                                                                          state.choice ==
                                                                              3
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 14),
                                                              maxLines: 3,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "2 dari 4",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width - 40,
                            height: 50,
                            child: RaisedButton(
                              color: (state.user?.isPregnant != false &&
                                          state.user?.isPregnant != false &&
                                          state.user?.isPregnant != false) ||
                                      state.choice != 0
                                  ? EpregnancyColors.primer
                                  : Colors.grey.shade200,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  state.choice != 1 ?widget.isEdit == true
                                      ? "Simpan" : "Selanjutnya": "Selanjutnya",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              elevation: 8,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              onPressed: () async {
                                if (isEdit) {
                                  Injector.resolve<SurveyPageBloc>().add(
                                      SurveyAddDataEvent(
                                          state.user!.isPregnant!,
                                          state.user!.isHaveBaby!,
                                          state.user!.isPlanningPregnancy!,
                                          widget.isEdit!));
                                } else if (state.choice != 0) {
                                  Injector.resolve<SurveyPageBloc>().add(
                                      SurveyAddDataEvent(
                                          isPregnant,
                                          isPlanningPregnancy,
                                          isHaveBaby,
                                          widget.isEdit!));
                                }

                                  isPregnant = false;
                                  isHaveBaby = false;
                                  isPlanningPregnancy =false;

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
    return BlocBuilder<SurveyPageBloc, SurveyPageState>(
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
