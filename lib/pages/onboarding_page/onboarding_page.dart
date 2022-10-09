import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import '../../common/constants/router_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/shared_preference/app_shared_preference.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late Container materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: Container(
        decoration: BoxDecoration(
          color: EpregnancyColors.primerSoft,
          image: DecorationImage(
              image: AssetImage('assets/onboarding/onboarding_background.png'),
              fit: BoxFit.fill),
          border: Border.all(
            width: 0.0,
            color: EpregnancyColors.primerSoft,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 140.h,
            ),
            child: Image.asset('assets/onboarding/onboarding_1.png'),
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        decoration: BoxDecoration(
          color: EpregnancyColors.primerSoft,
          image: DecorationImage(
              image: AssetImage('assets/onboarding/onboarding_background.png'),
              fit: BoxFit.fill),
          border: Border.all(
            width: 0.0,
            color: EpregnancyColors.primerSoft,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 140.h,
            ),
            child: Image.asset('assets/onboarding/onboarding_2.png'),
          ),
        ),
      ),
    ),
    PageModel(
      widget: Container(
        decoration: BoxDecoration(
          color: EpregnancyColors.primerSoft,
          image: DecorationImage(
              image: AssetImage('assets/onboarding/onboarding_background.png'),
              fit: BoxFit.fill),
          border: Border.all(
            width: 0.0,
            color: EpregnancyColors.primerSoft,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 140.h,
            ),
            child: Image.asset('assets/onboarding/onboarding_3.png'),
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Container _skipButton({void Function(int)? setIndex}) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(right: 10),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(EpregnancyColors.blueDark),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () {
            if (setIndex != null && index != 2) {
              index = index + 1;
              setIndex(index);
            }
          },
          child: Center(
            child: Text(
              'Selanjutnya',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )),
    );
  }

  Container get _startButton {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(right: 10),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(EpregnancyColors.blueDark),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () async {
            await AppSharedPreference.setBool(AppSharedPreference.newInstall, true);
            Navigator.of(context).pushReplacementNamed(RouteName.login);
          },
          child: Center(
            child: Text(
              'Mulai Sekarang',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: EpregnancyColors.primerSoft,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, bottom: 10.h),
                      child: DotsIndicator(
                        dotsCount: pagesLength,
                        position: index.toDouble(),
                        decorator: DotsDecorator(
                          color: Colors.white
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _startButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
