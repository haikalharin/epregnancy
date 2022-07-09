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

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';

import 'bloc/survey_page_bloc.dart';

class SurveyPageBaby extends StatefulWidget {
  const SurveyPageBaby({Key? key}) : super(key: key);

  @override
  State<SurveyPageBaby> createState() => _SurveyPageBabyState();
}

class _SurveyPageBabyState extends State<SurveyPageBaby> {
  bool isChoice1 = false;
  bool isChoice2 = false;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  int val = -1;
  int val2 = -1;

  @override
  void initState() {
    Injector.resolve<SurveyPageBloc>().add(const SurveyInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurveyPageBloc, SurveyPageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionFailure) {
          const snackBar =
              SnackBar(content: Text("failed"), backgroundColor: Colors.red);
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (state.submitStatus == FormzStatus.submissionSuccess) {
          Navigator.of(context).pushNamed(RouteName.landingPage);
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //                 RouteName.homeScreen,
          //                 ModalRoute.withName(RouteName.homeScreen),
          //               );
        }
      },
      child: BlocBuilder<SurveyPageBloc, SurveyPageState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () {
              if (state.page == 4) {
                Injector.resolve<SurveyPageBloc>().add(SurveyPageChanged(3));
                return Future.value(false);
              } else if (state.page == 3) {
                Navigator.pop(context);
                return Future.value(true);
              } else {
                return Future.value(false);
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: EpregnancyColors.primerSoft,
                iconTheme: IconThemeData(color: Colors.black),
                leading: GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    if (state.page == 4) {
                      Injector.resolve<SurveyPageBloc>()
                          .add(SurveyPageChanged(3));
                    } else if (state.page == 3) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              body: Container(
                color: EpregnancyColors.primerSoft,
                child: Stack(
                  children: [
                    state.page == 3
                        ? const LastMenstruation()
                        : const BabyName(),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${state.page} dari 4",
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
                                color: state.page == 3
                                    ? state.date.valid
                                        ? EpregnancyColors.primer
                                        : EpregnancyColors.primerSoft2
                                    : state.page == 4
                                        ? state.name.valid
                                            ? EpregnancyColors.primer
                                            : EpregnancyColors.primerSoft2
                                        : EpregnancyColors.primerSoft2,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "Mulai Konsultasi",
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
                                  if (state.page == 3 && state.date.valid) {
                                    Injector.resolve<SurveyPageBloc>()
                                        .add(SurveyPageChanged(4));
                                  } else if (state.page == 4 && state.name.valid) {
                                    Injector.resolve<SurveyPageBloc>()
                                        .add(SurveyAddDataBabyEvent());
                                  }
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
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginExampleBloc, LoginExampleState>(
        builder: (context, state) {
      if (state.status == FormzStatus.submissionInProgress) {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
