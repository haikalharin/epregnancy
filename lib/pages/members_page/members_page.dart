import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/injector/injector.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key, this.puskesmasName}) : super(key: key);
  final String? puskesmasName;

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> with SingleTickerProviderStateMixin{
  final TextEditingController _patientSearchTextController = TextEditingController();
  final TextEditingController _midwifeSearchTextController = TextEditingController();

  TabController? _tabController;

  List<Widget> _tabs = <Widget>[
    Tab(
      text: "Anggota",
    ),
    Tab(
      text: "Bidan",
    ),
  ];


  @override
  void initState() {
    super.initState();
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
          bottom:  TabBar(
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
            Container(
              // padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16.w),
                    height: 40.h,
                    child: TextFormField(
                      controller: _patientSearchTextController,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (keyWord) {
                        Injector.resolve<HospitalBloc>().add(FetchMembersEvent(_patientSearchTextController.text, 0));
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
                            _patientSearchTextController.clear();
                            Injector.resolve<HospitalBloc>().add(const FetchMembersEvent("", 0));

                            // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
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
                  SizedBox(height: 1.h,),
                  Expanded(
                      child: BlocBuilder<HospitalBloc, HospitalState>(
                        builder: (context, state){
                          return ListView.builder(
                              itemCount: state.members?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: EpregnancyColors.borderGrey, width: 1.w), bottom: BorderSide(color: EpregnancyColors.borderGrey, width: 0.3.w)),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50.w),
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
                                              backgroundImage: NetworkImage(
                                                  state.members![index]
                                                      .imageUrl!,
                                                  scale: 1.0),
                                            )
                                                : ClipRRect(
                                                  borderRadius: BorderRadius.circular(50.w),
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(state.members?[index].name ?? ""),
                                            SizedBox(height: 5.h,),
                                            Row(children: [
                                              SvgPicture.asset('assets/icMom.svg'),
                                              SizedBox(width: 5.w,),
                                              Text('Kehamilan ${state.members?[index].pregnancyWeek.toString()} Minggu', style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w500),)
                                            ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          state.members?[index].totalVisit == null ? const SizedBox.shrink() :Text("${state.members?[index].totalVisit}x Kunjungan" , style: TextStyle(color: EpregnancyColors.greyText, fontSize: 8.sp, fontWeight: FontWeight.w500),),
                                          SizedBox(height: 5.h,),
                                          state.members?[index].lastVisit == null ? const SizedBox.shrink() :Text("Terakhir, ${DateFormatter.dateFormatChat.format(state.members![index].lastVisit!)}" , style: TextStyle(color: EpregnancyColors.greyText, fontSize: 8.sp, fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      )
                  )
                ],
              ),
            ),
            // midwife tab
            Container(
              margin: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                    child: TextFormField(
                      controller: _midwifeSearchTextController,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (keyWord) {
                        // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(keyWord));
                        Injector.resolve<HospitalBloc>().add(FetchMidwifesEvent(_midwifeSearchTextController.text, 0));
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
                                color: Colors.black, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        contentPadding:
                        EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
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
                  SizedBox(height: 10.h,),
                  BlocBuilder<HospitalBloc, HospitalState>(
                    builder: (context, state){
                      return Expanded(
                          child: ListView.builder(
                              itemCount: state.midwifes?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: EpregnancyColors.borderGrey, width: 1.w), bottom: BorderSide(color: EpregnancyColors.borderGrey, width: index == 3 ? 0.3.w : 1.w)),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            margin: EdgeInsets.only(right: 8.w),
                                            height: 40.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: state.midwifes![index]
                                                .imageUrl !=
                                                null
                                                ? CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  state.midwifes![index]
                                                      .imageUrl!,
                                                  scale: 1.0),
                                            )
                                                : Image.asset(
                                                'assets/dummies/dummy_avatar.png')),
                                      ),
                                      Center(
                                        child: Text("${state.midwifes?[index].name}"),
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
          ],
        ),
      ),
    );
  }
}
