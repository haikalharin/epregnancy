import 'package:PregnancyApp/pages/consultation_page/consultation_page.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page/logout_page.dart';
import '../survey_page/survey_page.dart';
int indexBottomNavSelected = 0;
bool isChangeIndex = false;

class NavbarPage extends StatefulWidget {
  int? arguments = 0;
   NavbarPage({Key? key, this.arguments}) : super(key: key);

  // final UserModel bottomUserModelData;

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage>  with TickerProviderStateMixin {
  TabController? controller ;

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    if( indexSelected != indexBottomNavSelected && isChangeIndex) {
     setState(() {
       indexSelected = indexBottomNavSelected;
       isChangeIndex = false;
     });

    }
    return Stack(children: [
      Scaffold(
        body: _buildWidgetBody(),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {},
        //     child: Image.asset('res/graphics/ic_order_40px.png')),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor:Colors.blue,
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
                  'assets/ic_home_bar.svg',
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
            BottomNavigationBarItem(
              label: "Favorit",
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child:SvgPicture.asset(
                    'assets/ic_favorit_bar.svg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child:SvgPicture.asset(
                  'assets/ic_favorit_bar.svg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Konsultasi",
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SvgPicture.asset(
                  'assets/ic_consultation_bar.svg',
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
                    'assets/ic_profile_bar.svg',
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
        ),
      ),
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
    ]);
  }

  Widget _buildWidgetBody() {
    switch (indexSelected) {
      case 0:
        return HomePage();
      case 1:
        return Dashboard();
      case 2:
        return ConsultationPage();
      case 3:
        return  LogoutPage();
      default:
        return Container();
    }
  }
}
