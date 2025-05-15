import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/landing_page/slider_modal.dart';
import 'package:PregnancyApp/pages/landing_page/widget/slider_list.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../common/injector/injector.dart';
import '../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../main_default.dart';
import '../../utils/string_constans.dart';
import '../login_page/login_page.dart';
import '../navbar_page/bottom_nav.dart';
import 'bloc/landing_page_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<SliderModal> slides = [];

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = SliderModal().getAllSliders();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LandingPageBloc, LandingPageState>(
        listener: (context, state) {
          if (state.submitStatus == FormzStatus.submissionFailure) {
            const snackBar =
            SnackBar(content: Text("failed"), backgroundColor: Colors.red);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.submitStatus == FormzStatus.submissionSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage(
                    tokenExpired: true, isFromRegister: true),
              ),
                  (route) => false,
            );
          }
        },
        child: BlocBuilder<LandingPageBloc, LandingPageState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemCount: slides.length,
                        itemBuilder: (context, index) {
                          return SliderList(
                            image: slides[index].getImage(),
                            title: slides[index].getTitle(),
                            description: slides[index].getDescription(),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          slides.length,
                              (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.all(40),
                      width: double.infinity,
                      color: EpregnancyColors.primer,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: EpregnancyColors.primer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          currentIndex == slides.length - 1
                              ? "Mulai Sekarang"
                              : "Selanjutnya",
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (currentIndex == slides.length - 1) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const LoginPage(
                                      tokenExpired: true,
                                      isFromRegister: true)),
                                  (route) => false,
                            );
                          } else {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const _Loading(),
              ],
            );
          },
        ),
      ),
      backgroundColor: EpregnancyColors.primerSoft,
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: EpregnancyColors.primer,
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageBloc, LandingPageState>(
      builder: (context, state) {
        if (state.submitStatus == FormzStatus.submissionInProgress) {
          return Container(
            color: Colors.white.withAlpha(90),
            child: const Center(child: CircularProgressIndicator()),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
