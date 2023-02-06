import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import '../home_page/bloc/home_page_bloc.dart';
import 'bloc/event_page_bloc.dart';

class ChooseTypeEventPage extends StatefulWidget {
  final String? role;

  const ChooseTypeEventPage({Key? key, this.role}) : super(key: key);

  @override
  State<ChooseTypeEventPage> createState() => _ChooseTypeEventPageState();
}

class _ChooseTypeEventPageState extends State<ChooseTypeEventPage> {
  bool isPage1 = true;
  bool isPage2 = false;
  int isChoice = 0;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  bool _value = false;
  String condition = "";
  int val = -1;
  int val2 = -1;

  @override
  void dispose() {
    Injector.resolve<HomePageBloc>().add(HomeEventDateChanged(DateTime.now()));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: SvgPicture.asset(
                            'assets/bg_calendar.svg',
                            fit: BoxFit.fitHeight,
                            height: 150,
                            width: MediaQuery.of(context).size.width - 1000,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 10),
                        color: Colors.white,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Text(
                                  widget.role == "MIDWIFE"
                                      ? "Buat Jadwal Baru"
                                      : "Buat Jadwal Baru",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 10.h),
                                child: const Text(
                                  "Pilih Kategori Jadwal",
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widget.role == "MIDWIFE" ? InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                RouteName.addEventPageMidwife,
                                                arguments: StringConstant
                                                    .visitHospital);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: EpregnancyColors
                                                      .primer,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 30,
                                                  left: 30,
                                                  bottom: 30),
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 25,
                                                    bottom: 25,
                                                    left: 20,
                                                    right: 20),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset("assets/icSchedule.svg"),
                                                    SizedBox(width: 18.w,),
                                                    Container(
                                                      // margin: EdgeInsets.only(left: 20),
                                                      child:  const Text(
                                                        "Jadwal Acara",
                                                        style: TextStyle(
                                                            color: EpregnancyColors.primer,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14),
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ) : InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                RouteName.addEventPage,
                                                arguments: StringConstant
                                                    .visitHospital);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: EpregnancyColors
                                                      .greenMight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 30,
                                                  left: 30,
                                                  bottom: 30),
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 25,
                                                    bottom: 25,
                                                    left: 20,
                                                    right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // margin: EdgeInsets.only(left: 20),
                                                      child: Text(
                                                        "Kunjungan Puskesmas",
                                                        style: TextStyle(
                                                            color: isChoice == 1
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 14),
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                  widget.role == "MIDWIFE" ? InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          RouteName.addEventPageForPatient,
                                          arguments:
                                          StringConstant.visitHospital);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: EpregnancyColors
                                                .primer,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                        margin: const EdgeInsets.only(
                                            right: 30,
                                            left: 30,
                                            bottom: 30),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 25,
                                              bottom: 25,
                                              left: 20,
                                              right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset("assets/icCommunity.svg"),
                                              SizedBox(width: 18.w,),
                                              Container(
                                                // margin: EdgeInsets.only(left: 20),
                                                child:  const Text(
                                                  "Jadwal Untuk Peserta",
                                                  style: TextStyle(
                                                      color: EpregnancyColors.primer,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ) : InkWell(
                                    
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          RouteName.addEventPage,
                                          arguments:
                                              StringConstant.consumeMedicine);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: EpregnancyColors.purple,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  child: Text(
                                                    "Konsumsi Obat",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: isChoice == 2
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  widget.role == "MIDWIFE"
                                      ? const SizedBox.shrink()
                                      : InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                RouteName.addEventPage,
                                                arguments:
                                                    StringConstant.other);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      EpregnancyColors.primer,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 30,
                                                  left: 30,
                                                  bottom: 30),
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 25,
                                                    bottom: 25,
                                                    left: 20,
                                                    right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20, right: 20),
                                                      child: Text(
                                                        "Lain-lain",
                                                        style: TextStyle(
                                                            color: isChoice == 3
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 14),
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
