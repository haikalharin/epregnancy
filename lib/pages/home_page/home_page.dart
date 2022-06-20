import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/home_page/tab_bar_calendar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/firebase/g_authentication.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';
import 'list_privileges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModelFirebase user = UserModelFirebase.empty();

  void getMyPerson() async {
    UserModelFirebase userModelFirebase =
        await AppSharedPreference.getUserFirebase();
    setState(() {
      user = userModelFirebase;
    });
  }

  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              String? name = state.user != null ? state.user!.name : "";
              return Container(
                child: ListView(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(bottom: 20, top: 20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 50, right: 50, bottom: 20),
                                  child: Text("Halo, $name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: EpragnancyColors.pink),
                                  margin: EdgeInsets.only(left: 50, right: 50),
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: const Text(
                                                    "Trimester Pertama",
                                                    style:
                                                        TextStyle(fontSize: 16,color: Colors.white),
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: const Text(
                                                    "8 minggu 1 hari ",
                                                    style:
                                                        TextStyle(fontSize: 12,color: Colors.white),
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 10,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          color: Colors.grey)),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 10,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          color: Colors.grey)),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 10,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          color: Colors.grey)),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              color: Colors.white),
                                          height: 60,
                                          width: 60,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 30, left: 50, right: 50, bottom: 20),
                                  child: const Text("Permainan & Poin",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    margin: EdgeInsets.only(
                                        left: 50, right: 50, bottom: 20),
                                    child: const Text(
                                      "Main, menangkan poin, dan tukarkan untuk berbagai hadiah! ",
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                    )),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: EpragnancyColors.pink,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 50, right: 50, bottom: 30),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 20,
                                          right: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: EpragnancyColors.pink),
                                            height: 30,
                                            width: 30,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            child: const Text(
                                              "aaaaaaa ",
                                              style: TextStyle(fontSize: 14),
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 50, right: 50, bottom: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      const Text("Tambahan Poin",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // height: 200,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: const Text(
                                      "Artikel Untuk Anda",
                                      style: TextStyle(fontSize: 20),
                                    )),
                                    Container(
                                      child: const Icon(
                                        Icons.arrow_forward_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [Expanded(child: ListArticle())],
                              ),
                            ],
                          ),
                        )),
                    Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20, bottom: 20, top: 20),
                                child: const Text(
                                  "Kalender Saya",
                                  style: TextStyle(fontSize: 20),
                                )),
                            Container(height: 500, child: TabBarCalendarPage()),
                          ],
                        )),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
