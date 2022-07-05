import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/epragnancy_color.dart';

class ListCalendarWidget extends StatelessWidget {
  ListCalendarWidget({Key? key, this.tipeAcara}) : super(key: key);
  final String? tipeAcara;
  List<PersonModel> listPrivilegesData = [
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo: "Pastikan Kesehatan Bayi Balita",
        phoneNumber: "Sel, 9 Agu 2022"),
  ];

  // final String nextMenu, content;

  // ListPrivilegesWidget(this.content,{this.listPrivilegesData,this.nextMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: listPrivilegesData.isEmpty
            ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
            : Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: EpregnancyColors.primer,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.greenAccent,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      // width: 62,

                                      child: Text(
                                        listPrivilegesData[index].phoneNumber!,
                                        style: TextStyle(fontSize: 12),
                                      )),
                                  Container(
                                      // width: 62,

                                      child: Text(
                                        tipeAcara ?? '',
                                        style: TextStyle(fontSize: 12,color: EpregnancyColors.primer),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 230,
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                                listPrivilegesData[index]
                                                    .photo!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                                        Container(
                                            width: 230,
                                            margin: EdgeInsets.only(),
                                            child: Text(
                                                listPrivilegesData[index]
                                                    .name!)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.primer),
                                    height: 80,
                                    width: 80,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: listPrivilegesData.length,
                  ),
                ],
              ));
  }
}
