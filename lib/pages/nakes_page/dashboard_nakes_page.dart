import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/pages/members_page/members_page.dart';
import 'package:PregnancyApp/pages/nakes_page/full_qr_screen.dart';
import 'package:PregnancyApp/pages/nakes_visit_page/member_visit_page.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/consultation_container.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/visit_card.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/model/hospital_model/hospital_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../article_page/list_shimmer_verticle.dart';
import '../chat_page/bloc/chat_bloc/chat_bloc.dart';
import '../home_page/list_article.dart';
import '../home_page/tab_bar_event_page.dart';
import 'bloc/chat_pending_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';

class DashBoardNakesPage extends StatefulWidget {
  const DashBoardNakesPage(
      {Key? key, required this.userName, this.hospitalId, this.imageUrl})
      : super(key: key);
  final String? userName;
  final String? imageUrl;
  final String? hospitalId;

  @override
  State<DashBoardNakesPage> createState() => _DashBoardNakesPageState();
}

class _DashBoardNakesPageState extends State<DashBoardNakesPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    print('hosptalId : ${widget.hospitalId}');
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent(isMidwife: true));
    Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0));
    Injector.resolve<ChatPendingBloc>()
        .add(FetchLastChatEvent(widget.hospitalId));
    Injector.resolve<ChatPendingBloc>()
        .add(FetchChatPendingByHospitalId(widget.hospitalId));
    Injector.resolve<HomePageBloc>().add(ArticleHomeFetchEvent());
    Injector.resolve<ChatBloc>().add(FetchChatOngoingEvent());
    Injector.resolve<HospitalBloc>()
        .add(FetchHospitalsByIdEvent(widget.hospitalId));
    Injector.resolve<HospitalBloc>().add(FetchMemberSummaryEvent());
    Injector.resolve<HomePageBloc>().add(HomeEventDateChanged(DateTime.now()));
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    getHospital();
  }

  HospitalModel? hospitalModel;

  void getHospital() async {
    HospitalModel _hospitalModel = await AppSharedPreference.getHospital();
    if (_hospitalModel != null && mounted) {
      setState(() {
        hospitalModel = _hospitalModel;
      });
    }
  }

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    // Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
    Injector.resolve<HomePageBloc>().add(ArticleHomeFetchEvent());
    Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0));
    Injector.resolve<ChatBloc>().add(FetchChatOngoingEvent());
    Injector.resolve<ChatPendingBloc>()
        .add(FetchChatPendingByHospitalId(widget.hospitalId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteName.profileNakesPage,
                  arguments: {
                    "name": widget.userName,
                    "image_url": widget.imageUrl
                  });
            },
            child: Text(
              'Halo, ${widget.userName} ',
              style: TextStyle(
                  color: EpregnancyColors.primer,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),
            )),
        actions: [
          BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.w),
                              topLeft: Radius.circular(8.w)),
                        ),
                        context: context,
                        builder: (BuildContext bc) {
                          return WillPopScope(
                            onWillPop:() => Future.value(false),
                            child: Container(
                              padding: EdgeInsets.all(16.w),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         InkWell( onTap: (){
                                           Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0));
                                           Future.delayed(const Duration(milliseconds: 100));
                                           Navigator.pop(context);
                                         },
                                           child: Icon(
                                              Icons.close,
                                              color: EpregnancyColors.primer,
                                            ),
                                         ),
                                          Expanded(
                                            child: Text(
                                                "Kode QR Bidan ${widget.userName}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.center),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icShare.svg",
                                            color: EpregnancyColors.primer,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16.h),
                                        child: Text(
                                          "Tanggal Kunjungan",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.h, bottom: 24.h),
                                        child: Text(
                                          DateFormatter.dateFormatWithSpace
                                              .format(DateTime.now()),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      QrImage(
                                        data: state.user?.qrString ?? '',
                                        version: QrVersions.auto,
                                        size: 150.w,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: SvgPicture.asset("assets/ic_qr.svg"));
            },
          ),
          IconButton(
            onPressed: () {
              // todo notif clicked handle
            },
            icon: const Icon(
              Icons.notifications,
              color: EpregnancyColors.primer,
              size: 30,
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        return LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          showChildOpacityTransition: false,
          child: ListView(
            shrinkWrap: true,
            children: [
              // DASHBOARD HEADER
              // total pasien box
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    EpregnancyColors.whiteBlue,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: EpregnancyColors.primerSoft),
                              height: 40.h,
                              width: 40.w,
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/ic_community.svg")),
                            ),
                            Expanded(
                              child: InkWell(onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MembersPage(
                                              puskesmasName:
                                                  hospitalModel?.name ?? "-",
                                            )));
                              }, child:
                                  BlocBuilder<HospitalBloc, HospitalState>(
                                builder: (context, state) {
                                  return Container(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hospitalModel?.name ?? "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "${state.patientAmount ?? "-"} Anggota  •  ${state.midwifeAmount ?? "-"} Bidan ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MembersPage(
                                                puskesmasName:
                                                    hospitalModel?.name ?? "-",
                                              )));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: EpregnancyColors.grey,
                                ))
                          ],
                        )),

                    // kunjungan anggota widget
                    state.listUserVisitModel != null
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 355.h,
                            child: Stack(
                              children: [
                                Container(
                                  height: 75.h,
                                  padding: EdgeInsets.only(
                                      left: 16.w,
                                      top: 16.w,
                                      right: 16.w,
                                      bottom: 30.w),
                                  decoration: BoxDecoration(
                                      color: EpregnancyColors.primer,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.w),
                                          topRight: Radius.circular(8.w))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kunjungan Anggota",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            DateFormatter.dateFormatdMMyyyy
                                                .format(DateTime.now()),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${state.listUserVisitModel?.length} Kunjungan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  top: 60.h,
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(16.w),
                                              topLeft: Radius.circular(16.w),
                                              bottomRight: Radius.circular(8.w),
                                              bottomLeft: Radius.circular(8.w),
                                            )),
                                        child: state.listUserVisitModel!.isEmpty
                                            ? Container(
                                                margin: EdgeInsets.only(),
                                                child: Container())
                                            : Column(
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      itemBuilder: (context, index) {
                                                        String outputDate = "";
                                                        var outputFormat =
                                                            DateFormat.yMMMMd('id');
                                                        outputDate = outputFormat.format(
                                                            DateTime.parse(state
                                                                    .listUserVisitModel?[
                                                                        index]
                                                                    .createdDate ??
                                                                "0000-00-00"));
                                                        // 12/3
                                                        return InkWell(
                                                          onTap: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) => ArticleDetailPage(
                                                            //             article: listArticle?[index])));
                                                          },
                                                          child: Center(
                                                            child: VisitCard(
                                                              user:
                                                                  state.listUserVisitModel?[
                                                                      index],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      itemCount: 5,
                                                    ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) => const MemberVisitPage()));
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                              EpregnancyColors.greyDivider,
                                                              width: 1)),
                                                    ),
                                                    padding: EdgeInsets.all(16.w),
                                                    child: Center(
                                                        child: Text(
                                                          "Lihat Semua",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 12.sp,
                                                              color: EpregnancyColors.primer),
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                      ),
                                      _Loading()
                                    ],
                                  ),
                                ),
                              ],
                              overflow: Overflow.visible,
                            ),
                          )
                        : Container(),

                    // start tanya bidan box
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Container(
                        padding: EdgeInsets.only(top: 16.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                StringConstant.askMidwife,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: 16.h,
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<ChatPendingBloc,
                                          ChatPendingState>(
                                      builder: (context, state) {
                                    return ConsultationContainer(
                                      consultationEnum: ConsultationEnum.newest,
                                      value: state.chatPendingList?.length ?? 0,
                                      role: 'MIDWIFE',
                                    );
                                  }),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  BlocBuilder<ChatBloc, ChatState>(
                                      builder: (context, state) {
                                    print(
                                        'ongoing : ${state.listChatOngoing?.length}');
                                    return ConsultationContainer(
                                        consultationEnum:
                                            ConsultationEnum.onGoing,
                                        value:
                                            state.listChatOngoing?.length ?? 0,
                                        role: 'MIDWIFE');
                                  })
                                ],
                              ),
                            ),
                            // Container(
                            //   color: Colors.white,
                            //   height: 10.h,
                            // ),
                            // Container(
                            //   color: Colors.white,
                            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                            //   child: Text(
                            //     StringConstant.newestIncomingMessage,
                            //     style: TextStyle(
                            //         color: EpregnancyColors.blackBack,
                            //         fontSize: 12.sp,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),

                            // hardcoded ui

                            BlocBuilder<ChatPendingBloc, ChatPendingState>(
                                builder: (context, state) {
                              if (state.lastChatResponse == null) {
                                return Container(
                                  height: 100.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text("Belum Ada Chat Baru"),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RouteName.navBar,
                                        arguments: {
                                          'role': 'MIDWIFE',
                                          'initial_index': 0
                                        });
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: ChatPlaceHolderWidget(
                                      unread: false,
                                      name: state
                                          .lastChatResponse?.chat?.from?.name,
                                      message:
                                          state.lastChatResponse?.chat?.message,
                                      dateTime: state
                                          .lastChatResponse?.chat?.createdDate,
                                      unreadCount: state
                                          .lastChatResponse?.unreadMessage
                                          .toString(),
                                    ),
                                  ),
                                );
                              }
                            }),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                            //   child: ChatPlaceHolderWidget( unread: false,),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                            //   child: ChatPlaceHolderWidget(unread: true,),
                            // ),

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteName.navBar, arguments: {
                                    'role': 'MIDWIFE',
                                    'initial_index': 0,
                                    'user_id': state.user?.id ?? ''
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    StringConstant.seeAllConsulation,
                                    style: TextStyle(
                                        color: EpregnancyColors.primer,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w)),
                      height: 16.h,
                    )
                  ],
                ),
              ),
              // end tanya bidan box

              // kunjungan anggota

              // artikel section
              // Container(
              //     // height: 200,
              //     color: Colors.white,
              //     child: Container(
              //       padding: EdgeInsets.only(top: 10, bottom: 20),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             padding: EdgeInsets.only(
              //                 left: 20, right: 20, bottom: 5),
              //             child: Row(
              //               mainAxisAlignment:
              //                   MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Container(
              //                     child: const Text(
              //                   StringConstant.publishedArticle,
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w700),
              //                 )),
              //                 InkWell(
              //                   onTap: () {
              //                     Navigator.of(context).pushNamed(
              //                         RouteName.dashboardArticle);
              //                   },
              //                   child: Container(
              //                     child: Row(
              //                       children: [
              //                         Container(
              //                             margin: EdgeInsets.only(right: 5),
              //                             child: Text(
              //                               StringConstant.otherArticle,
              //                               style: TextStyle(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.w500,
              //                                   color: Colors.grey),
              //                             )),
              //                         Container(
              //                           child: const Icon(
              //                             Icons.arrow_forward_ios,
              //                             size: 20,
              //                             color: Colors.grey,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Row(
              //             children: [
              //               state.submitStatus ==
              //                           FormzStatus.submissionInProgress &&
              //                       state.tipe == 'listArticle'
              //                   ? Expanded(child: ListShimmer())
              //                   : Expanded(
              //                       child: ListArticle(
              //                       listArticle: state.listArticle ?? [],
              //                     ))
              //             ],
              //           ),
              //         ],
              //       ),
              //     )),

              // BlocBuilder<HospitalBloc, HospitalState>(
              //   builder: (context, state) {
              //     if(state.type == 'fetch-hospital-success'){
              //       return Container(
              //         // height: 200.h,
              //           margin: EdgeInsets.only(left: 16.w, top: 5.h, bottom: 20.h),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Text("QR Check-in Pasien", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),),
              //               SizedBox(height: 0.h,),
              //               // Center(
              //               //   child: Text(state.hospitals?[0].pin.toString() ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.sp),),
              //               // ),
              //               InkWell(
              //                 onTap: (){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  FullQrScreen(value: "KomunitAZ-${state.hospitals?[0].pin.toString()}",)));
              //                 },
              //                 child: Hero(
              //                   tag: 'qr-hero',
              //                   child: Center(
              //                     child: QrImage(
              //                       data: "KomunitAZ-${state.hospitals?[0].pin.toString()}",
              //                       version: QrVersions.auto,
              //                       size: 150.w,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               // SizedBox(height: 20.h,),
              //               Center(
              //                 child: CountdownTimer(
              //                   endTime: DateTime.parse(state.hospitals?[0].pinValidEnd ?? DateTime.now().toString()).millisecondsSinceEpoch,
              //                   widgetBuilder: (context, time){
              //                     return Text("Akan Expired Pada ${time?.min.toString().padLeft(2, "0")} : ${time?.sec.toString().padLeft(2, "0")}",
              //                       style: TextStyle(fontWeight: FontWeight.bold),);
              //                   },
              //                   // todo data valid start & end ngaco di response
              //                   onEnd: (){
              //                     Injector.resolve<HospitalBloc>().add(FetchHospitalsByIdEvent(widget.hospitalId));
              //                   },
              //                 ),
              //               )
              //             ],
              //           )
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // ),

              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height - 200,
                          child: TabBarEventPage(
                            tabController: _tabController,
                            dateTime: state.eventDate,
                            isMidwife: true,
                          )),
                    ],
                  )),

              SizedBox(
                height: 50.h,
              )
            ],
          ),
        );
      }),
      floatingActionButton: Align(
        alignment: Alignment(0.9, 1),
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          child: RaisedButton(
            color: EpregnancyColors.primer,
            child: Padding(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 40.sp),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "Tambah Jadwal",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                )),
            elevation: 8,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onPressed: () async {
              Navigator.of(context)
                  .pushNamed(RouteName.chooseTypeEvent, arguments: 'MIDWIFE')
                  .then((value) {
                Injector.resolve<HomePageBloc>().add(EventFetchEvent(
                    _tabController!.index == 0
                        ? StringConstant.typePersonal
                        : StringConstant.typePublic,
                    DateTime.now(),
                    isMidwife: true));
              });
            },
          ),
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.tipe == "fetching-list-user-visit") {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
