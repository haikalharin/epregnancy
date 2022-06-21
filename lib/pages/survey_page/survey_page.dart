import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';

import 'bloc/survey_page_bloc.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  bool isPage1 = true;
  bool isPage2 = false;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  bool _value = false;
  int val = -1;
  int val2 = -1;
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
    if (state.status == FormzStatus.submissionFailure) {
      const snackBar = SnackBar(
          content: Text("failed"), backgroundColor: Colors.red);
      Scaffold.of(context).showSnackBar(snackBar);
    } else if (state.status == FormzStatus.submissionSuccess) {
      Navigator.of(context).pushNamed(RouteName.navBar,arguments: 0);
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //                 RouteName.homeScreen,
      //                 ModalRoute.withName(RouteName.homeScreen),
      //               );
    }
  },
  child: BlocBuilder<SurveyPageBloc, SurveyPageState>(
  builder: (context, state) {
    return Stack(
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
                      margin: EdgeInsets.only(bottom: 30,top: 10),
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: const Text(
                                  "Jawab Pertanyaan",
                                  style: const TextStyle(
                                      fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 20),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             isPage1 = true;
                              //             isPage2 = false;
                              //           });
                              //         },
                              //         child: Container(
                              //           child: Column(
                              //             children: [
                              //               Container(
                              //                 child: Text(
                              //                   "1",
                              //                   style: TextStyle(
                              //                       fontSize: 18,
                              //                       fontWeight: FontWeight.bold,
                              //                       color: color1),
                              //                 ),
                              //               ),
                              //               Container(
                              //                 width: 40,
                              //                 height: 5,
                              //                 decoration: BoxDecoration(
                              //                   color: color1,
                              //                   borderRadius:
                              //                       BorderRadius.circular(10.0),
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 20,
                              //       ),
                              //       InkWell(
                              //         onTap: () {
                              //           setState(() {
                              //             isPage2 = true;
                              //             isPage1 = false;
                              //           });
                              //         },
                              //         child: Container(
                              //           child: Column(
                              //             children: [
                              //               Container(
                              //                 child: Text(
                              //                   "2",
                              //                   style: TextStyle(
                              //                       fontSize: 18,
                              //                       fontWeight: FontWeight.bold,
                              //                       color: color2),
                              //                 ),
                              //               ),
                              //               Container(
                              //                 width: 40,
                              //                 height: 5,
                              //                 decoration: BoxDecoration(
                              //                   color: color2,
                              //                   borderRadius:
                              //                       BorderRadius.circular(10.0),
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 0, left: 30, right: 30),
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
                            margin: const EdgeInsets.only( left: 30, right: 30,),
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
                          isPage1?Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      String condition = 'PREGNANT';
                                      Injector.resolve<SurveyPageBloc>().add(SurveyAddDataEvent(condition));
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: EpragnancyColors.primer,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 30, left: 30, bottom: 30),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 25,
                                            bottom: 25,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(left: 20),
                                              child: const Text(
                                                "Ya ",
                                                style: TextStyle(fontSize: 14),
                                                maxLines: 3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      String condition = 'NOT PREGNANT';
                                      Injector.resolve<SurveyPageBloc>().add(SurveyAddDataEvent(condition));
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: EpragnancyColors.primer,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 30, left: 30, bottom: 30),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 25,
                                            bottom: 25,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 20, right: 20),
                                                child: const Text(
                                                  "Tidak, tapi saya sedang merencanakannya ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 14),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      String condition = 'POST MATERNITY';
                                      Injector.resolve<SurveyPageBloc>().add(SurveyAddDataEvent(condition));
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: EpragnancyColors.primer,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 30, left: 30, bottom: 30),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 25,
                                            bottom: 25,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 20, right: 20),
                                              child: const Text(
                                                "Saya sudah punya bayi ",
                                                style: TextStyle(fontSize: 14),
                                                maxLines: 3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ): Container(),

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
    return BlocBuilder<LoginExampleBloc, LoginExampleState>(builder: (context, state) {
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
