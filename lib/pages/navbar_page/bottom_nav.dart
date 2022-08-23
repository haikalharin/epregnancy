import 'package:PregnancyApp/pages/chat_page/dashboard_midwife.dart';
import 'package:PregnancyApp/pages/consultation_page/consultation_page.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/firebase/event/event_user.dart';
import '../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/string_constans.dart';
import '../event_page/add_event_page.dart';
import '../home_page/logout_page.dart';
import '../survey_page/survey_page.dart';

int indexBottomNavSelected = 0;
bool isChangeIndex = false;

class NavbarPage extends StatefulWidget {
  String? role = StringConstant.patient;
  NavbarPage({Key? key, this.role}) : super(key: key);

  // final UserModel bottomUserModelData;

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> with TickerProviderStateMixin {
  TabController? controller;
  int indexSelected = 0;




  @override
  Widget build(BuildContext context) {
    if (indexSelected != indexBottomNavSelected && isChangeIndex) {
      setState(() {
        indexSelected = indexBottomNavSelected;
        isChangeIndex = false;
      });
    }
    return Stack(children: [
      widget.role == StringConstant.midwife
          ? Scaffold(
        resizeToAvoidBottomInset: false,
          body: _buildWidgetBodyMidwife(),
          bottomNavigationBar: _bottomNavigatorBarMidwife()) :
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildWidgetBody(),
        bottomNavigationBar: _bottomNavigatorBar(),
      )
      ,
      // Positioned.fill(
      //     bottom: 20,
      //     child: Align(
      //       alignment: Alignment.bottomCenter,
      //       child: FloatingActionButton(
      //           onPressed: () {
      //             Navigator.push(context, MaterialPageRoute(
      //               builder: (context) {
      //                 return SettingPage();
      //               },
      //             ));
      //           },
      //           child: Image.asset('res/graphics/ic_order_40px.png')),
      //     ))
    ]
    );
  }

  Widget _bottomNavigatorBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      currentIndex: indexSelected,
      onTap: (indexSelected) {
        setState(() {
          this.indexSelected = indexSelected;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: "Beranda",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_home_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_home_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // BottomNavigationBarItem(
        //   label: "Favorit",
        //   activeIcon: ClipRRect(
        //     borderRadius: BorderRadius.circular(0),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(0),
        //       child:SvgPicture.asset(
        //         'assets/ic_favorit_bar.svg',
        //         width: 30,
        //         height: 30,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        //   icon: ClipRRect(
        //     borderRadius: BorderRadius.circular(0),
        //     child:SvgPicture.asset(
        //       'assets/ic_favorit_bar.svg',
        //       width: 30,
        //       height: 30,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        BottomNavigationBarItem(
          label: "Konsultasi",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_consultation_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_consultation_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "Akun",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_profile_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_profile_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // BottomNavigationBarItem(
        //   label: "Pengaturan",
        //   icon: Icon(Icons.settings),
        // ),
//          BottomNavigationBarItem(
//            label: "Collection",
//            icon: Icon(Icons.list_alt),
//          ),
//          BottomNavigationBarItem(
//            label: "Akun",
//            icon: Icon(Icons.settings),
//          ),
      ],
    );
  }

  Widget _buildWidgetBody() {
    switch (indexSelected) {
      case 0:
        return HomePage();
      case 1:
        // return AddEventPage();
        return ConsultationPage();

      case 2:
        return LogoutPage();
      default:
        return Container();
    }
  }

  Widget _bottomNavigatorBarMidwife() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      currentIndex: indexSelected,
      onTap: (indexSelected) {
        setState(() {
          this.indexSelected = indexSelected;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: "Konsultasi",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_consultation_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_consultation_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "Akun",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_profile_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_profile_bar.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // BottomNavigationBarItem(
        //   label: "Pengaturan",
        //   icon: Icon(Icons.settings),
        // ),
//          BottomNavigationBarItem(
//            label: "Collection",
//            icon: Icon(Icons.list_alt),
//          ),
//          BottomNavigationBarItem(
//            label: "Akun",
//            icon: Icon(Icons.settings),
//          ),
      ],
    );
  }

  Widget _buildWidgetBodyMidwife() {
    switch (indexSelected) {
      case 0:
        return DashboardMidwife();
      case 1:
        return LogoutPage();
      default:
        return Container();
    }
  }
}
