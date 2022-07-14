import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/article_page/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../../utils/epragnancy_color.dart';

class ListArticleVertical extends StatelessWidget {
  List<ArticleModel>? listArticle = [];

  ListArticleVertical({this.listArticle});

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

  var articleBgColor = [
    HexColor('96D9C9'),
    HexColor('8775B8'),
    HexColor('FF9999'),
    HexColor('96D9C9'),
    HexColor('8775B8'),
    HexColor('8775B8')
  ];

  // final String nextMenu, content;

  // ListPrivilegesWidget(this.content,{this.listPrivilegesData,this.nextMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: listArticle!.isEmpty
            ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
            : Stack(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      String outputDate = "";
                      var outputFormat = DateFormat.yMMMMd('id');
                      outputDate = outputFormat.format(
                          DateTime.parse(listArticle![index].createdDate!));
                      // 12/3
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(
                                      article: listArticle![index])));
                        },
                        child: Container(
                          height: 150,
                          // padding: EdgeInsets.,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                          decoration: BoxDecoration(
                              image: listArticle![index].cardImgURL!.isEmpty
                                  ? DecorationImage(
                                    image: new AssetImage('assets/article-default-bg.png'),
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.bottomRight,
                                  )
                                  : DecorationImage(
                                    image: NetworkImage(
                                    listArticle![index].cardImgURL!),
                                    fit: BoxFit.cover,
                                  ),
                              borderRadius: BorderRadius.circular(10.0),
                              color: articleBgColor[Random().nextInt(6)],
                          ),
                          // color: Colors.greenAccent,
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Expanded(
                                      child: Container(
                                          width: MediaQuery.of(context).size.width-80,
                                          margin: EdgeInsets.only(),
                                          child: Text(
                                            listArticle![index].title!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    ),
                                    Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                      child: Icon(
                                                    Icons.access_time,
                                                    color: Colors.white,
                                                    size: 12,
                                                  )),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      child: Text(
                                                    outputDate,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color:
                                                      EpregnancyColors.primer),
                                              height: 18,
                                              width: 60,
                                              child: Center(
                                                  child: Text(
                                                "Berita",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ],
                                        )),
                                  ])),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: listArticle!.length,
                  ),
                ],
              ));
  }
}
