import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';
import '../../../utils/string_constans.dart';

class ReedemItemCard extends StatelessWidget {
  const ReedemItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // widget reedem item card
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey))
                ),
                child: Center(
                  child: Image.asset('assets/dummies/dummy_image1.png'),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // title with point wudget
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, right: 10, bottom: 20),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  'Diaper Pampers - Jumbo Pack',
                                  style: TextStyle(
                                      color: EpregnancyColors.blueDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: EpregnancyColors.blueBorder,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icPoin.svg',
                                    width: 10,
                                    height: 10,
                                    color: EpregnancyColors.blueDark,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                        '40.000',
                                        style: TextStyle(
                                            color: EpregnancyColors.blueDark,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        overflow: TextOverflow.visible,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '59 Ibu telah menukarkan hadiah ini',
                          style: TextStyle(color: EpregnancyColors.primer, fontSize: 12),
                        )),

                    // button reedem poin
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  EpregnancyColors.blueDark),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))),
                          onPressed: () {
                            // todo redeem poin
                          },
                          child: Center(
                            child: Text(
                              StringConstant.reedemPoin,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          )),
                    )
                  ],
                ))
          ],
        ),
      );
  }
}
