import 'package:PregnancyApp/common/constants/string_constants.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/router_constants.dart';
import '../../utils/epragnancy_color.dart';
import '../poin_page/widget/poin_placeholder.dart';

class PoinCardSection extends StatefulWidget {
   const PoinCardSection({Key? key, required this.point}) : super(key: key);
  final int point;

  @override
  State<PoinCardSection> createState() => _PoinCardSectionState();
}

class _PoinCardSectionState extends State<PoinCardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: EpragnancyColors.pink,
          //   ),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),

            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(10.0),
                color: EpregnancyColors.primer),
            margin: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20),
            child: Stack(
              children: [
                Positioned(
                  bottom: -50,
                  right: -25,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: EpregnancyColors.blueDark,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin:
                                  EdgeInsets.only(left: 16),
                                  child:  Text(
                                    yourPoin,
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EpregnancyColors.white),
                                  )),
                              Container(
                                padding: EdgeInsets.all(3),
                                margin: EdgeInsets.only(top: 12, bottom: 12, left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: PoinPlaceHolder(height: 10, width: 10, point: widget.point),
                              )
                            ],
                          ),
                          Container(
                            margin:
                            EdgeInsets.only(left: 16),
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     left: 50, right: 50, bottom: 20),
                                child:  RichText(text: const TextSpan(
                                    text: checkInToday,
                                    style: TextStyle(fontSize: 13, color: EpregnancyColors.white),
                                    children:  <TextSpan>[
                                      TextSpan(text: StringConstant.point, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: EpregnancyColors.white))
                                    ]
                                ))),
                          ),
                          SizedBox(height: 5.h,),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            child:  Container(
                              // margin: EdgeInsets.only(
                              //     left: 50, right: 50, bottom: 20),
                                child:  Text(
                                    StringConstant.amap,
                                    style: TextStyle(fontSize: 13, color: EpregnancyColors.white)
                                )),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.poinPage, arguments: widget.point);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              decoration: BoxDecoration(
                                  color: EpregnancyColors.blueDark,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text(StringConstant.claimPoint, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.w, top: 50.h),
                        child: Image.asset('assets/item_group.png'),
                      )
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
