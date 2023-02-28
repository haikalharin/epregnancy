import 'package:PregnancyApp/pages/consultation_page/bloc/comment_bloc.dart';
import 'package:PregnancyApp/pages/disclaimer_page/bloc/disclaimer_page_bloc.dart';
import 'package:PregnancyApp/pages/event_page/bloc/patient_select_bloc.dart';
import 'package:PregnancyApp/utils/countly_analytics.dart';
import 'package:PregnancyApp/utils/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'flavors.dart';

// void main() {
//   F.appFlavor = Flavor.DEVELOPMENT;
//   runApp(App());
// }

import 'dart:io';

import 'package:PregnancyApp/env.dart';
import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/change_password_page/bloc/change_password_bloc.dart';
import 'package:PregnancyApp/pages/consultation_page/bloc/consultation_page_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/email_verification_page/email_verification_page.dart';
import 'package:PregnancyApp/pages/event_page/add_event_page.dart';
import 'package:PregnancyApp/pages/event_page/bloc/event_page_bloc.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import 'package:PregnancyApp/pages/forgot_password_page/bloc/forgot_password_page_bloc.dart';
import 'package:PregnancyApp/pages/games_page/bloc/games_bloc.dart';
import 'package:PregnancyApp/pages/games_page/bloc/games_bloc.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/landing_page/bloc/landing_page_bloc.dart';
import 'package:PregnancyApp/pages/landing_page/landing_page.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/navbar_page/bottom_nav.dart';
import 'package:PregnancyApp/pages/otp_page/bloc/otp_page_bloc.dart';
import 'package:PregnancyApp/pages/otp_page/otp_page.dart';
import 'package:PregnancyApp/pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import 'package:PregnancyApp/pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/poin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/point_history_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/point_history_bloc.dart';
import 'package:PregnancyApp/pages/profile_page/bloc/profile_page_bloc.dart';
import 'package:PregnancyApp/pages/signup_page/bloc/signup_bloc.dart';
import 'package:PregnancyApp/pages/signup_page/signup_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/signup_questionnaire_page_2.dart';
import 'package:PregnancyApp/pages/splashscreen_page/bloc/splash_screen_bloc.dart';
import 'package:PregnancyApp/pages/splashscreen_page/splashscreen_page.dart';
import 'package:PregnancyApp/pages/survey_page/bloc/survey_page_bloc.dart';
import 'package:PregnancyApp/routes/routes.dart';
import 'package:encrypt/encrypt.dart' as aes;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'common/configurations/configurations.dart';
import 'common/injector/injector.dart';
import 'common/injector/injector_config.dart';
import 'env.dart' as config;
import 'pages/login_page/bloc/login_bloc.dart';
import 'pages/login_page/login_page.dart';
import 'utils/firebase_analytics.dart';
import 'utils/simple_bloc_observer.dart';
import 'package:flutter_alice/alice.dart';

// void main() => runApp(MyApp());
SharedPreferences? sharedPreferences;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
FirebaseService firebaseService = FirebaseService();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.PRODUCTION;
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await Firebase.initializeApp();
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = SimpleBlocObserver();
  await Configurations().setConfigurationValues(config.environment);
  runApp(MyApp());
}

final Alice aliceProd = Alice(
    showNotification: false,
    darkTheme: true);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _firebaseFuture;

  @override
  void initState() {
    super.initState();
    CountlyAnalyticsService(context).setInitCountly();
    _firebaseFuture = firebaseService
        .initializeFlutterFirebase(context);

  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Future.wait([_firebaseFuture]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return  ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MultiBlocProvider(
                  providers: _getProviders(),
                  child: OverlaySupport.global(
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      navigatorKey: aliceProd.getNavigatorKey(),
                      navigatorObservers: <NavigatorObserver>[FirebaseAnalyticsService.observer],
                      title: 'Komunitaz',
                      home: SplashscreenPage(),
                      onGenerateRoute: Routes.generateRoute,
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                    ),
                  ));
            });
      },
    );
  }

  List<BlocProvider> _getProviders() => [
    BlocProvider<LoginExampleBloc>(
        create: (context) =>
            Injector.container.resolve<LoginExampleBloc>()),
    BlocProvider<SignupBloc>(
        create: (context) => Injector.container.resolve<SignupBloc>()),
    BlocProvider<LoginBloc>(
        create: (context) => Injector.container.resolve<LoginBloc>()),
    BlocProvider<HomePageBloc>(
        create: (context) => Injector.container.resolve<HomePageBloc>()),
    BlocProvider<SurveyPageBloc>(
        create: (context) => Injector.container.resolve<SurveyPageBloc>()),
    BlocProvider<ArticlePageBloc>(
        create: (context) => Injector.container.resolve<ArticlePageBloc>()),
    BlocProvider<SignUpQuestionnaireBloc>(
        create: (context) =>
            Injector.container.resolve<SignUpQuestionnaireBloc>()),
    BlocProvider<SplashscreenBloc>(
        create: (context) =>
            Injector.container.resolve<SplashscreenBloc>()),
    BlocProvider<EventPageBloc>(
        create: (context) => Injector.container.resolve<EventPageBloc>()),
    BlocProvider<PoinBloc>(
        create: (context) => Injector.container.resolve<PoinBloc>()),
    BlocProvider<PointHistoryBloc>(
        create: (context) =>
            Injector.container.resolve<PointHistoryBloc>()),
    BlocProvider<GamesBloc>(
        create: (context) => Injector.container.resolve<GamesBloc>()),
    BlocProvider<OtpPageBloc>(
        create: (context) => Injector.container.resolve<OtpPageBloc>()),
    BlocProvider<LandingPageBloc>(
        create: (context) => Injector.container.resolve<LandingPageBloc>()),
    BlocProvider<ConsultationPageBloc>(
        create: (context) => Injector.container.resolve<ConsultationPageBloc>()),
    BlocProvider<ChangePasswordBloc>(
        create: (context) => Injector.container.resolve<ChangePasswordBloc>()),
    BlocProvider<ChatBloc>(
        create: (context) => Injector.container.resolve<ChatBloc>()),
    BlocProvider<ConsultationPageBloc>(
        create: (context) =>
            Injector.container.resolve<ConsultationPageBloc>()),
    BlocProvider<HospitalBloc>(
        create: (context) => Injector.container.resolve<HospitalBloc>()),
    BlocProvider<ChatPendingBloc>(
        create: (context) => Injector.container.resolve<ChatPendingBloc>()),
    BlocProvider<ProfilePageBloc>(
        create: (context) => Injector.container.resolve<ProfilePageBloc>()),

    BlocProvider<ForgotPasswordPageBloc>(
        create: (context) => Injector.container.resolve<ForgotPasswordPageBloc>()),
    BlocProvider<PinCheckInBloc>(
        create: (context) => Injector.container.resolve<PinCheckInBloc>()),
    BlocProvider<DisclaimerPageBloc>(
        create: (context) => Injector.container.resolve<DisclaimerPageBloc>()),
    BlocProvider<PatientSelectBloc>(
        create: (context) => Injector.container.resolve<PatientSelectBloc>()),
    BlocProvider<CommentBloc>(
        create: (context) => Injector.container.resolve<CommentBloc>()),
  ];
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

