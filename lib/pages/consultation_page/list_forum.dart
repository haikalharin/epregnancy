import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/epragnancy_color.dart';

class ListForumWidget extends StatelessWidget {
  ListForumWidget({Key? key, this.tipeAcara}) : super(key: key);
  final String? tipeAcara;
  List<PersonModel> listPrivilegesData = [
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        photo:
            "https://cdn.hellosehat.com/wp-content/uploads/2017/02/ciri-orang-hamil.jpg",
        phoneNumber: "22 Agu 2022, 15:32 WIB"),
  ];

  // final String nextMenu, content;

  // ListPrivilegesWidget(this.content,{this.listPrivilegesData,this.nextMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: listPrivilegesData.isEmpty
            ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
            : Stack(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.greenAccent,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 30),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                // width: 62,

                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: const FadeInImage(
                                                    placeholder: AssetImage(
                                                        'assets/logo_flikchat.png'),
                                                    image: AssetImage(
                                                        'assets/logo_flikchat.png'),
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: const Text(
                                                        "Haikal",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.access_time),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                          // width: 62,

                                                          child: Text(
                                                        listPrivilegesData[
                                                                    index]
                                                                .phoneNumber ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.ios_share)
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    child: FadeInImage(
                                      placeholder: AssetImage(
                                          'assets/logo_flikchat.png'),
                                      image: NetworkImage(
                                          listPrivilegesData[index].photo ??
                                              ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            children: [
                                              // Container(
                                              //     width: 230,
                                              //     margin: EdgeInsets.only(bottom: 10),
                                              //     child: Text(
                                              //         listPrivilegesData[index]
                                              //             .name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 30, bottom: 30),
                                                  width: 300,
                                                  child: Text(
                                                      listPrivilegesData[index]
                                                          .name!)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width - 40 * 2,
                              color: Colors.grey.shade200,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 30),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                // width: 62,

                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: SvgPicture.asset(
                                                    'assets/like_logo.svg',
                                                    fit: BoxFit.fitHeight,

                                                    height: 17,
                                                    width: 17,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 200,
                                                      child: const Text(
                                                        'Kamu dan 15 orang menyukai post ini',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text("2,000 komentar",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: const FadeInImage(
                                          placeholder: AssetImage(
                                              'assets/logo_flikchat.png'),
                                          image: AssetImage(
                                              'assets/logo_flikchat.png'),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 230,
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        child: TextField(
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              height: 2.0,
                                              color: Colors.black),
                                          maxLines: 3,
                                          minLines: 1,
                                          decoration: const InputDecoration(
                                            hintText: 'Beri komentar...',
                                            border: InputBorder.none,
                                            isDense: true,
                                          ),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      Container(
                                        // width: 62,

                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 10),
                                          child: SvgPicture.asset(
                                            'assets/like_logo.svg',
                                            fit: BoxFit.fitHeight,
                                            // height: 200,
                                            // height: 60,
                                            // width: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            )
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
