import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/pages/home_page/baby_section_widget.dart';
import 'package:PregnancyApp/pages/home_page/game_card_section.dart';
import 'package:PregnancyApp/pages/home_page/poin_card_section.dart';
import 'package:PregnancyApp/pages/home_page/qr_scanner.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_event_page.dart';
import 'package:PregnancyApp/pages/home_page/widget/check_in_widget.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_placeholder.dart';
import 'package:PregnancyApp/utils/date_picker.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:countly_flutter/countly_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:toast/toast.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../common/widget/primary_btn.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../env.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/firebase_analytics.dart';
import '../article_page/article_detail_page.dart';
import '../article_page/bloc/article_bloc.dart';
import '../login_page/login_page.dart';
import '../pin_checkin/pin_checkin_page.dart';
import 'bloc/home_page_bloc.dart';
import 'list_article.dart';
import 'list_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      this.userId,
      this.one,
      this.two,
      this.three,
      this.isFromNotif = false})
      : super(key: key);
  final String? userId;
  final GlobalKey? one;
  final GlobalKey? two;
  final GlobalKey? three;
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
  bool showEditBaby = false;
  final tooltipController = JustTheController();
  final PublishSubject<bool> _psTriggerTooltip = PublishSubject();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    if (F.appFlavor == Flavor.DEVELOPMENT) {
      // subscribeFcmTopic();
    }
    start();
    super.initState();
  }

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

  void subscribeFcmTopic() async {
    FirebaseMessaging.instance.subscribeToTopic("topics/all");
  }

  @override
  void initState() {
    if (F.appFlavor == Flavor.DEVELOPMENT) {
      // subscribeFcmTopic();
    }
    start();
    super.initState();
  }

  _scrollToBottom() {
    _scrollControler.jumpTo(_scrollControler.position.maxScrollExtent);
  }

  void start() {
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
    Injector.resolve<HomePageBloc>().add(FetchSimpleTipEvent());
    Injector.resolve<HomePageBloc>().add(ArticleHomeFetchEvent());
    Injector.resolve<HomePageBloc>().add(const PointFetchEvent());
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

    Future.delayed(const Duration(milliseconds: 3000), () {
      tooltipController.showTooltip(immediately: true);
      if (_psTriggerTooltip != null) {
        _psTriggerTooltip.sink.add(true);
      }
    });
  }

  @override
  void dispose() {
    // Injector.resolve<HomePageBloc>().add(HomeInitEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return InkWell(
      child: Scaffold(
        backgroundColor: EpregnancyColors.white,
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: ClipRRect(
            key: ValueKey<bool>(isExpanded),
            borderRadius: BorderRadius.circular(isExpanded ? 10.w : 10.w),
            child: FloatingActionButton.extended(
              backgroundColor: EpregnancyColors.primer,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.chooseTypeEvent);
              },
              icon: isExpanded ? FaIcon(FontAwesomeIcons.plus) : null,
              label: isExpanded
                  ? const Text("Tambah Jadwal")
                  : const FaIcon(FontAwesomeIcons.plus),
              shape: RoundedRectangleBorder(),
            ),
          ),
        ),
        body: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state.submitStatus == FormzStatus.submissionSuccess) {
              if (state.user?.babies?.length != 0 &&
                  state.tipe == "get-info-done") {
                if (state.user?.babies?.first.name == "" ||
                    state.user?.babies?.first.name == null) {
                  setState(() {
                    showEditBaby = true;
                  });
                }
              }
            } else if (state.submitStatus == FormzStatus.submissionFailure &&
                state.isNotHaveSession == true) {
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
                color: EpregnancyColors.white,
                child: LiquidPullToRefresh(
                  color: EpregnancyColors.primer,
                  key: _refreshIndicatorKey,
                  onRefresh: _handleRefresh,
                  showChildOpacityTransition: false,
                  child: ListView(
                    controller: _scrollControler,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: EpregnancyColors.white,
                        margin: EdgeInsets.only(bottom: 12, top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: state.baby != null &&
                                      state.baby?.baby?.name != ''
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        left: 16.w,
                                        right: 50,
                                      ),
                                      child: Text(
                                          "Halo, ${state.baby?.baby?.name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: EpregnancyColors.primer),
                                          textAlign: TextAlign.start),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        print("Beri nama bayi");
                                        Navigator.of(context).pushNamed(
                                            RouteName.surveyPageBaby,
                                            arguments: {
                                              "is_edit": true,
                                              "edit_name": true
                                            });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 16.w, right: 60.w),
                                        padding: EdgeInsets.only(left: 16.w),
                                        decoration: BoxDecoration(
                                          color: EpregnancyColors.primer,
                                          border: Border.all(
                                            color: EpregnancyColors.primer,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                child: const Text(
                                              'Beri nama bayi',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: EpregnancyColors.white,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 3,
                                            )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 16,
                                                  color: EpregnancyColors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                            // app bar action section
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              // alignment: Alignment.centerRight,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 0.w, right: 10.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (_hospitalModel?.name == '') {
                                              Navigator.pushNamed(context,
                                                      RouteName.locationSelect)
                                                  .then((value) {
                                                if (value != null) {
                                                  setState(() {
                                                    _hospitalModel =
                                                        value as HospitalModel?;
                                                  });
                                                }
                                              });
                                            } else {
                                              // todo implement barcode scanner
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const QrScanner()))
                                                  .then((value) {
                                                // todo handel pin checkin from barcode
                                                print("scan result : $value");
                                              });
                                              // showModalBottomSheet(
                                              //     context: context,
                                              //     isScrollControlled: false,
                                              //     builder: (context) {
                                              //       return PinCheckInPage();
                                              //     });
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Icon(
                                              Icons.qr_code,
                                              color: EpregnancyColors.primer,
                                              size: 23.w,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Toast.show(
                                                "Fitur ini akan segera hadir");
                                            // Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                            //   if (value != null) {
                                            //     setState(() {
                                            //       _hospitalModel = value
                                            //           as HospitalModel?;
                                            //     });
                                            //   }
                                            // });
                                          },
                                          child: Container(
                                            child: Icon(
                                              Icons.notifications,
                                              color: EpregnancyColors.primer,
                                              size: 23.w,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              EpregnancyColors.whiteBlue,
                              Colors.white,
                              Colors.white
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.user?.isPregnant == true &&
                                        state.user?.babies?.length != 0
                                    ? BabySectionWidget(
                                        state: state,
                                        one: widget.one,
                                        tooltipController: tooltipController,
                                        psTriggerTooltip: _psTriggerTooltip)
                                    : Container(),
                              ],
                            ),
                            state.showGuide == true
                                ? Showcase(
                                    key: widget.two ?? GlobalKey(),
                                    title: 'Tips',
                                    description:
                                        'Dapatkan info dan tips kehamilan',
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 16.h),
                                      padding: EdgeInsets.all(16.w),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: EpregnancyColors.white),
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            )
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            // margin: EdgeInsets.only(left: 50, right: 50),
                                            child: SvgPicture.asset(
                                              'assets/ic_tips.svg',
                                              height: 20,
                                              width: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet pulvinar mi sit amet tincidunt. Sed maximus, orci sed euismod eleifend.  Sed maximus, orci sed euismod eleifend",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                        ],
                                      ),
                                    ))
                                : Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16.h),
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: EpregnancyColors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.w),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          )
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          // margin: EdgeInsets.only(left: 50, right: 50),
                                          child: SvgPicture.asset(
                                            'assets/ic_tips.svg',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        // todo simple tip
                                        Text(
                                          state.simpleTipResponse?.tips ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        BlocListener<ArticlePageBloc,
                                            ArticlePageState>(
                                          listener: (context, state) {
                                            if (state.articleModel != null &&
                                                state.submitStatus ==
                                                    FormzStatus
                                                        .submissionSuccess &&
                                                state.type ==
                                                    'success-read-tips') {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ArticleDetailPage(
                                                            article: state
                                                                .articleModel,
                                                          )));
                                            }
                                          },
                                          child: state.simpleTipResponse
                                                      ?.articleId !=
                                                  null
                                              ? Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Injector.resolve<
                                                              ArticlePageBloc>()
                                                          .add(ArticleReadEvent(
                                                              state.simpleTipResponse
                                                                      ?.articleId ??
                                                                  "",
                                                              isFromTips:
                                                                  true));
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "Baca Artikel",
                                                          style: TextStyle(
                                                              color:
                                                                  EpregnancyColors
                                                                      .primer,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color:
                                                              EpregnancyColors
                                                                  .primer,
                                                          size: 14.w,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                      ],
                                    ),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 8),
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
                                            listArticle:
                                                state.listArticle ?? [],
                                          ))
                                  ],
                                ),
                              ],
                            ),
                            state.showGuide == true
                                ? Showcase(
                                    key: widget.three ?? GlobalKey(),
                                    title: 'Kumpulkan Poin',
                                    description:
                                        'Raih kesempatan menukarkan Poin untuk hadiah menarik dengan check-in setiap harinya',
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteName.poinPage,
                                            arguments:
                                                state.totalPointsEarned ?? 0);
                                      },
                                      child: PoinCardSection(
                                          point: state.totalPointsEarned ?? 0),
                                    ))
                                : InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteName.poinPage,
                                          arguments:
                                              state.totalPointsEarned ?? 0);
                                    },
                                    child: PoinCardSection(
                                        point: state.totalPointsEarned ?? 0)),
                            // Games Section
                            const GameCardSection(),

                            Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                200,
                                        child: TabBarEventPage(
                                          tabController: _tabController,
                                          dateTime: state.eventDate,
                                          isMidwife: false,
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
