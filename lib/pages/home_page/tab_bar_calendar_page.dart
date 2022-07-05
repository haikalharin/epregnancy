
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/list_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

import '../../data/model/person_model/person_model.dart';
import '../../utils/epragnancy_color.dart';
import 'acara_umum_page.dart';

class TabBarCalendarPage extends StatefulWidget {
  // static List<ContentPointHistory> listHistory;
  static List<PersonModel> listHistory = [
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),
    PersonModel(
        name: "10 Tips Mudah Menjaga Kesehatan Janin Dalam Kandungan",
        phoneNumber: "085939249774"),

  ];
  static bool? isEndOfPage;
  static bool? reloadExpiry;
  final String? type;

   TabBarCalendarPage({Key? key, this.type}) : super(key: key);

  @override
  _TabBarCalendarPageState createState() => _TabBarCalendarPageState();
}

class _TabBarCalendarPageState extends State<TabBarCalendarPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.type == 'expiry' ? 1 : 0);
    TabBarCalendarPage.reloadExpiry = true;
    TabBarCalendarPage.listHistory = [];
    super.initState();
  }

  @override
  void dispose() {
    TabBarCalendarPage.reloadExpiry = true;
    TabBarCalendarPage.listHistory = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 75),
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.only(top: 20, bottom: 18),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: EpregnancyColors.primer),
                    insets: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                  ),
                  tabs: const [
                    Tab(
                      text: "Acara Umum",
                    ),
                    Tab(text: "Acara Saya"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 9.5,
                    //   color:Colors.grey.shade200,
                    // ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TabBarView(
                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children:  [
                              ListCalendarWidget(tipeAcara: 'Acara umum' ,),
                              ListCalendarWidget(tipeAcara: 'Acara Saya',),
                              // AcaraUmumPage(),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

}
