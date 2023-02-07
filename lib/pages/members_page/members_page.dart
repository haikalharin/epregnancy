import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/injector/injector.dart';

enum SortEnum { asc, desc }

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key, this.puskesmasName}) : super(key: key);
  final String? puskesmasName;

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _patientSearchTextController =
      TextEditingController();
  final TextEditingController _midwifeSearchTextController =
      TextEditingController();
  FocusNode keyboardFocusNode = FocusNode();

  TabController? _tabController;

  List<Widget> _tabs = <Widget>[
    Tab(
      text: "Anggota",
    ),
    Tab(
      text: "Bidan",
    ),
  ];
  final PublishSubject<bool> _streamFilter = PublishSubject();
  final PublishSubject<bool> _streamCondition = PublishSubject();
  bool filter1 = false;
  bool filter2 = false;
  bool filter3 = false;
  bool filter4 = false;
  bool filter5 = false;
  bool filter6 = false;
  bool condition1 = false;
  bool condition2 = false;

  @override
  void initState() {
    super.initState();
    _streamFilter.sink.add(false);
    _streamCondition.sink.add(false);
    _tabController = TabController(length: _tabs.length, vsync: this);

    Injector.resolve<HospitalBloc>().add(const FetchMembersEvent("", 0));
    Injector.resolve<HospitalBloc>().add(const FetchMidwifesEvent("", 0));
    _tabController?.addListener(() {
      // setState(() {
      //   _selectedIndex = _tabController.index;
      // });
      FocusScope.of(context).unfocus();
      _patientSearchTextController.clear();
      _midwifeSearchTextController.clear();
      // print("Selected Index: " + _tabController!.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BtnBackIosStyle(),
          title: Text(
            widget.puskesmasName ?? "",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: EpregnancyColors.primer,
            labelColor: EpregnancyColors.primer,
            unselectedLabelColor: EpregnancyColors.grey,
            controller: _tabController,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            // anggota tab
            Stack(
              children: [
                Container(
                  // padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(16.w),
                                height: 40.h,
                                child: TextFormField(
                                  controller: _patientSearchTextController,
                                  textInputAction: TextInputAction.search,
                                  onFieldSubmitted: (keyWord) {
                                    Injector.resolve<HospitalBloc>().add(
                                        FetchMembersEvent(
                                            _patientSearchTextController.text,
                                            0));
                                  },
                                  decoration: InputDecoration(
                                    prefixIconConstraints: BoxConstraints(
                                        maxHeight: 35, maxWidth: 35),
                                    prefixText: '',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, right: 8.w),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        maxWidth: 40, maxHeight: 21),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        _patientSearchTextController.clear();
                                        Injector.resolve<HospitalBloc>().add(
                                            const FetchMembersEvent("", 0));

                                        // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        top: 5.h, left: 20.w, right: 20.w),
                                    hintText: "Cari Nama...",
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: EpregnancyColors.primer,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: EpregnancyColors.borderGrey,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only( right: 8.w),
                                    child: Text(
                                      "Filter",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    width: 20,
                                    height: 20,
                                    child: Icon(Icons.filter_list_sharp),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Expanded(child: BlocBuilder<HospitalBloc, HospitalState>(
                        builder: (context, state) {
                          return ListView.builder(
                              itemCount: state.members?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: EpregnancyColors.borderGrey,
                                            width: 1.w),
                                        bottom: BorderSide(
                                            color: EpregnancyColors.borderGrey,
                                            width: 0.3.w)),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.w),
                                        child: Container(
                                            margin: EdgeInsets.only(right: 8.w),
                                            height: 40.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: state.members![index]
                                                        .imageUrl !=
                                                    null
                                                ? CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                            state
                                                                .members![index]
                                                                .imageUrl!,
                                                            scale: 1.0),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.w),
                                                    child: Image.asset(
                                                        'assets/dummies/dummy_avatar.png'),
                                                  )),
                                      ),
                                      // Container(
                                      //   height: 40.h, width: 40.w,
                                      //   margin: EdgeInsets.only(right: 8.w),
                                      //   decoration: BoxDecoration(
                                      //       shape: BoxShape.circle
                                      //   ),
                                      //   child: ClipRRect(
                                      //       borderRadius: BorderRadius.circular(50.h),
                                      //       child: Image.asset('assets/dummies/dummy_avatar.png')),
                                      // ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(state.members?[index].name ??
                                                ""),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icMom.svg'),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  'Kehamilan ${state.members?[index].pregnancyWeek.toString()} Minggu',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          state.members?[index].totalVisit ==
                                                  null
                                              ? const SizedBox.shrink()
                                              : Text(
                                                  "${state.members?[index].totalVisit}x Kunjungan",
                                                  style: TextStyle(
                                                      color: EpregnancyColors
                                                          .greyText,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          state.members?[index].lastVisit ==
                                                  null
                                              ? const SizedBox.shrink()
                                              : Text(
                                                  "Terakhir, ${DateFormatter.dateFormatChat.format(state.members![index].lastVisit!)}",
                                                  style: TextStyle(
                                                      color: EpregnancyColors
                                                          .greyText,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ))
                    ],
                  ),
                ),
                _Loading()
              ],
            ),
            // midwife tab
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: _midwifeSearchTextController,
                          textInputAction: TextInputAction.search,
                          focusNode: keyboardFocusNode,
                          onFieldSubmitted: (keyWord) {
                            // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(keyWord));
                            Injector.resolve<HospitalBloc>().add(
                                FetchMidwifesEvent(
                                    _midwifeSearchTextController.text, 0));
                          },
                          decoration: InputDecoration(
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 35, maxWidth: 35),
                            prefixText: '',
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(maxWidth: 40, maxHeight: 21),
                            suffixIcon: InkWell(
                              onTap: () {
                                _midwifeSearchTextController.clear();
                                // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(
                                top: 5.h, left: 20.w, right: 20.w),
                            hintText: "Cari Nama...",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: EpregnancyColors.primer,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: EpregnancyColors.borderGrey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<HospitalBloc, HospitalState>(
                        builder: (context, state) {
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: state.midwifes?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.all(16.w),
                                      decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color:
                                                    EpregnancyColors.borderGrey,
                                                width: 1.w),
                                            bottom: BorderSide(
                                                color:
                                                    EpregnancyColors.borderGrey,
                                                width:
                                                    index == 3 ? 0.3.w : 1.w)),
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 8.w),
                                                height: 40.h,
                                                width: 40.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: state.midwifes![index]
                                                            .imageUrl !=
                                                        null
                                                    ? CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                state
                                                                    .midwifes![
                                                                        index]
                                                                    .imageUrl!,
                                                                scale: 1.0),
                                                      )
                                                    : Image.asset(
                                                        'assets/dummies/dummy_avatar.png')),
                                          ),
                                          Center(
                                            child: Text(
                                                "${state.midwifes?[index].name}"),
                                          )
                                        ],
                                      ),
                                    );
                                  }));
                        },
                      )
                    ],
                  ),
                ),
                _Loading()
              ],
            ),
          ],
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
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 64.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 16.w, right: 8.w, top: 16.h),
                                    child: Text(
                                      "Filter",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 16.w, right: 16.w, top: 16.h),
                            child: InkWell(
                              onTap: () {
                                _streamFilter.sink.add(true);
                                _streamCondition.sink.add(true);
                                setState(() {
                                  filter1 = false;
                                  filter2 = false;
                                  filter3 = false;
                                  filter4 = false;
                                  filter5 = false;
                                  filter6 = false;
                                  condition1 =false;
                                  condition2 =false;
                                });
                              },
                              child: Text(
                                "Atur Ulang",
                                style: TextStyle(
                                    color: EpregnancyColors.primer,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 8.w, top: 16.h),
                    child: Text(
                      "Urutkan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.w, right: 8.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            setState(() {
                              if (filter1) {
                                filter1 = false;
                              } else {
                                filter1 = true;
                                filter2 = false;
                                filter3 = false;
                                filter4 = false;
                                filter5 = false;
                                filter6 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  decoration: filter1
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Nama Z-A",
                                      style: filter1
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            setState(() {
                              if (filter2) {
                                filter2 = false;
                              } else {
                                filter2 = true;
                                filter1 = false;
                                filter3 = false;
                                filter4 = false;
                                filter5 = false;
                                filter6 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: EdgeInsets.only(left: 8.w),
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  decoration: filter2
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Usia Kandungan Termuda",
                                      textAlign: TextAlign.center,
                                      style: filter2
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.w, right: 8.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            setState(() {
                              if (filter3) {
                                filter3 = false;
                              } else {
                                filter3 = true;
                                filter1 = false;
                                filter2 = false;
                                filter4 = false;
                                filter5 = false;
                                filter6 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  decoration: filter3
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Usia Kandungan Tertua",
                                      textAlign: TextAlign.center,
                                      style: filter3
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.w, right: 8.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            setState(() {
                              if (filter4) {
                                filter4 = false;
                              } else {
                                filter4 = true;
                                filter1 = false;
                                filter2 = false;
                                filter3 = false;
                                filter5 = false;
                                filter6 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 8.h,
                                      left: 16.w,
                                      right: 16.w),
                                  decoration: filter4
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Kunjungan Terbanyak",
                                      style: filter4
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            setState(() {
                              if (filter5) {
                                filter5 = false;
                              } else {
                                filter5 = true;
                                filter1 = false;
                                filter2 = false;
                                filter3 = false;
                                filter4 = false;
                                filter6 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: EdgeInsets.only(left: 8.w),
                                  padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 8.h,
                                      left: 16.w,
                                      right: 16.w),
                                  decoration: filter5
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Kunjungan Tersedikit",
                                      textAlign: TextAlign.center,
                                      style: filter5
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _streamFilter.sink.add(true);
                            if (filter6) {
                              filter6 = false;
                            } else {
                              filter6 = true;
                              filter1 = false;
                              filter2 = false;
                              filter3 = false;
                              filter4 = false;
                              filter5 = false;
                            }
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamFilter.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 8.h,
                                      bottom: 8.h,
                                      left: 16.w,
                                      right: 16.w),
                                  decoration: filter6
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Anggota Terbaru",
                                      textAlign: TextAlign.center,
                                      style: filter6
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 8.w, top: 16.h),
                    child: Text(
                      "Pilih Status",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16.w, right: 8.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _streamCondition.sink.add(true);
                            setState(() {
                              if (condition1) {
                                condition1 = false;
                              } else {
                                condition1 = true;
                                condition2 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamCondition.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  decoration: condition1
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Sedang Hamil",
                                      style: condition1
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            _streamCondition.sink.add(true);
                            setState(() {
                              if (condition2) {
                                condition2 = false;
                              } else {
                                condition2 = true;
                                condition1 = false;
                              }
                            });
                          },
                          child: StreamBuilder<bool>(
                              stream: _streamCondition.stream,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: EdgeInsets.only(left: 8.w),
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  decoration: condition2
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: EpregnancyColors.primer)
                                      : BoxDecoration(
                                          color: EpregnancyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  EpregnancyColors.primerSoft)),
                                  child: Center(
                                    child: Text(
                                      "Tidak Hamil",
                                      textAlign: TextAlign.center,
                                      style: condition2
                                          ? TextStyle(
                                              color: EpregnancyColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp)
                                          : TextStyle(
                                              color: EpregnancyColors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.sp),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment(0, 1),
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width - 40,
                            height: 50,
                            child: RaisedButton(
                              color: EpregnancyColors.primer,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "Terapkan",
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
                                bool isPregnant = true;
                                if (condition2) {
                                  isPregnant = false;
                                }
                                if (filter1 ||
                                    filter2 ||
                                    filter3 ||
                                    filter4 ||
                                    filter5 ||
                                    filter6) {
                                  var sortBy = "name";
                                  var sort = SortEnum.asc;
                                  if (filter1) {
                                    sort = SortEnum.desc;
                                  } else if (filter2) {
                                    sortBy = "pregnancy_week";
                                    sort = SortEnum.asc;
                                  } else if (filter3) {
                                    sortBy = "pregnancy_week";
                                    sort = SortEnum.desc;
                                  } else if (filter4) {
                                    sortBy = "total_visit";
                                    sort = SortEnum.desc;
                                  } else if (filter5) {
                                    sortBy = "total_visit";
                                    sort = SortEnum.asc;
                                  } else if (filter6) {
                                    sortBy = "created_date";
                                    sort = SortEnum.asc;
                                  }
                                  Injector.resolve<HospitalBloc>().add(
                                      FetchMembersEvent("", 0,
                                          sortBy: sortBy,
                                          isPregnant: isPregnant,
                                          sort: sort));
                                } else {
                                  Injector.resolve<HospitalBloc>()
                                      .add(const FetchMembersEvent("", 0));
                                }
                                Navigator.pop(context);
                                keyboardFocusNode.unfocus();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
    return BlocBuilder<HospitalBloc, HospitalState>(builder: (context, state) {
      if (state.status == FormzStatus.submissionInProgress) {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(
                child: CircularProgressIndicator(
              color: EpregnancyColors.primer,
            )));
      } else {
        return Text("");
      }
    });
  }
}
