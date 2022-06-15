import 'package:PregnancyApp/pages/example_dashboard_chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  // final UserModel bottomUserModelData;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexSelected = 0;

  // _BottomNavState(UserModel bottomUserModelData);

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorit",
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Konsultasi",
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Akun",
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                  placeholder: AssetImage('assets/logo_flikchat.png'),
                  image:
                  AssetImage('assets/logo_flikchat.png'),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/logo_flikchat.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
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
        return LoginExamplePage();
      case 2:
        return  Dashboard();
      case 3:
        return  HomePage();
      default:
        return Container();
    }
  }
}
