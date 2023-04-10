import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/pages/audio_page/audio_main_page.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard_midwife.dart';
import 'package:PregnancyApp/pages/consultation_page/consultation_page.dart';
import 'package:PregnancyApp/pages/chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../data/firebase/event/event_user.dart';
import '../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/countly_analytics.dart';
import '../../utils/firebase_analytics.dart';
import '../../utils/string_constans.dart';
import '../event_page/add_event_page.dart';
import '../home_page/logout_page.dart';
import '../profile_page/profile_user_page/profile_user_page.dart';
import '../survey_page/survey_page.dart';

int indexBottomNavSelected = 0;
bool isChangeIndex = false;
int index = 0;

class NavbarPage extends StatefulWidget {
  String? role = StringConstant.patient;
  final int? initalIndex;
  final String? userId;
  final bool? isFromNotif;

  NavbarPage(
      {Key? key,
      this.role,
      this.initalIndex,
      this.userId,
      this.isFromNotif = false})
      : super(key: key);

  // final UserModel bottomUserModelData;

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> with TickerProviderStateMixin {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  BuildContext? myContext;
  TabController? controller;
  int indexSelected = 0;

  bool isFirst = true;
  int count = 1;

  @override
  void initState() {
    setIndex();

    super.initState();
  }

  void setIndex() async {
    UserModel _userModel = await AppSharedPreference.getUser();
    if (_userModel.isPregnant == true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _isFirstLaunch().then((result) {
          if (result) {
            ShowCaseWidget.of(myContext ?? context)
                .startShowCase([_one, _two, _three, _four, _five,_six]);
            ShowCaseWidget.of(myContext ?? context)
          .enableAutoScroll = true;
          }
        }).then((value) => (result){});
      });
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _isFirstLaunch().then((result) {
          if (result) {
            ShowCaseWidget.of(myContext ?? context)
                .startShowCase([_two, _five, _six]);
          }
        });
      });
    }
    setState(() {
      indexSelected = widget.initalIndex ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (indexSelected != indexBottomNavSelected && isChangeIndex) {
      setState(() {
        indexSelected = indexBottomNavSelected;
        isChangeIndex = false;
      });
    }
    return ShowCaseWidget(onFinish: () {
      setState(() {
        isFirst = false;
      });
    }, builder: Builder(builder: (context) {
      myContext = context;
      return WillPopScope(
        onWillPop: () async {

          if (widget.role == StringConstant.midwife) {
            return true;
          } else {
            bool? result = await _showMyDialog(context);
            result ??= false;
            return result;
          }
        },
        child: widget.role == StringConstant.midwife
            ? Scaffold(
                resizeToAvoidBottomInset: false,
                body: _buildWidgetBodyMidwife())
            : Scaffold(
                resizeToAvoidBottomInset: false,
                body: _buildWidgetBody(),
                bottomNavigationBar:
                    _bottomNavigatorBar(indexSelected: indexSelected),
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
      );
    }));
  }

  Widget _bottomNavigatorBar({int? indexSelected}) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      currentIndex: indexSelected ?? 0,
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
        BottomNavigationBarItem(
          label: " Audio ",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child:SvgPicture.asset(
                'assets/icMusic.svg',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          icon:Showcase.withWidget(
            key: _four,
            title: 'Audio',
            description:
            'Kumpulan audio Murotal untuk ibu dan bayi ',
            height: 100,
            width: 100,
            shapeBorder: const CircleBorder(),
            radius: const BorderRadius.all(Radius.circular(150)),
            container: null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child:SvgPicture.asset(
                'assets/icMusic.svg',
                width: 30,
                color: EpregnancyColors.greyDarkFontColor,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "Diskusi",
          activeIcon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SvgPicture.asset(
              'assets/ic_consultation_bar_selected.svg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          icon: Showcase.withWidget(
            key: _five,
            title: 'E-konsultasi dan Komunitas',
            description:
                'Komunikasikan dan diskusikan masalah, keluhan dan saran Anda dengan mudah kepada Profesional dan Komunitas',
            height: 100,
            width: 100,
            shapeBorder: const CircleBorder(),
            radius: const BorderRadius.all(Radius.circular(150)),
            container: null,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SvgPicture.asset(
                  'assets/ic_consultation_bar.svg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
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
          icon: Showcase.withWidget(
            key: _six,
            title: 'Profil dan Pengaturan',
            description:
                'Ubah foto, kata sandi dan atur profil kehamilan Anda dalam satu menu pengaturan',
            height: 100,
            width: 100,
            shapeBorder: const CircleBorder(),
            radius: const BorderRadius.all(Radius.circular(150)),
            container: null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: SvgPicture.asset(
                'assets/ic_profile_bar.svg',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
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
        FirebaseAnalyticsService().setCurrentScreen("home_page_user");
        CountlyAnalyticsService(context)
            .basicEvent({'key': 'home_page_user', 'count': 1});
        return HomePage(
          isFromNotif: widget.isFromNotif,
          userId: widget.userId,
          one: _one,
          two: _two,
          three: _three,
        );
      case 1:
        FirebaseAnalyticsService().setCurrentScreen("audio_page_user");
        CountlyAnalyticsService(context)
            .basicEvent({'key': 'audio_page_user', 'count': 1});
        return const AudioMainPage();
      case 2:
        // return AddEventPage();
        FirebaseAnalyticsService().setCurrentScreen("consultation_page_user");
        CountlyAnalyticsService(context)
            .basicEvent({'key': 'consultation_page_user', 'count': 1});
        return ConsultationPage(
          role: widget.role,
        );

      case 3:
        FirebaseAnalyticsService().setCurrentScreen("profile_page_user");
        CountlyAnalyticsService(context)
            .basicEvent({'key': 'profile_page_user', 'count': 1});
        return ProfileUserPage();
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
          label: "Diskusi",
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
        return DashboardMidwife(initialIndex: widget.initalIndex ?? 0);
      case 1:
        return DashboardMidwife(initialIndex: widget.initalIndex ?? 0);
      default:
        return Container();
    }
  }

  Future<bool?> _showMyDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda Yakin Ingin Keluar?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Tidak'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool? isFirstLaunch =
        await AppSharedPreference.getBool(AppSharedPreference.isFirstLaunch) ??
            true;
    //
    // if (isFirstLaunch) {
    //   sharedPreferences.setBool(
    //       AppSharedPreference.isFirstLaunch, false);
    // }
    // isFirst = isFirstLaunch;

    return isFirstLaunch;
  }
}
