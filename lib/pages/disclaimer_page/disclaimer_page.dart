import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:toast/toast.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/countly_analytics.dart';
import '../../utils/remote_utils.dart';
import '../signup_page/bloc/signup_bloc.dart';
import 'bloc/disclaimer_page_bloc.dart';

class DisclaimerPage extends StatefulWidget {
  DisclaimerPage({Key? key, this.userId, this.from, this.isPatient})
      : super(key: key);
  final bool? isPatient;
  final String? userId;
  final String? from;

  @override
  State<DisclaimerPage> createState() => _DisclaimerPageState();
}


class _DisclaimerPageState extends State<DisclaimerPage> {
  bool? checkedValue = false;


  @override
  void initState() {
    CountlyAnalyticsService(context)
        .basicEvent({'key': 'Syarat_dan_ketentuan_page', 'count': 1});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Syarat dan Ketentuan",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: BlocListener<DisclaimerPageBloc, DisclaimerPageState>(
        listener: (context, state) async {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            var message = state.errorMessage ?? 'gagal';
            final snackBar =
                SnackBar(content: Text(message), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess) {
            if (widget.isPatient == true) {
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
                  RouteName.dashboardNakesPage, (Route<dynamic> route) => false,
                  arguments: {
                    'name': state.userModel?.name,
                    'image_url': state.userModel?.imageUrl,
                    'hospital_id': state.userModel?.hospitalId
                  });
            }
          }
        },
        child: BlocBuilder<DisclaimerPageBloc, DisclaimerPageState>(
          builder: (context, state) {
            return ExpandableTheme(
              data: const ExpandableThemeData(
                iconColor: EpregnancyColors.primer,
                useInkWell: true,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Html(
                          data: widget.isPatient == true
                              ? remoteConfigGetString(
                                  StringConstant.termAndConditionUserHeader)
                              : remoteConfigGetString(
                                  StringConstant.termAndConditionMidwifeHeader),
                        ))
                      ],
                    ),
                  ),
                  Card1(widget.isPatient ?? true),
                  Card2(widget.isPatient ?? true),
                  widget.from == "account"
                      ? Container()
                      : CheckboxListTile(
                    activeColor: EpregnancyColors.primer,
                    contentPadding: EdgeInsets.only(top: 5.h),
                    title: Container(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            "Centang untuk menyetujui Syarat dan Ketentuan yang telah Anda baca dengan teliti.",
                            style: TextStyle(color: EpregnancyColors.black),
                          )),
                        ],
                      ),
                    ),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  widget.from == "account"
                      ? Container()
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 50,
                                child: RaisedButton(
                                  color: checkedValue == true
                                      ? EpregnancyColors.primer
                                      : EpregnancyColors.primer
                                          .withOpacity(0.25),
                                  child: Padding(
                                    padding: EdgeInsets.zero,
                                    child: Text(
                                      "Saya Setuju",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.w)),
                                  ),
                                  onPressed: () async {
                                    if (checkedValue == true) {
                                      if (widget.from == "login") {
                                        Injector.resolve<DisclaimerPageBloc>()
                                            .add(DisclaimerAddDataEvent());
                                      } else {
                                        Navigator.of(context).pushNamed(
                                            RouteName.otpPage,
                                            arguments: {
                                              'username': widget.userId,
                                              'from': "disclaimer"
                                            }).then((value) {
                                          Navigator.pop(context);
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// const loremIpsum =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatefulWidget {
  Card1(this.isPatient);

  bool isPatient;

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  static bool isOpened = true;
  ExpandableController additionalInfoController = ExpandableController(
    initialExpanded: isOpened,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        additionalInfoController.addListener(() {
          isOpened = !isOpened;
        });
      },
      child: ExpandableNotifier(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 150,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       shape: BoxShape.rectangle,
            //     ),
            //   ),
            // ),

            Visibility(
              visible: false,
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  controller: additionalInfoController,
                  theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      iconSize: 30),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Layanan",
                        style: TextStyle(
                            color: EpregnancyColors.primer,
                            fontWeight: FontWeight.bold),
                        // style: Theme.of(context).textTheme.body2,
                      )),
                  collapsed: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // for (var _ in Iterable.generate(5))
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.shade300,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Html(
                            data: widget.isPatient
                                ? remoteConfigGetString(
                                    StringConstant.termAndConditionUserBody1)
                                : remoteConfigGetString(
                                    StringConstant.termAndConditionMidwifeBody1),
                          )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Card2 extends StatefulWidget {
  Card2(this.isPatient);

  bool isPatient;

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  static bool isOpened = true;
  ExpandableController additionalInfoController = ExpandableController(
    initialExpanded: isOpened,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        additionalInfoController.addListener(() {
          isOpened = !isOpened;
        });
      },
      child: ExpandableNotifier(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 150,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       shape: BoxShape.rectangle,
            //     ),
            //   ),
            // ),

            Visibility(
              visible: false,
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  controller: additionalInfoController,
                  theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      iconSize: 30),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Informasi yang dibagikan",
                        style: TextStyle(
                            color: EpregnancyColors.primer,
                            fontWeight: FontWeight.bold),
                        // style: Theme.of(context).textTheme.body2,
                      )),
                  collapsed: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // for (var _ in Iterable.generate(5))
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.shade300,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Html(
                            data: widget.isPatient
                                ? remoteConfigGetString(
                                    StringConstant.termAndConditionUserBody2)
                                : remoteConfigGetString(
                                    StringConstant.termAndConditionMidwifeBody2),
                          )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Card3 extends StatefulWidget {
  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  static bool isOpened = true;
  ExpandableController additionalInfoController = ExpandableController(
    initialExpanded: isOpened,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        additionalInfoController.addListener(() {
          isOpened = !isOpened;
        });
      },
      child: ExpandableNotifier(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 150,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       shape: BoxShape.rectangle,
            //     ),
            //   ),
            // ),

            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                controller: additionalInfoController,
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    iconSize: 30),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Informasi yang dibagikan",
                      style: TextStyle(
                          color: EpregnancyColors.primer,
                          fontWeight: FontWeight.bold),
                      // style: Theme.of(context).textTheme.body2,
                    )),
                collapsed: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // for (var _ in Iterable.generate(5))
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Html(
                          data: remoteConfigGetString(
                              StringConstant.termAndConditionUserBody2),
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<DisclaimerPageBloc, DisclaimerPageState>(
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
