import 'package:PregnancyApp/data/model/baby_model/new_baby_model.dart';
import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/survey_page/widget/baby_name.dart';
import 'package:PregnancyApp/pages/survey_page/widget/last_menstruation.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/model/baby_model_api/baby_Model_api.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../main_default.dart';
import '../../utils/countly_analytics.dart';
import '../../utils/epragnancy_color.dart';

import '../../utils/string_constans.dart';
import '../home_page/bloc/home_page_bloc.dart';
import '../login_page/login_page.dart';
import 'bloc/survey_page_bloc.dart';

class SurveyPageBaby extends StatefulWidget {
  const SurveyPageBaby(
      {Key? key,
      this.isEdit = false,
      this.editName = false,
      this.fromRegister = false})
      : super(key: key);
  final bool? isEdit;
  final bool? editName;
  final bool? fromRegister;

  @override
  State<SurveyPageBaby> createState() => _SurveyPageBabyState();
}

class _SurveyPageBabyState extends State<SurveyPageBaby> {
  bool isChoice1 = false;
  bool isChoice2 = false;
  bool isDisplay = false;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  int val = -1;
  int val2 = -1;
  final PublishSubject<bool> _streamSurvey = PublishSubject();

  @override
  void initState() {
    Injector.resolve<SurveyPageBloc>()
        .add(SurveyInitEvent(isUpdate: widget.isEdit ?? false));
    if (widget.editName == true) {
      CountlyAnalyticsService(context)
          .basicEvent({'key': 'Siapa_nama_bayi_welcome_page', 'count': 1});
      Injector.resolve<SurveyPageBloc>().add(const SurveyPageChanged(3));
    } else {
      CountlyAnalyticsService(context).basicEvent(
          {'key': 'Kapan_hari_haid_pertama_welcome_page', 'count': 1});
      Injector.resolve<SurveyPageBloc>().add(const SurveyPageChanged(2));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<SurveyPageBloc, SurveyPageState>(
        listener: (context, state) {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            const snackBar =
                SnackBar(content: Text("failed"), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess &&
              state.type == 'submitBaby') {
            if (widget.isEdit == true) {
              // Navigator.of(context).pushNamed(RouteName.navBar, arguments: {
              //   'role': StringConstant.patient,
              //   'initial_index': 0
              // });
              Injector.resolve<HomePageBloc>().add(const HomeFetchDataEvent());
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.navBar,
                (Route<dynamic> route) => false,
                arguments: {'role': StringConstant.patient, 'initial_index': 0},
              );
            } else {
              // Navigator.of(context).pushNamed(RouteName.landingPage);
              Injector.resolve<HomePageBloc>().add(const HomeFetchDataEvent());
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.navBar,
                    (Route<dynamic> route) => false,
                arguments: {
                  'role': StringConstant.patient,
                  'initial_index': 0
                },
              );
            }
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //                 RouteName.homeScreen,
            //                 ModalRoute.withName(RouteName.homeScreen),
            //               );
          } else if (state.submitStatus == FormzStatus.submissionSuccess &&
              state.type == 'init-data-survey') {
            if (_streamSurvey != null) {
              _streamSurvey.sink.add(true);
              isDisplay = true;
            }
          }
        },
        child: BlocBuilder<SurveyPageBloc, SurveyPageState>(
          builder: (context, state) {
            print("state page : ${state.page}");
            return WillPopScope(
              onWillPop: () {
                // todo handle back press device
                if (state.page == 3) {
                  if (widget.editName == true) {
                    Navigator.pop(context);
                  } else {
                    Injector.resolve<SurveyPageBloc>()
                        .add(SurveyPageChanged(2));
                  }
                  return Future.value(false);
                } else if (state.page == 2) {
                  // Navigator.pop(context);
                  if (widget.isEdit == true) {
                    Navigator.pop(context);
                    return Future.value(true);
                  } else {
                    return Future.value(false);
                  }
                } else {
                  if (widget.isEdit == true) {
                    Navigator.pop(context);
                    return Future.value(true);
                  } else {
                    Navigator.of(context).pushNamed(RouteName.signup);
                    return Future.value(false);
                  }
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: EpregnancyColors.primerSoft,
                  iconTheme: IconThemeData(color: Colors.black),
                  leading: state.page == 3
                      ? GestureDetector(
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onTap: () {
                            // todo handle back
                            if (state.page == 3) {
                              if (widget.editName == true) {
                                Navigator.pop(context);
                              } else {
                                Injector.resolve<SurveyPageBloc>()
                                    .add(SurveyPageChanged(2));
                              }
                            } else if (state.page == 2) {
                              if (widget.isEdit == true) {
                                Navigator.pop(context);
                              }
                              // Navigator.pop(context);
                            } else {
                              if (widget.isEdit == true) {
                                Navigator.pop(context);
                              } else {
                                // cannot back (new flow)
                                // Navigator.of(context).pushNamed(RouteName.signup);
                              }
                            }
                          },
                        )
                      : widget.fromRegister != null
                          ? SizedBox.shrink()
                          : IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                  // widget.fromRegister == false ? const SizedBox.shrink() : GestureDetector(
                  //   child: const Icon(
                  //     Icons.arrow_back_ios,
                  //     color: Colors.black,
                  //   ),
                  //   onTap: () {
                  //     // todo handle back
                  //     if(widget.isEdit == true) {
                  //       Navigator.pop(context);
                  //     }
                  //   },
                  // ),
                ),
                body: StreamBuilder<bool>(
                    stream: _streamSurvey.stream,
                    builder: (context, snapshot) {

                      return snapshot.data == true
                          ? Container(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: EpregnancyColors.primerSoft,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/bg_survey_baby.png'),
                                            fit: BoxFit.cover)),
                                    child: ListView(
                                      children: [
                                        state.page == 2
                                            ? LastMenstruation(
                                                isEdit: widget.isEdit,
                                                baby: state.dataBaby ??
                                                    const NewBabyModel(),
                                              )
                                            : BabyName(
                                                isEdit: widget.isEdit,
                                                baby: state.dataBaby ??
                                                    const NewBabyModel()),
                                        Container(
                                          margin: EdgeInsets.only(top: 200),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                // note ada perubahan step
                                                "${state.page - 1} dari 2",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                              Align(
                                                alignment: Alignment(0, 1),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      40,
                                                  height: 50,
                                                  child: RaisedButton(
                                                    color: state.page == 2
                                                        ? state.date.valid
                                                            ? EpregnancyColors
                                                                .primer
                                                            : EpregnancyColors
                                                                .primerSoft2
                                                        : state.page == 3
                                                            ? state.name.valid
                                                                ? EpregnancyColors
                                                                    .primer
                                                                : EpregnancyColors
                                                                    .primerSoft2
                                                            : EpregnancyColors
                                                                .primerSoft2,
                                                    child: Padding(
                                                      padding: EdgeInsets.zero,
                                                      child: Text(
                                                        state.page == 3
                                                            ? widget.isEdit ==
                                                                    true
                                                                ? "Simpan"
                                                                : "Selanjutnya"
                                                            : "Selanjutnya",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    elevation: 8,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7)),
                                                    ),
                                                    onPressed: () async {
                                                      if (state.page == 2 &&
                                                          state.date.valid) {
                                                        CountlyAnalyticsService(context).basicEvent({
                                                          'key':
                                                          'Siapa_nama_bayi_welcome_page_button_selanjutnya',
                                                          'count': 1
                                                        });
                                                        Injector.resolve<SurveyPageBloc>().add(SurveyPageChanged(3));
                                                      } else if (state.page == 3 && state.name.valid) {
                                                        if (widget.isEdit == true) {
                                                          CountlyAnalyticsService(context).basicEvent({'key': 'Siapa_nama_bayi_welcome_page_button_simpan', 'count': 1
                                                          });
                                                        } else {
                                                          CountlyAnalyticsService(context).basicEvent({'key': 'Kapan_hari_haid_pertama_welcome_page_button_selanjutnya', 'count': 1
                                                          });
                                                          Injector.resolve<SurveyPageBloc>().add(const SurveyPageChanged(2));
                                                        }
                                                        Injector.resolve<SurveyPageBloc>().add(SurveyAddDataEvent(true, false, false, widget.isEdit!));
                                                        Injector.resolve<SurveyPageBloc>().add(SurveyAddDataBabyEvent(isUpdate: widget.isEdit!));
                                                      } else if (state.page == 1 && state.name.valid) {
                                                        Injector.resolve<SurveyPageBloc>().add(SurveyPageChanged(2));
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              state.page == 3
                                                  ? Align(
                                                      alignment:
                                                          Alignment(0, 1),
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            40,
                                                        height: 50,
                                                        child: RaisedButton(
                                                          color:
                                                              EpregnancyColors
                                                                  .primer,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            child: Text(
                                                              "Lewati",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          elevation: 8,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            7)),
                                                          ),
                                                          onPressed: () async {
                                                            CountlyAnalyticsService(context).basicEvent({
                                                              'key':
                                                              'Siapa_nama_bayi_welcome_page_button_lewati',
                                                              'count': 1
                                                            });
                                                            Injector.resolve<
                                                                    SurveyPageBloc>()
                                                                .add(SurveyAddDataEvent(
                                                                    true,
                                                                    false,
                                                                    false,
                                                                    widget
                                                                        .isEdit!));
                                                            Injector.resolve<
                                                                    SurveyPageBloc>()
                                                                .add(SurveyAddDataBabyEvent(
                                                                    isUpdate: widget
                                                                        .isEdit!));
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _Loading(),
                                ],
                              ),
                            )
                          : Container();
                    }),
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
