import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';

class GameCardSection extends StatelessWidget {
  const GameCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteName.gamesPage);
      },
      child: Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    EpregnancyColors.gameGradient1,
                    EpregnancyColors.gameGradient2
                  ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.playGames,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: StringConstant.playGamesDesc,
                          style: TextStyle(
                              fontSize: 13, color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' ' + StringConstant.point,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: EpregnancyColors.white))
                          ])),
                  SizedBox(height: 5.h,),
                  const Text(
                    StringConstant.playGameDescCon,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13),
                  ),
                  SizedBox(height: 10.h,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.gamesPage);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: EpregnancyColors.orange,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(StringConstant.playNow, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                            fontSize: 12.sp),),
                      ),
                    ),
                  )
                ],
              ),
              SvgPicture.asset('assets/icGames.svg')
            ],
          ),
        ),
      ),
    );
  }
}
