import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/data/model/point/checkin_entity.dart';
import 'package:PregnancyApp/data/model/point/checkin_response.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/epragnancy_color.dart';

class PoinPage extends StatefulWidget {
  const PoinPage({Key? key, required this.point}) : super(key: key);
  final int point;

  @override
  State<PoinPage> createState() => _PoinPageState();
}

class _PoinPageState extends State<PoinPage> {
  String? installDate;
  List<CheckInEntity> checkInEntityList = [];
  String today = DateFormatter.dateFormatForCheckinFilter.format(DateTime.now());
  int? todayIndex;
  bool checkInDoneForToday = false;
  late int _point = widget.point;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_){
      // _getCheckInList();
      _initCheckInSetup();
    });
  }

  _initCheckInSetup() async {
    String? _installDate = await AppSharedPreference.getString(AppConstants.installDateKey);
    DateTime startDate = DateFormatter.dateFormatForCheckinFilter.parse(_installDate!);

    List<CheckIn>? _checkIns = [];
    UserInfo _userInfo = await AppSharedPreference.getUserInfo();
    _checkIns = _userInfo.checkins;

    //generate 7 day from install date for hari ke checkin
    final _checkinDateList = List<CheckInEntity>.generate(7, (i) {
      String _plusDate = DateFormatter.dateFormatForCheckinFilter.format(startDate.add(Duration(days: i)));
      bool hasCheckIn = _checkIns!.any((e) => e.date == _plusDate);
      if (hasCheckIn) {
        return CheckInEntity(done: true, date: _plusDate);
      } else {
        return CheckInEntity(done: false, date: _plusDate);
      }
    });

    // get today hari ke

    setState(() {
      installDate = _installDate;
      checkInEntityList = _checkinDateList;
      todayIndex = _checkinDateList.indexWhere((element) => (element.date == today.toString()));
      if(todayIndex != -1){
        if(_checkinDateList[todayIndex!].done == true){
          checkInDoneForToday = true;
        }
      }
    });
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
            Navigator.pop(context);
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
                Navigator.pushNamed(context, RouteName.poinActivityPage);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: EpregnancyColors.blueDark,
                size: 20,
              ))
        ],
      ),
      body: SingleChildScrollView(
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
                              itemCount: checkInEntityList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    !checkInEntityList[index].done! ? const PoinIconBorderInitial() :const PointCheckedIn(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      index == 0
                                          ? StringConstant.today
                                          : '${StringConstant.dayCount}${index + 1}',
                                      style: TextStyle(
                                          fontWeight: todayIndex == index ? FontWeight.bold : FontWeight.normal,
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
                                onPressed: checkInDoneForToday ? null : (){
                                    // todo handle checkin event
                                },
                                child: Center(
                                  child: Text(
                                    checkInDoneForToday ? StringConstant.checkInDone :  StringConstant.checkInText,
                                    style: TextStyle(color: checkInDoneForToday ? EpregnancyColors.blueDark : Colors.white),
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
      ),
    );
  }
}
