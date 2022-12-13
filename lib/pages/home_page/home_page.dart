import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/home_page/baby_section_widget.dart';
import 'package:PregnancyApp/pages/home_page/game_card_section.dart';
import 'package:PregnancyApp/pages/home_page/poin_card_section.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_event_page.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_placeholder.dart';
import 'package:PregnancyApp/utils/date_picker.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../env.dart';
import '../../utils/epragnancy_color.dart';
import '../login_page/login_page.dart';
import 'bloc/home_page_bloc.dart';
import 'list_article.dart';
import 'list_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, this.userId, this.one, this.two, this.isFromNotif = false})
      : super(key: key);
  final String? userId;
  final GlobalKey? one;
  final GlobalKey? two;
  final bool? isFromNotif;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  UserModelFirebase user = UserModelFirebase.empty();
  DateTime dateTime = DateTime.now();
  String dateTimeString = "";
  TabController? _tabController;
  HospitalModel? _hospitalModel;
  bool? _isFromNotif = false;

  void getHospitalFromLocal() async {
    HospitalModel _hospital = await AppSharedPreference.getHospital();
    if (_hospital != null && mounted) {
      setState(() {
        _hospitalModel = _hospital;
      });
    }
  }

  bool isExpanded = false;
  final ScrollController _scrollControler = ScrollController();

  @override
  void initState() {
    start();
    super.initState();
  }

  void start() {
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
    Injector.resolve<HomePageBloc>().add(ArticleFetchEvent());
    Injector.resolve<HomePageBloc>().add(PointFetchEvent());
    Injector.resolve<HomePageBloc>().add(HomeEventDateChanged(DateTime.now()));
    _tabController = TabController(length: 2, vsync: this);
    getHospitalFromLocal();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _scrollControler.addListener(() {
        print('scrolling');
      });
      _scrollControler.position.isScrollingNotifier.addListener(() {
        if (_scrollControler.position.pixels ==
            _scrollControler.position.maxScrollExtent) {
          setState(() {
            isExpanded = true;
          });
        } else {
          setState(() {
            isExpanded = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    // Injector.resolve<HomePageBloc>().add(HomeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.chooseTypeEvent);
          },
          icon: isExpanded ? FaIcon(FontAwesomeIcons.plus) : null,
          label: isExpanded
              ? Text("Tambah Jadwal")
              : FaIcon(FontAwesomeIcons.plus),
        ),
        body: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state.submitStatus == FormzStatus.submissionSuccess) {
            } else if (state.submitStatus == FormzStatus.submissionFailure && state.isNotHaveSession == true) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage(
                            tokenExpired: true,
                          )),
                  (route) => false);
            }
          },
          child: BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              String? name = state.user != null ? state.user!.name : "";

              return Container(
                child: ListView(
                  controller: _scrollControler,
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 0, top: 20),
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 16.w,
                                                right: 50,
                                                bottom: 20),
                                            child: Text("Halo, $name",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: EpregnancyColors
                                                        .primer),
                                                textAlign: TextAlign.start),
                                          ),
                                        ),
                                        _hospitalModel?.name != ""
                                            ? Expanded(
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  // alignment: Alignment.centerRight,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // todo puskesmas select
                                                        if (_hospitalModel?.name == "") {
                                                          Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                                            if (value != null) {
                                                              setState(() {
                                                                _hospitalModel = value as HospitalModel?;
                                                              });
                                                            }
                                                          });
                                                        }
                                                      },
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 0.w,
                                                                  right: 10.w,
                                                                  bottom: 20),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              SvgPicture.asset(
                                                                  'assets/icLocation.svg'),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  _hospitalModel
                                                                          ?.name ??
                                                                      'Pilih Puskesmas',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  // textAlign: TextAlign.right,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                // alignment: Alignment.centerRight,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                              context,
                                                              RouteName
                                                                  .locationSelect)
                                                          .then((value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            _hospitalModel = value
                                                                as HospitalModel?;
                                                          });
                                                        }
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0.w,
                                                            right: 10.w,
                                                            bottom: 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/icLocation.svg'),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'Pilih Puskesmas',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                // textAlign: TextAlign.right,
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  state.user?.isPregnant == true &&
                                          state.user?.babies?.length != 0
                                      ? BabySectionWidget(
                                          state: state, one: widget.one)
                                      : Container(),
                                ],
                              ),
                            ])),
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
                                  state.submitStatus ==
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
                    state.showGuide == true
                        ? Showcase(
                            key: widget.two ?? GlobalKey(),
                            title: 'Kumpulkan Poin',
                            description:
                                'Raih kesempatan menukarkan Poin untuk hadiah menarik dengan check-in setiap harinya',
                            child: PoinCardSection(
                                point: state.totalPointsEarned ?? 0))
                        : PoinCardSection(point: state.totalPointsEarned ?? 0),
                    // Games Section
                    const GameCardSection(),

                    Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height - 200,
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
