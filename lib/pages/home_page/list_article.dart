import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/epragnancy_color.dart';

class ListArticle extends StatelessWidget {
  List<PersonModel> listPrivilegesData = [
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),
   PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "2 jam yang lalu"),


  ];

  // final String nextMenu, content;

  // ListPrivilegesWidget(this.content,{this.listPrivilegesData,this.nextMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: listPrivilegesData.isEmpty
            ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
            : Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.,
                        padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: EpragnancyColors.primer,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.greenAccent,
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      margin: EdgeInsets.only(),
                                      child: Text(listPrivilegesData[index].name!)),
                                  Container(
                                      // width: 62,
                                      margin: EdgeInsets.only(top: 30),
                                      child: Text(
                                          listPrivilegesData[index].phoneNumber!, style: TextStyle(fontSize: 10),)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: EpragnancyColors.primer),
                              height: 100,
                              width: 100,
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
