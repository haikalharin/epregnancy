import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/home_page/list_event.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
// import 'package:sizer/sizer.dart';

import '../../common/injector/injector.dart';
import '../../data/model/person_model/person_model.dart';
import '../../utils/date_picker.dart';
import '../../utils/epragnancy_color.dart';
import 'acara_umum_page.dart';
import 'list_event_personal.dart';
import 'package:intl/date_symbol_data_local.dart';

class TabBarEventPage extends StatefulWidget {
  // static List<ContentPointHistory> listHistory;

  static bool? isEndOfPage;
  static bool? reloadExpiry;
  final String? type;
  TabController? tabController;
  final DateTime? dateTime;
  final bool isMidwife;

  TabBarEventPage({Key? key, this.type, this.tabController, this.dateTime, this.isMidwife = false})
      : super(key: key);

  @override
  _TabBarEventPageState createState() => _TabBarEventPageState();
}

class _TabBarEventPageState extends State<TabBarEventPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = widget.tabController;
    // initializeDateFormatting();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
void event(String date){
  Future.delayed(const Duration(milliseconds: 1000), () {
    Injector.resolve<HomePageBloc>()
        .add(const HomeFetchDataEvent(isMidwife: true));
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 16.w),
                child:  Text(
                  "Kalendar",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                )),
            Container(
                // constraints: BoxConstraints.expand(height: 75),
                // height: 59.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: EpregnancyColors.grey, width: 0.3.h))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        // height: 20.h,
                        margin: EdgeInsets.only(right: 10.h),
                        width: 200.w,
                        child: TabBar(
                          controller: _tabController,
                          physics: NeverScrollableScrollPhysics(),
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                          labelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          unselectedLabelColor: EpregnancyColors.greyDark,
                          labelColor: EpregnancyColors.primer,
                          labelPadding: EdgeInsets.only(top: 0, bottom: 0),
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 3.0, color: EpregnancyColors.primer),
                            insets: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0),
                          ),
                          tabs: const [
                            Tab(text: "Jadwal Pribadi"),
                            Tab(
                              text: "Jadwal Umum",
                            ),

                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            var dateTime = DateTime.now();
                            dateTime = await DatePickerUtils.getDate(context,
                                    state.eventDate ?? DateTime.now()) ??
                                DateTime.now();

                              Injector.resolve<HomePageBloc>().add(
                                  EventFetchEvent(
                                      _tabController!.index == 0
                                          ? StringConstant.typePersonal
                                          :StringConstant.typePublic ,
                                      dateTime, isMidwife: widget.isMidwife));

                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 16.w, bottom: 5.h),
                              child: Row(
                                children: [
                                  Text(DateFormatter.monthOnly.format(state.eventDate ?? DateTime.now()),
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 10.w,),
                                  Icon(Icons.calendar_today_outlined)
                                ],
                              )),
                        );
                      },
                    )
                  ],
                )),
            // page viewer date
            BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 20, right: 20, bottom: 15.h, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          var date = state.eventDate?.add(Duration(days: -1));

                          Injector.resolve<HomePageBloc>().add(EventFetchEvent(
                              _tabController!.index == 0
                                  ? StringConstant.typePersonal
                                  : StringConstant.typePublic,
                              date ?? DateTime.now(), isMidwife: widget.isMidwife));
                        },

                        child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(Icons.arrow_back_ios)),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            state.eventDateString ?? "",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                      InkWell(
                        onTap: () async {
                          var date = state.eventDate?.add(Duration(days: 1));
                          Injector.resolve<HomePageBloc>().add(EventFetchEvent(
                              _tabController!.index == 0
                                  ? StringConstant.typePersonal
                                  : StringConstant.typePublic,
                              date ?? DateTime.now(), isMidwife: widget.isMidwife));
                        },
                        child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(Icons.arrow_forward_ios)),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Column(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 9.5,
                  //   color:Colors.grey.shade200,
                  // ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: TabBarView(
                          controller: _tabController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ListEventPersonalWidget(
                              tipeAcara: StringConstant.typeEventJadwalPribadi,
                              dateTime: widget.dateTime,
                              isMidwife: widget.isMidwife,
                            ),
                            ListEventWidget(
                              tipeAcara: StringConstant.typeEventJadwalUmum,
                              dateTime: widget.dateTime,
                            ),

                            // AcaraUmumPage(),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
