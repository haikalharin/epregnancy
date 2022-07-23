import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_event_page.dart';
import 'package:PregnancyApp/utils/date_picker.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  UserModelFirebase user = UserModelFirebase.empty();
  DateTime dateTime = DateTime.now();
  String dateTimeString = "";
  TabController? _tabController;

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

    Injector.resolve<HomePageBloc>().add(HomeEventDateChanged(DateTime.now()));
    _tabController = TabController(length: 2, vsync: this);
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
            if (state.status == FormzStatus.submissionSuccess) {}
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: EpregnancyColors.primer)),
                                ),
                                state.role != null &&
                                        state.role!.condition ==
                                            StringConstant.pregnant
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: EpregnancyColors.primer),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              state.baby != null
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: Text(
                                                        state.baby!.babyName!,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 3,
                                                      ))
                                                  : Container(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  state.babyProgressModel !=
                                                          null
                                                      ? Container(
                                                          // margin: EdgeInsets.only(left: 50, right: 50),
                                                          child: FadeInImage(
                                                            placeholder: AssetImage(
                                                                'assets/ic_no_photo.png'),
                                                            image: NetworkImage(
                                                                state
                                                                    .babyProgressModel!
                                                                    .iconUrl!),
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                            imageErrorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Image
                                                                  .asset(
                                                                'assets/ic_no_photo.png',
                                                                width: 60,
                                                                height: 60,
                                                                fit: BoxFit
                                                                    .cover,
                                                              );
                                                            },
                                                          ),
                                                        )
                                                      : Container(
                                                          width: 60,
                                                          height: 60,
                                                        ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10),
                                                                  width: 200,
                                                                  child: Text(
                                                                    state.babyProgressModel !=
                                                                            null
                                                                        ? state
                                                                            .babyProgressModel!
                                                                            .title!
                                                                        : '',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    maxLines: 5,
                                                                  )),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Container(
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            width: 200,
                                                            child: Text(
                                                              state.babyProgressModel !=
                                                                      null
                                                                  ? state
                                                                      .babyProgressModel!
                                                                      .condition!
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
                                                              maxLines: 3,
                                                            )),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 20),
                                                            child: Text(
                                                              state.weeks !=
                                                                      null
                                                                  ? "${state.weeks} Minggu ${state.days} Hari"
                                                                  : '',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                                color: Colors
                                                                    .white),
                                                            child: Container(
                                                              width: 210,
                                                              height: 30,
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      const Text(
                                                                    "Ubah Profil Kehamilan ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: EpregnancyColors
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
                                      )
                                    : Container(),
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
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            RouteName.dashboardArticle);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  "Artikel lainnya",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.grey),
                                                )),
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
                                              FormzStatus
                                                  .submissionInProgress &&
                                          state.tipe == 'listArticle'
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
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                                  InkWell(
                                    onTap: () async {
                                      dateTime = await DatePickerUtils.getDate(
                                              context,
                                              state.eventDate ??
                                                  DateTime.now()) ??
                                          DateTime.now();
                                      Injector.resolve<HomePageBloc>().add(
                                          EventFetchEvent(
                                              _tabController!.index == 0
                                                  ? StringConstant.typePublic
                                                  : StringConstant.typePersonal,
                                              dateTime));
                                    },
                                    child: Container(
                                        child: Icon(
                                            Icons.calendar_today_outlined)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      var date = state.eventDate?.add(Duration(days: -1));
                                      Injector.resolve<HomePageBloc>().add(
                                          EventFetchEvent(
                                              _tabController!.index == 0
                                                  ? StringConstant.typePublic
                                                  : StringConstant.typePersonal,
                                              date?? DateTime.now()));
                                    },
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        child: Icon(Icons.arrow_back_ios)),
                                  ),
                                  Container(
                                      child: Text(
                                    state.eventDateString ?? "",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                                  InkWell(
                                    onTap: () async {
                                      var date = state.eventDate?.add(Duration(days: 1));
                                      Injector.resolve<HomePageBloc>().add(
                                          EventFetchEvent(
                                              _tabController!.index == 0
                                                  ? StringConstant.typePublic
                                                  : StringConstant.typePersonal,
                                              date?? DateTime.now()));
                                    },
                                    child: Container(
                                      height: 20,
                                        width: 20,
                                        child: Icon(Icons.arrow_forward_ios)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height-200,
                                child: TabBarEventPage(
                                  tabController: _tabController,
                                  dateTime: state.eventDate,
                                )),
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
