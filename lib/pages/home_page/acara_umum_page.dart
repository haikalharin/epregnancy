import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/epragnancy_color.dart';

class AcaraUmumPage extends StatelessWidget {
  const AcaraUmumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: EpragnancyColors.pink,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
          child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(

                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: const Text(
                            "Trimester Pertama",
                            style: TextStyle(fontSize: 16),
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: const Text(
                            "8 minggu 1 hari ",
                            style: TextStyle(fontSize: 12),
                          )),
                      Container(
                          child: Row(
                            children: [
                              Container(
                                  margin:
                                  EdgeInsets.only(right: 10),
                                  height: 10,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          25.0),
                                      color: EpragnancyColors.pink)),
                              Container(
                                  margin:
                                  EdgeInsets.only(right: 10),
                                  height: 10,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          25.0),
                                      color: EpragnancyColors.pink)),
                              Container(
                                  margin:
                                  EdgeInsets.only(right: 10),
                                  height: 10,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          25.0),
                                      color: EpragnancyColors.pink)),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: EpragnancyColors.pink),
                  height: 60,
                  width: 60,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
