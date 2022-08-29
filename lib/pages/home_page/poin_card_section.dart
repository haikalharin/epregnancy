import 'package:PregnancyApp/common/constants/string_constants.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';

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
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, RouteName.poinPage, arguments: widget.point);
        },
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
                color: EpregnancyColors.primerSoft),
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
                          color: EpregnancyColors.blueCircle,
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
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EpregnancyColors.blueDark),
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
                                child:  RichText(text: TextSpan(
                                    text: checkInToday,
                                    style: TextStyle(fontSize: 13, color: EpregnancyColors.primer),
                                    children: const <TextSpan>[
                                      TextSpan(text: StringConstant.point, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: EpregnancyColors.blueDark))
                                    ]
                                ))),
                          ),
                          Container(
                            margin:
                            EdgeInsets.only(left: 16),
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     left: 50, right: 50, bottom: 20),
                                child: const Text(
                                    StringConstant.amap,
                                    style: TextStyle(fontSize: 13, color: EpregnancyColors.primer)
                                )),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20, top: 10),
                        child: Image.asset('assets/item_group.png'),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
