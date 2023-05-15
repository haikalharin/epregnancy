import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/pages/child_list_page/child_list_page.dart';
import 'package:PregnancyApp/pages/child_list_page/widget/add_child_button.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/home_page/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../common/style/custom_text_style.dart';
import '../../data/model/hospital_model/hospital_model.dart';
import '../../utils/epragnancy_color.dart';
import '../notification_page/notification_page.dart';
import 'package:badges/badges.dart' as badge;

class AppBarHomePage extends StatefulWidget {
  AppBarHomePage({Key? key}) : super(key: key);

  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      print("childs length : ${state.babyChilds?.length}");

      if ((state.babyChilds?.length ?? 0) >= 1) {
        // have a child widget
        return Container(
          width: MediaQuery.of(context).size.width,
          color: EpregnancyColors.white,
          margin: EdgeInsets.only(bottom: 12, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 16.w),
                  child: SvgPicture.asset("assets/ic_baby_appbar.svg")),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const ChildListPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10.w,
                        right: 0,
                      ),
                      child: Text("${state.myChildDashboard?.child?.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          textAlign: TextAlign.start),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          _showBabyAndChildPicker(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: EpregnancyColors.primer,
                        )),
                  )
                ],
              )),
              // app bar action section
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                // alignment: Alignment.centerRight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(left: 0.w, right: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              if (state.hospitalModel?.name == '') {
                                Navigator.pushNamed(
                                        context, RouteName.locationSelect)
                                    .then((value) {
                                  if (value != null) {
                                    Injector.resolve<HomePageBloc>().add(
                                        SetHospitalEvent(
                                            value as HospitalModel?));

                                    // setState(() {
                                    //   // todo hospital model set in bloc
                                    //   Inje
                                    //   // state.hospitalModel = value as HospitalModel?;
                                    // });
                                  }
                                });
                              } else {
                                // todo implement barcode scanner
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QrScanner())).then((value) {
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
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                Icons.qr_code,
                                color: EpregnancyColors.primer,
                                size: 23.w,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Toast.show("Fitur ini akan segera hadir");
                              // Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                              //   if (value != null) {
                              //     setState(() {
                              //       widget.hospitalModel = value
                              //           as HospitalModel?;
                              //     });
                              //   }
                              // });
                            },
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                              },
                              child: badge.Badge(
                                badgeContent: Center(child: Text(state.totalUnreadNotif.toString(), style: const TextStyle(color: Colors.white),)),
                                position: badge.BadgePosition.topEnd(top: -10, end: -3),
                                child: Icon(
                                  Icons.notifications,
                                  color: EpregnancyColors.primer,
                                  size: 23.w,
                                ),
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
        );
      } else {
        // perbarui status kehamilan
        if (state.baby == null || state.baby?.baby?.name == "null") {
          print('perbarui status kehamilan');
          return Container(
            width: MediaQuery.of(context).size.width,
            color: EpregnancyColors.white,
            margin: EdgeInsets.only(bottom: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                state.baby != null && state.baby?.baby?.name != 'null'
                    ? Container(
                        margin: EdgeInsets.only(left: 16.w),
                        child: SvgPicture.asset("assets/ic_baby_appbar.svg"))
                    : const SizedBox.shrink(),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.surveyPageBaby,
                          arguments: {"is_edit": false, "edit_name": false});
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16.w, right: 40.w),
                      padding:
                          EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
                      decoration: BoxDecoration(
                        color: EpregnancyColors.primer,
                        border: Border.all(
                          color: EpregnancyColors.primer,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: const Text(
                            'Perbarui Status Kehamilan',
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.visible,
                                color: EpregnancyColors.white,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          )),
                          const Expanded(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: EpregnancyColors.white,
                            ),
                          )
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
                        margin: EdgeInsets.only(left: 0.w, right: 10.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (state.hospitalModel?.name == '') {
                                  Navigator.pushNamed(
                                          context, RouteName.locationSelect)
                                      .then((value) {
                                    if (value != null) {
                                      Injector.resolve<HomePageBloc>().add(
                                          SetHospitalEvent(
                                              value as HospitalModel?));

                                      // setState(() {
                                      //   // todo hospital model set in bloc
                                      //   Inje
                                      //   // state.hospitalModel = value as HospitalModel?;
                                      // });
                                    }
                                  });
                                } else {
                                  // todo implement barcode scanner
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QrScanner())).then((value) {
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
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(
                                  Icons.qr_code,
                                  color: EpregnancyColors.primer,
                                  size: 23.w,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Toast.show("Fitur ini akan segera hadir");
                                // Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                //   if (value != null) {
                                //     setState(() {
                                //       widget.hospitalModel = value
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
          );
        } else if (state.baby?.baby?.status == "BELUM_LAHIR" &&
            state.baby?.baby?.name == "") {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: EpregnancyColors.white,
            margin: EdgeInsets.only(bottom: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                state.baby != null && state.baby?.baby?.name != 'null'
                    ? Container(
                        margin: EdgeInsets.only(left: 16.w),
                        child: SvgPicture.asset("assets/ic_baby_appbar.svg"))
                    : const SizedBox.shrink(),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteName.surveyPageBaby,
                          arguments: {"is_edit": true, "edit_name": true});
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16.w, right: 60.w),
                      padding:
                          EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
                      decoration: BoxDecoration(
                        color: EpregnancyColors.primer,
                        border: Border.all(
                          color: EpregnancyColors.primer,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: const Text(
                            'Beri Nama Bayi',
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.visible,
                                color: EpregnancyColors.white,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          )),
                          const Expanded(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: EpregnancyColors.white,
                            ),
                          )
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
                        margin: EdgeInsets.only(left: 0.w, right: 10.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (state.hospitalModel?.name == '') {
                                  Navigator.pushNamed(
                                          context, RouteName.locationSelect)
                                      .then((value) {
                                    if (value != null) {
                                      Injector.resolve<HomePageBloc>().add(
                                          SetHospitalEvent(
                                              value as HospitalModel?));

                                      // setState(() {
                                      //   // todo hospital model set in bloc
                                      //   Inje
                                      //   // state.hospitalModel = value as HospitalModel?;
                                      // });
                                    }
                                  });
                                } else {
                                  // todo implement barcode scanner
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QrScanner())).then((value) {
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
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(
                                  Icons.qr_code,
                                  color: EpregnancyColors.primer,
                                  size: 23.w,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Toast.show("Fitur ini akan segera hadir");
                                // Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                //   if (value != null) {
                                //     setState(() {
                                //       widget.hospitalModel = value
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
          );
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: EpregnancyColors.white,
            margin: EdgeInsets.only(bottom: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                state.baby != null && state.baby?.baby?.name != ''
                    ? Container(
                        margin: EdgeInsets.only(left: 16.w),
                        child: SvgPicture.asset("assets/ic_baby_appbar.svg"))
                    : const SizedBox.shrink(),
                Expanded(
                  child: state.baby != null && state.baby?.baby?.name != ''
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 10.w,
                                right: 0,
                              ),
                              child: Text("${state.baby?.baby?.name}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.start),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: EpregnancyColors.primer,
                                ))
                          ],
                        )
                      // todo child option widget
                      : state.baby == null ||
                              state.baby?.baby?.status != "BELUM_LAHIR"
                          ? const SizedBox.shrink()
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
                                margin:
                                    EdgeInsets.only(left: 16.w, right: 40.w),
                                padding: EdgeInsets.only(left: 16.w),
                                decoration: BoxDecoration(
                                  color: EpregnancyColors.primer,
                                  border: Border.all(
                                    color: EpregnancyColors.primer,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: const Text(
                                      'Beri nama bayi',
                                      style: TextStyle(
                                          fontSize: 12,
                                          overflow: TextOverflow.visible,
                                          color: EpregnancyColors.white,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
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
                        margin: EdgeInsets.only(left: 0.w, right: 10.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (state.hospitalModel?.name == '') {
                                  Navigator.pushNamed(
                                          context, RouteName.locationSelect)
                                      .then((value) {
                                    if (value != null) {
                                      Injector.resolve<HomePageBloc>().add(
                                          SetHospitalEvent(
                                              value as HospitalModel?));

                                      // setState(() {
                                      //   // todo hospital model set in bloc
                                      //   Inje
                                      //   // state.hospitalModel = value as HospitalModel?;
                                      // });
                                    }
                                  });
                                } else {
                                  // todo implement barcode scanner
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QrScanner())).then((value) {
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
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(
                                  Icons.qr_code,
                                  color: EpregnancyColors.primer,
                                  size: 23.w,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Toast.show("Fitur ini akan segera hadir");
                                // Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                                //   if (value != null) {
                                //     setState(() {
                                //       widget.hospitalModel = value
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
          );
        }
      }
    });
  }

  void _showBabyAndChildPicker(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (BuildContext bc) {
          return BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Wrap(
                  children: [
                    Center(
                        child: Container(
                            decoration: BoxDecoration(
                                color: EpregnancyColors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            width: 40,
                            height: 4,
                            margin: EdgeInsets.only(top: 16))),
                    Center(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 28, top: 20),
                            child: Text(
                              "Profil Anak",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ))),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == state.babyChilds?.length) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: const AddChildButton(),
                            );
                          } else {
                            return ListTile(
                              leading:
                              SvgPicture.asset("assets/ic_baby_appbar.svg"),
                              title: _childNameWithGender(state.babyChilds?[index].name ?? "", state.babyChilds?[index].gender ?? "L"),
                              onTap: () async {
                                Injector.resolve<HomePageBloc>().add(HomeFetchChildForDashboardEvent(state.babyChilds![index].id!));
                                Navigator.pop(context);
                              },
                              trailing: state.selectedChildId == state.babyChilds?[index].id ? const Icon(Icons.radio_button_checked) : const Icon(Icons.radio_button_off),
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: (state.babyChilds?.length ?? 0) + 1)
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget _childNameWithGender(String name, String gender) {
    if(gender == "L"){
      return blackText16("$name ♂");
    } else {
      return blackText16("$name ♀");
    }
  }
}
