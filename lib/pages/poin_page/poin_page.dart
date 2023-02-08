import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/pages/poin_page/widget/curve_clipper.dart';
import 'package:PregnancyApp/pages/poin_page/widget/how_to_redeem_content.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_checked_in.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_border_init.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_info_card.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_placeholder.dart';
import 'package:PregnancyApp/pages/poin_page/widget/reedem_item_card.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/poin_bloc.dart';

class PoinPage extends StatefulWidget {
  const PoinPage({Key? key, required this.point}) : super(key: key);
  final int point;

  @override
  State<PoinPage> createState() => _PoinPageState();
}

class _PoinPageState extends State<PoinPage> {
  late int _point = widget.point;

  @override
  void initState() {
    super.initState();
    Injector.resolve<PoinBloc>().add(PoinInitialEvent(_point));
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: EpregnancyColors.bgPoin,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Container(
            // padding: EdgeInsets.only(top: 15, right: 10),
            child: const Text(
              StringConstant.yourPoin,
              style: TextStyle(
                  color: EpregnancyColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: EpregnancyColors.blackBack,
            ),
            onPressed: () {
              Navigator.pop(context, 'reFetchPoint');
            },
          ),
          actions: [
            Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(top: 12, bottom: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: PoinPlaceHolder(point: _point)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.poinActivityPage,
                      arguments: _point);
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: EpregnancyColors.blueDark,
                  size: 20,
                ))
          ],
        ),
        body: BlocListener<PoinBloc, PoinState>(
          listener: (context, state) {
            print(
                'state status :  ${state.status} || type : ${state.type} || day : ${state.dayForPayload}');
            if (state.status == FormzStatus.submissionInProgress &&
                state.type == "check-in-event") {
              // todo show loading dialog
            } else if (state.status == FormzStatus.submissionSuccess) {
              // todo close loading dialog
            } else if (state.status == FormzStatus.submissionFailure) {
              // todo show error dialog // handle error
            }

            setState(() {
              _point = state.totalPoint ?? 0;
            });
          },
          child: BlocBuilder<PoinBloc, PoinState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // widget checkin with clipper
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Visibility(
                    //       visible: false,
                    //       child: ClipPath(
                    //         clipper: CurveClipper(),
                    //         child: Container(
                    //           color: EpregnancyColors.blueClipper,
                    //           height: MediaQuery.of(context).size.height / 3.5,
                    //         ),
                    //       ),
                    //     ),
                    //     // card inside clipper
                    //     Positioned(
                    //       top: 30,
                    //       child: Align(
                    //         alignment: Alignment.center,
                    //         child: Container(
                    //           // height: 150,
                    //           width: MediaQuery.of(context).size.width * 0.90,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Column(
                    //             children: [
                    //               //listview horizontal
                    //               Container(
                    //                 height: 70,
                    //                 margin: EdgeInsets.only(top: 10),
                    //                 child: ListView.separated(
                    //                   separatorBuilder: (context, index) {
                    //                     return SizedBox(width: 5.w);
                    //                   },
                    //                   shrinkWrap: true,
                    //                   scrollDirection: Axis.horizontal,
                    //                   itemCount: state.checkInEntityList?.length ?? 0,
                    //                   itemBuilder: (context, index) {
                    //                     return Column(
                    //                       children: [
                    //                         !state.checkInEntityList![index].done! ? const PoinIconBorderInitial() :const PointCheckedIn(),
                    //                         SizedBox(
                    //                           height: 5.h,
                    //                         ),
                    //                         Text(
                    //                           index == 0
                    //                               ? StringConstant.today
                    //                               : '${StringConstant.dayCount}',
                    //                           style: TextStyle(
                    //                               fontWeight: state.todayIndex == index ? FontWeight.bold : FontWeight.normal,
                    //                               color: EpregnancyColors.blueDark,
                    //                               fontSize: 10),
                    //                         )
                    //                       ],
                    //                     );
                    //                   },
                    //                 ),
                    //               ),
                    //               //checkin button
                    //               Padding(
                    //                 padding: EdgeInsets.symmetric(
                    //                     horizontal: 16.0, vertical: 5),
                    //                 child: ElevatedButton(
                    //                   // style: ButtonStyle(
                    //                   //     backgroundColor: MaterialStateProperty.all(
                    //                   //         EpregnancyColors.blueDark)),
                    //                     style: ButtonStyle(
                    //                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    //                               (Set<MaterialState> states) {
                    //                             if (states.contains(MaterialState.pressed)) {
                    //                               return EpregnancyColors.blueDark;
                    //                             } else if (states.contains(MaterialState.disabled)) {
                    //                               return EpregnancyColors.primerSoft;
                    //                             } else {
                    //                               // Use the component's default.
                    //                               return EpregnancyColors.blueDark;
                    //                             }
                    //                           },
                    //                         )),
                    //                     onPressed: state.checkInDoneForToday ?? false ? null : (){
                    //                       Injector.resolve<PoinBloc>().add(PoinCheckInEvent(state.dayForPayload));
                    //                     },
                    //                     child: Center(
                    //                       child: Text(
                    //                         state.checkInDoneForToday ?? false ? StringConstant.checkInDone :  StringConstant.checkInText,
                    //                         style: TextStyle(color: state.checkInDoneForToday ?? false ? EpregnancyColors.blueDark : Colors.white),
                    //                       ),
                    //                     )),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),

                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Container(
                    //     // height: 150,
                    //     width: MediaQuery.of(context).size.width * 0.90,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10.w)),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         //listview horizontal
                    //         Container(
                    //           child: Text(
                    //             StringConstant.titleComingSoon,
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 16.sp,
                    //                 fontWeight: FontWeight.w700),
                    //           ),
                    //           margin: EdgeInsets.only(left: 16.w,top: 24.h,right: 16.w,bottom: 24.w),
                    //         ),
                    //         Center(
                    //           child: Container(
                    //             width: 240.w,
                    //             height: 160.h,
                    //             margin: EdgeInsets.only(bottom: 50),
                    //             child:Image.asset(
                    //               'assets/bg_coming_soon_redeem_point.png',
                    //               fit: BoxFit.fill,
                    //               width: MediaQuery.of(context).size.width,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // height: 150,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //listview horizontal
                            Container(
                              height: 60.h,
                              margin: EdgeInsets.only(top: 10),
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 10.w);
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.checkInEntityList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      !state.checkInEntityList![index].done!
                                          ? const PoinIconBorderInitial()
                                          : const PointCheckedIn(),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        index == 0
                                            ? StringConstant.today
                                            : '${StringConstant.dayCount}',
                                        style: TextStyle(
                                            // fontWeight: state.todayIndex == index ? FontWeight.bold : FontWeight.normal,
                                            fontWeight: FontWeight.bold,
                                            color: EpregnancyColors.blueDark,
                                            fontSize: 10),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            //checkin button
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5),
                              child: ElevatedButton(
                                  // style: ButtonStyle(
                                  //     backgroundColor: MaterialStateProperty.all(
                                  //         EpregnancyColors.blueDark)),
                                  style: ButtonStyle(backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return EpregnancyColors.blueDark;
                                      } else if (states
                                          .contains(MaterialState.disabled)) {
                                        return EpregnancyColors.primerSoft;
                                      } else {
                                        // Use the component's default.
                                        return EpregnancyColors.primer;
                                      }
                                    },
                                  )),
                                  onPressed: state.checkInDoneForToday ?? false
                                      ? null
                                      : () {
                                          Injector.resolve<PoinBloc>().add(
                                              PoinCheckInEvent(
                                                  state.dayForPayload));
                                        },
                                  child: Center(
                                    child: Text(
                                      state.checkInDoneForToday ?? false
                                          ? StringConstant.checkInDone
                                          : StringConstant.checkInText,
                                      style: TextStyle(
                                          color:
                                              state.checkInDoneForToday ?? false
                                                  ? EpregnancyColors.blueDark
                                                  : Colors.white),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),

                    //widget title text
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
                      child: Text(
                        StringConstant.titlePoin,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: EpregnancyColors.purpleBg,
                            fontSize: 12.sp),
                      ),
                    ),
                    // ReedemItemCard(),
                    // SizedBox(height: 20,),
                    // ReedemItemCard(),
                    // SizedBox(height: 20,),
                    // ReedemItemCard(),
                    const PoinInfoCard(
                      title: "Masuk ke Aplikasi Harian",
                      subtitle:
                          "Klaim 10 POIN harian Anda ketika masuk ke\naplikasi",
                      image: "assets/ic_daily_login_poin.png",
                      game: true,
                    ),
                    const PoinInfoCard(
                        title: "Kunjungi Puskesmas",
                        subtitle:
                            "Anda akan mendapatkan 100 POIN untuk setiap\nkunjungan ke puskesmas dalam sehari",
                        image: "assets/imgKunjungan.png"),
                    // const PoinInfoCard(title: "Bermain Game", subtitle: "Anda akan mendapatkan 50 POIN untuk setiap\ngame yang dimainkan", image: "assets/imgGame.png", game: true,),
                    // Container(
                    //   // height: 80.h,
                    //     width: MediaQuery
                    //         .of(context)
                    //         .size
                    //         .width,
                    //     margin: EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h),
                    //     padding: EdgeInsets.only(left: 20.w, top: 16.h, right: 20.w),
                    //     decoration: BoxDecoration(
                    //         color: EpregnancyColors.purpleBg,
                    //         borderRadius: BorderRadius.circular(10.w),
                    //         image: const DecorationImage(
                    //             alignment: Alignment.centerRight,
                    //             image: AssetImage('assets/circle_shadow.png'),
                    //             fit: BoxFit.contain,
                    //             opacity: 0.25,
                    //             scale: 1.5
                    //         )
                    //     ),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text("Bermain Game", style: TextStyle(color: Colors
                    //             .white, fontSize: 12.sp, fontWeight: FontWeight
                    //             .w700),),
                    //         SizedBox(height: 5.h,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text("Anda akan mendapatkan 50 POIN untuk setiap\ngame yang dimainkan", style: TextStyle(color: Colors
                    //                 .white, fontSize: 10.sp, fontWeight: FontWeight.w500),),
                    //             Container(
                    //               margin: EdgeInsets.only(bottom: 10.h),
                    //                 child: Image.asset("assets/imgGame.png", alignment: Alignment.center,))
                    //           ],
                    //         )
                    //       ],
                    //     )
                    // ),

                    // HowToRedeemCard(),
                    // HowToRedeemCard(),
                    // HowToRedeemCard(),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
