import 'package:PregnancyApp/data/model/baby_model/new_baby_model.dart';
import 'package:PregnancyApp/data/model/baby_model_api/baby_Model_api.dart';
import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../main_default.dart';
import '../../utils/basic_loading_dialog.dart';
import '../../utils/epragnancy_color.dart';

import '../../utils/string_constans.dart';
import '../games_page/bloc/games_bloc.dart';
import '../login_page/login_page.dart';
import 'new_born_success_page.dart';
import 'bloc/new_born_page_bloc.dart';

class QuestionerNewBornPage extends StatefulWidget {
  const QuestionerNewBornPage({Key? key, this.isEdit = false, this.babyModel})
      : super(key: key);
  final bool? isEdit;
  final NewBabyModel? babyModel;

  @override
  State<QuestionerNewBornPage> createState() => _QuestionerNewBornPageState();
}

class _QuestionerNewBornPageState extends State<QuestionerNewBornPage> {
  bool isPage1 = true;
  bool isPage2 = false;

  Color color1 = Colors.black;
  Color color2 = Colors.black;
  bool _value = false;
  String condition = "";
  bool isYes = false;
  bool isNo = false;
  bool isEtc = false;
  int val = -1;
  int val2 = -1;
  bool isEdit = false;

  @override
  void initState() {
    isEdit = widget.isEdit!;
    isYes = false;
    isNo = false;
    isEtc = false;
    // Injector.resolve<NewBornPageBloc>().add(const NewBornDisposeEvent());
    super.initState();
  }

  @override
  void dispose() {
    Injector.resolve<NewBornPageBloc>().add(const NewBornDisposeEvent());
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
      body: BlocListener<NewBornPageBloc, NewBornPageState>(
        listener: (context, state) {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            const snackBar =
                SnackBar(content: Text("failed"), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess &&
              state.type == 'updateBaby') {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteName.navBar,
                  (Route<dynamic> route) => false,
              arguments: {
                'role': StringConstant.patient,
                'initial_index': 0
              },
            );
          }
        },
        child: BlocBuilder<NewBornPageBloc, NewBornPageState>(
          builder: (context, state) {
            return Container(
              color: EpregnancyColors.primerSoft,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: EpregnancyColors.primerSoft,
                        image: DecorationImage(
                            image: AssetImage('assets/bg_survey_baby.png'),
                            fit: BoxFit.cover)),
                  ),
                  ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              child: SvgPicture.asset(
                                'assets/ic_baby.svg',
                                fit: BoxFit.fitHeight,
                                // height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: const Text(
                                          "Bunda sudah melahirkan?",
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
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
                                                  // todo handle choise yes route to input child data

                                                  // todo handle if you success add data
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return NewBornSuccessPage(
                                                      username: '',
                                                      password: '',
                                                    );
                                                  }));
                                                  isYes = true;
                                                  isEdit = false;
                                                },
                                                child: Container(
                                                    decoration: (isEdit &&
                                                                state.user
                                                                        ?.isPregnant ==
                                                                    true) ||
                                                            state.choice == 1
                                                        ? BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primerSoft2)
                                                        : BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .white),
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
                                                                      ? EpregnancyColors
                                                                          .primer
                                                                      : EpregnancyColors
                                                                          .primer,
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
                                                          NewBornPageBloc>()
                                                      .add(const NewBornChoice(
                                                          2));
                                                  _showPicker(context);
                                                  isNo = true;
                                                  isEdit = false;
                                                },
                                                child: Container(
                                                    decoration: (isEdit &&
                                                                state.user
                                                                        ?.isPlanningPregnancy ==
                                                                    true) ||
                                                            state.choice == 2
                                                        ? BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primerSoft2)
                                                        : BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .white),
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
                                                                "Belum",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: (isEdit && state.user?.isPlanningPregnancy == true) ||
                                                                            state.choice ==
                                                                                2
                                                                        ? EpregnancyColors
                                                                            .primer
                                                                        : EpregnancyColors
                                                                            .primer,
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
                                                          NewBornPageBloc>()
                                                      .add(const NewBornChoice(
                                                          3));
                                                  _showPicker(context);
                                                  isEtc = true;
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
                                                                BorderRadius.circular(
                                                                    12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .primerSoft2)
                                                        : BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            color:
                                                                EpregnancyColors
                                                                    .white),
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
                                                              "Lainnya",
                                                              style: TextStyle(
                                                                  color: (isEdit &&
                                                                              state.user?.isHaveBaby ==
                                                                                  true) ||
                                                                          state.choice ==
                                                                              3
                                                                      ? EpregnancyColors
                                                                          .primer
                                                                      : EpregnancyColors
                                                                          .primer,
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
                  _Loading()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Wrap(
                children: [
                  Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: EpregnancyColors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          width: 40,
                          height: 4,
                          margin: EdgeInsets.only(top: 16))),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 28, top: 20),
                          child: Text("Lainnya"))),
                  Divider(),
                  ListTile(
                      leading: Image.asset('assets/ic_heart_break.png'),
                      title: Text(
                        'Kehilangan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        showAlertDialog(context, widget.babyModel??const NewBabyModel(),
                            isDelete: true);
                        // showAlertDialog(context,1);
                      }),
                  Divider(),
                  ListTile(
                      leading: Image.asset('assets/ic_delete.png'),
                      title: Text(
                        'Hapus Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () async {
                        showAlertDialog(context, widget.babyModel??const NewBabyModel(),
                            isDelete: true);
                        // showAlertDialog(context,1);
                      }),
                ],
              ),
            ),
          );
        });
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBornPageBloc, NewBornPageState>(
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

showAlertDialog(BuildContext context, NewBabyModel babyModel,
    {bool isDelete = false}) {
  Widget cancelButton = FlatButton(
    height: 40.h,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: EpregnancyColors.primer, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8.w)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
                child: Container(
                    child: Text(
          "Tidak, Nanti Saja",
          textAlign: TextAlign.center,
        )))),
      ],
    ),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );
  Widget continueButton = FlatButton(
    height: 40.h,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
    color: EpregnancyColors.primer,
    textColor: EpregnancyColors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Center(
                child: Text(
          "Ya, Hapus Data Anak",
          textAlign: TextAlign.center,
        ))),
      ],
    ),
    onPressed: () async {
      if (isDelete) {
        Injector.resolve<NewBornPageBloc>()
            .add(NewBornDeleteDataBabyEvent(babyModel));
      } else {
        Injector.resolve<NewBornPageBloc>()
            .add(NewBornUpdateDataBabyEvent(babyModel,'KEHILANGAN'));
      }
    },
  );
  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        const Text(
          "Sebelum Hapus Data Anak",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 32.h,
        ),
        const Text(
          """ Apakah Anda yakin ? dengan mengkonfirmasi maka Profil Anak akan dihapus secara permanen.""",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    actions: [
      continueButton,
      SizedBox(
        height: 12,
      ),
      cancelButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Container(child: alert));
    },
  );
}
