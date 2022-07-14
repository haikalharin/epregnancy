
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/list_calendar.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

import '../../data/model/article_model/article_model.dart';
import '../../data/model/person_model/person_model.dart';
import '../../utils/epragnancy_color.dart';
import 'list_article_vertical.dart';

class TabBarArticlePage extends StatefulWidget {
  // static List<ContentPointHistory> listHistory;
  List<ArticleModel>? listArticle = [];
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
   String? type;

   TabBarArticlePage({Key? key, this.listArticle}) : super(key: key);

  @override
  _TabBarArticlePageState createState() => _TabBarArticlePageState();
}

class _TabBarArticlePageState extends State<TabBarArticlePage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: 3, vsync: this, initialIndex: widget.type == 'expiry' ? 1 : 0);
    TabBarArticlePage.reloadExpiry = true;
    TabBarArticlePage.listHistory = [];
    super.initState();
  }

  @override
  void dispose() {
    TabBarArticlePage.reloadExpiry = true;
    TabBarArticlePage.listHistory = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                // constraints: BoxConstraints.expand(height: 75),
                color: Colors.white,
                child: Center(
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    labelColor: EpregnancyColors.primer,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: EdgeInsets.only(top: 20, bottom: 18),
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 3.0,
                          color: EpregnancyColors.primer),
                      insets: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                    ),
                    tabs:  [
                      Container(
                        margin:EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        child: Tab(
                          text: "Kehamilan",
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        child: Tab(
                          text: "Tidak Hamil",
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        child: Tab(
                          text: "Memiliki Bayi",
                        ),
                      ),

                    ],
                  ),
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
                        // margin: EdgeInsets.only(top: 20),
                        child: TabBarView(
                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children:  [
                              ListArticleVertical(condition: StringConstant.pregnant,),
                              ListArticleVertical(condition: StringConstant.notPregnant,),
                              ListArticleVertical(condition: StringConstant.postMaternity,),
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
