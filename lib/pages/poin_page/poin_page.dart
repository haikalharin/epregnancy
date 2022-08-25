import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/pages/poin_page/widget/curve_clipper.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_border_init.dart';
import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
import 'package:PregnancyApp/pages/poin_page/widget/reedem_item_card.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/epragnancy_color.dart';

class PoinPage extends StatefulWidget {
  const PoinPage({Key? key}) : super(key: key);

  @override
  State<PoinPage> createState() => _PoinPageState();
}

class _PoinPageState extends State<PoinPage> {
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
            child: Row(
              children: [
                PoinIconWidget(),
                Text(
                  '993',
                  style: TextStyle(
                      color: EpregnancyColors.blackBack,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
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
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    PoinIconBorderInitial(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      index == 0
                                          ? StringConstant.today
                                          : '${StringConstant.dayCount}${index + 1}',
                                      style: TextStyle(
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
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        EpregnancyColors.blueDark)),
                                onPressed: () {
                                  // todo handle checkin
                                },
                                child: Center(
                                  child: Text(
                                    StringConstant.checkInText,
                                    style: TextStyle(color: Colors.white),
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
