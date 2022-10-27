import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/pages/poin_page/widget/curve_clipper.dart';
import 'package:PregnancyApp/pages/poin_page/widget/how_to_redeem_content.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_checked_in.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_border_init.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: EpregnancyColors.blackBack,
          ),
          onPressed: () {
            Navigator.pop(context, 'reFetchPoint');
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(top: 15, right: 10),
            child: Text(
              StringConstant.yourPoin,
              style: TextStyle(
                  color: EpregnancyColors.blueDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child:  PoinPlaceHolder(point: _point)
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.poinActivityPage, arguments: _point);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: EpregnancyColors.blueDark,
                size: 20,
              ))
        ],
      ),
      body: BlocListener<PoinBloc, PoinState>(
        listener: (context, state){
          print('state status :  ${state.status} || type : ${state.type} || day : ${state.dayForPayload}');
          if(state.status == FormzStatus.submissionInProgress && state.type == "check-in-event"){
            // todo show loading dialog
          } else if (state.status ==  FormzStatus.submissionSuccess){
            // todo close loading dialog
          } else if (state.status ==  FormzStatus.submissionFailure) {
            // todo show error dialog // handle error
          }
          setState(() {
            _point = state.totalPoint ?? 0;
          });
        },
        child: BlocBuilder<PoinBloc, PoinState>(
          builder: (context, state){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // widget checkin with clipper
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipPath(
                        clipper: CurveClipper(),
                        child: Container(
                          color: EpregnancyColors.blueClipper,
                          height: MediaQuery.of(context).size.height / 3.5,
                        ),
                      ),
                      // card inside clipper
                      Positioned(
                        top: 30,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            // height: 150,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                //listview horizontal
                                Container(
                                  height: 70,
                                  margin: EdgeInsets.only(top: 10),
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 5.w);
                                    },
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.checkInEntityList?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          !state.checkInEntityList![index].done! ? const PoinIconBorderInitial() :const PointCheckedIn(),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            index == 0
                                                ? StringConstant.today
                                                : '${StringConstant.dayCount}${index + 1}',
                                            style: TextStyle(
                                                fontWeight: state.todayIndex == index ? FontWeight.bold : FontWeight.normal,
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
                                      horizontal: 16.0, vertical: 5),
                                  child: ElevatedButton(
                                    // style: ButtonStyle(
                                    //     backgroundColor: MaterialStateProperty.all(
                                    //         EpregnancyColors.blueDark)),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                              if (states.contains(MaterialState.pressed)) {
                                                return EpregnancyColors.blueDark;
                                              } else if (states.contains(MaterialState.disabled)) {
                                                return EpregnancyColors.primerSoft;
                                              } else {
                                                // Use the component's default.
                                                return EpregnancyColors.blueDark;
                                              }
                                            },
                                          )),
                                      onPressed: state.checkInDoneForToday ?? false ? null : (){
                                        Injector.resolve<PoinBloc>().add(PoinCheckInEvent(state.dayForPayload));
                                      },
                                      child: Center(
                                        child: Text(
                                          state.checkInDoneForToday ?? false ? StringConstant.checkInDone :  StringConstant.checkInText,
                                          style: TextStyle(color: state.checkInDoneForToday ?? false ? EpregnancyColors.blueDark : Colors.white),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //widget title text
                  // Padding(
                  //   padding:
                  //   const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                  //   child: Text(
                  //     StringConstant.titlePoin,
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //         fontSize: 20),
                  //   ),
                  // ),
                  // ReedemItemCard(),
                  // SizedBox(height: 20,),
                  // ReedemItemCard(),
                  // SizedBox(height: 20,),
                  // ReedemItemCard(),
                  Container(
                    height: 80.h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    padding: EdgeInsets.only(left: 20.w, top: 16.h),
                    decoration: BoxDecoration(
                      color: EpregnancyColors.blueDark,
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                        image: AssetImage('assets/bg_gift.png'),
                        fit: BoxFit.fill
                      )
                    ),
                    child: InkWell(
                      onTap: (){
                        Toast.show("Nantikan hadiah-hadiah menarik untuk direedem!");
                      },
                        child: Text("Lihat Semua Hadiahnya", style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w700),)),
                  ),

                  Container(
                    height: 100.h,
                    padding: EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w),
                    width: MediaQuery.of(context).size.width,
                    color: EpregnancyColors.primer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Cara Mendapatkan Poin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp),),
                            SizedBox(height: 10.h,),
                            Text("Setiap hari anda berkesempatan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12.sp),),
                            SizedBox(height: 0.h,),
                            RichText(text: TextSpan(
                                text: "untuk mendapatkan",
                                style: TextStyle(fontSize: 12.sp, color: EpregnancyColors.white, fontWeight: FontWeight.w500),
                                children:  <TextSpan>[
                                  TextSpan(text: " 750 Poin", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: EpregnancyColors.white))
                                ]
                            ))
                          ],
                        ),
                        Container(
                          height: 100.h,
                          width: 120.w,
                          child: Image.asset('assets/icGift.png', fit: BoxFit.fill,),
                        ),
                      ],
                    ),
                  ),

                  // HowToRedeemCard(),
                  // HowToRedeemCard(),
                  // HowToRedeemCard(),

                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/flyer_poin.jpeg", fit: BoxFit.fill,),
                  ),
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/flyer_gamification.jpeg", fit: BoxFit.fill),
                  ),
                  SizedBox(height: 20.h,)
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
