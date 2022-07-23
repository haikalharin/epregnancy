
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/list_event.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

import '../../data/model/person_model/person_model.dart';
import '../../utils/epragnancy_color.dart';
import 'acara_umum_page.dart';

class TabBarEventPage extends StatefulWidget {
  // static List<ContentPointHistory> listHistory;

  static bool? isEndOfPage;
  static bool? reloadExpiry;
  final String? type;
  TabController? tabController;
  final DateTime? dateTime;

   TabBarEventPage({Key? key, this.type, this.tabController, this.dateTime}) : super(key: key);

  @override
  _TabBarEventPageState createState() => _TabBarEventPageState();
}

class _TabBarEventPageState extends State<TabBarEventPage>
    with TickerProviderStateMixin {


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {

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
                  controller:  widget.tabController,
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
                            controller:  widget.tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children:  [
                              ListEventWidget(tipeAcara: StringConstant.typeEventJadwalUmum,dateTime: widget.dateTime,),
                              ListEventWidget(tipeAcara: StringConstant.typeEventJadwalPribadi,dateTime: widget.dateTime,),
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
