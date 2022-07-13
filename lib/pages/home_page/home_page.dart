import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_calendar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';
import 'list_article.dart';
import 'list_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModelFirebase user = UserModelFirebase.empty();

  void getMyPerson() async {
    UserModelFirebase userModelFirebase =
        await AppSharedPreference.getUserFirebase();
    setState(() {
      user = userModelFirebase;
    });
  }

  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
    Injector.resolve<HomePageBloc>().add(ArticleFetchEvent());

    super.initState();
  }

  @override
  void dispose() {
    Injector.resolve<HomePageBloc>().add(HomeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              String? name = state.user != null ? state.user!.name : "";
              return Container(
                child: ListView(
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 0, top: 20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 50, right: 50, bottom: 20),
                                  child: Text("Halo, $name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: EpregnancyColors.primer),
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 30, right: 30),
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        state.baby != null ? Container(
                                            margin: EdgeInsets.only(
                                                bottom: 10),
                                            child:  Expanded(
                                              child: Text(
                                                 state.baby!.babyName!,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,fontWeight: FontWeight.bold),
                                                maxLines: 3,
                                              ),
                                            )): Container(),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(left: 50, right: 50),
                                              child: SvgPicture.asset(
                                                'assets/ePregnancy_logo.svg',
                                                fit: BoxFit.fitHeight,
                                                // height: 200,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [

                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            margin: EdgeInsets.only(
                                                                bottom: 10),
                                                            child: const Text(
                                                              "Trimester Pertama anda",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color:
                                                                      Colors.white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          child: const Icon(
                                                            Icons.arrow_forward_ios,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      width: 200,
                                                      child: const Text(
                                                        "Anda akan mengalami morning sickness secars berkala ",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white),
                                                        maxLines: 3,
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: const Text(
                                                        "8 minggu 1 hari ",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      )),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  6.0),
                                                          color: Colors.white),
                                                      child: Container(
                                                        width: 210,
                                                        height: 30,
                                                        child: Center(
                                                          child: Container(
                                                            child: const Text(
                                                              "Ubah Profil Kehamilan ",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      EpregnancyColors
                                                                          .primer),
                                                              maxLines: 3,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: EpragnancyColors.pink,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    // ),

                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.primerSoft),
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                        bottom: 20),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                EdgeInsets.only(left: 16),
                                                child: Container(
                                                    // margin: EdgeInsets.only(
                                                    //     left: 50, right: 50, bottom: 20),
                                                    child: const Text(
                                                  "Menangkan poin untuk tukar hadiah ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  maxLines: 3,
                                                )),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 16),
                                                child: Container(
                                                    // margin: EdgeInsets.only(
                                                    //     left: 50, right: 50, bottom: 20),
                                                    child: const Text(
                                                  "2.000 POIN ",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  maxLines: 3,
                                                )),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(
                                              'assets/ic_trophy.svg',
                                              fit: BoxFit.fitHeight,
                                              // height: 200,
                                              // height: 60,
                                              // width: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        // height: 200,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: const Text(
                                      "Artikel Untuk Anda",
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                    )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(RouteName.dashboardArticle);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Text("Artikel lainnya",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),)),
                                            Container(
                                              child: const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  state.status ==
                                          FormzStatus.submissionInProgress
                                      ? Expanded(child: ListShimmer())
                                      : Expanded(
                                          child: ListArticle(
                                          listArticle: state.listArticle ?? [],
                                        ))
                                ],
                              ),
                            ],
                          ),
                        )),
                    Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: const Text(
                                    "Kalender Saya",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                  )),
                                  Container(
                                      child:
                                          Icon(Icons.calendar_today_outlined)),
                                ],
                              ),
                            ),
                            Container(height: 500, child: TabBarCalendarPage()),
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
