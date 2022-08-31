import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/pages/poin_page/widget/curve_clipper.dart';
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
                                      return SizedBox(width: 5);
                                    },
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.checkInEntityList?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          !state.checkInEntityList![index].done! ? const PoinIconBorderInitial() :const PointCheckedIn(),
                                          const SizedBox(
                                            height: 5,
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
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child: Text(
                      StringConstant.titlePoin,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  ReedemItemCard(),
                  SizedBox(height: 20,),
                  ReedemItemCard(),
                  SizedBox(height: 20,),
                  ReedemItemCard(),
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
