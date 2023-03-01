import 'dart:async';
import 'dart:ui';

import 'package:PregnancyApp/pages/consultation_page/bloc/comment_bloc.dart';
import 'package:PregnancyApp/pages/consultation_page/bloc/comment_bloc.dart';
import 'package:PregnancyApp/pages/disclaimer_page/bloc/disclaimer_page_bloc.dart';
import 'package:PregnancyApp/pages/event_page/bloc/patient_select_bloc.dart';
import 'package:PregnancyApp/utils/countly_analytics.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/firebase_analytics.dart';
import 'package:PregnancyApp/utils/firebase_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:countly_flutter/countly_flutter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:root_detector/root_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'flavors.dart';

// void main() {
//   F.appFlavor = Flavor.DEVELOPMENT;
//   runApp(App());
// }

import 'dart:io';

import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/change_password_page/bloc/change_password_bloc.dart';
import 'package:PregnancyApp/pages/consultation_page/bloc/consultation_page_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/event_page/bloc/event_page_bloc.dart';
import 'package:PregnancyApp/pages/example_dashboard_chat_page/login_example_page/bloc/login_example_bloc.dart';
import 'package:PregnancyApp/pages/forgot_password_page/bloc/forgot_password_page_bloc.dart';
import 'package:PregnancyApp/pages/games_page/bloc/games_bloc.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/landing_page/bloc/landing_page_bloc.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/otp_page/bloc/otp_page_bloc.dart';
import 'package:PregnancyApp/pages/pin_checkin/bloc/pin_checkin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/poin_bloc.dart';
import 'package:PregnancyApp/pages/poin_page/bloc/point_history_bloc.dart';
import 'package:PregnancyApp/pages/profile_page/bloc/profile_page_bloc.dart';
import 'package:PregnancyApp/pages/signup_page/bloc/signup_bloc.dart';
import 'package:PregnancyApp/pages/signup_questionnaire_page/bloc/signup_questionnaire_bloc.dart';
import 'package:PregnancyApp/pages/splashscreen_page/bloc/splash_screen_bloc.dart';
import 'package:PregnancyApp/pages/splashscreen_page/splashscreen_page.dart';
import 'package:PregnancyApp/pages/survey_page/bloc/survey_page_bloc.dart';
import 'package:PregnancyApp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:flutter_alice/alice.dart';
import 'package:secure_content/secure_content.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());
SharedPreferences? sharedPreferences;
FirebaseService firebaseServiceUtils = FirebaseService();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.DEVELOPMENT;
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await Firebase.initializeApp();
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = SimpleBlocObserver();
  await Configurations().setConfigurationValues(config.devEnvironment);
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  }, Countly.recordDartError);

}

final Alice aliceDev = Alice(showNotification: true, darkTheme: true);
final AudioPlayer playerDev = AudioPlayer();


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _firebaseFuture;


  // final playlist =
  //     ConcatenatingAudioSource(useLazyPreparation: true, children: [
  //   AudioSource.asset("assets/audio/al_fatihah.mp3",
  //       tag: const MediaItem(title: 'Al-Fatihah', id: "1", album: "Murottal"))
  // ]);

  final playlist = ConcatenatingAudioSource(children: [
    // AudioSource.uri(Uri.parse("assets/audio/al_fatihah.mp3"),
    LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-19-21.mp3"), tag: const MediaItem(
        title: 'Surat-Maryam-19-21.',
        id: "0",
        artist: "Surat-Maryam-19-21",
        album: "Murottal",)),
    LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-4-5.mp3"), tag: const MediaItem(
      title: 'Surat-Maryam-4-5.',
      id: "1",
      artist: "Surat-Maryam-4-5",
      album: "Murottal",)),
    LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-4-5.mp3"), tag: const MediaItem(
      title: 'Surat-Maryam-4-5.',
      id: "1",
      artist: "Surat-Maryam-4-5",
      album: "Murottal",)),
    // AudioSource.uri(Uri.parse("https://ia801408.us.archive.org/11/items/Raad-Al_Kurdi/001.mp3"),
    //     tag: MediaItem(
    //         title: 'Al-Fatihah',
    //         id: "1",
    //         artist: "Al-Fatihah",
    //         album: "Murottal",
    //         artUri: Uri.parse(
    //             "https://lh3.googleusercontent.com/-kxVDXfXqEXA/YVsZmqZ-GQI/AAAAAAABe1c/gY88VU3gT50-ww0zDs0oG5MzeZizDzd2QCLcBGAsYHQ/w1200-h630-p-k-no-nu/image.png")))
  ]);

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    // Listen to errors during playback.
    playerDev.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    try {
      await playerDev.setAudioSource(playlist);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
    initPlatformState();
    // MyButton(text: 'Get Device Id Type', color: 'green', onPressed: getDeviceIDType),
    // MyButton(text: 'Begin Session', color: 'green', onPressed: beginSession),
    // MyButton(text: 'Update Session', color: 'green', onPressed: updateSession),
    CountlyAnalyticsService(context).setInitCountly();
    CountlyAnalyticsService(context).setDeviceIDType();
    playerDev.setLoopMode(LoopMode.all);
    // playerDev.setAsset("assets/audio/al_fatihah.mp3");
    // // playerDev.setAudioSource(playlist,
    // //     initialIndex: 0, initialPosition: Duration.zero);
    _firebaseFuture = firebaseServiceUtils.initializeFlutterFirebase(context);
  }

  String _isRooted = 'Unknown';

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await RootDetector.isRooted(
        busyBox: true,
        ignoreSimulator: true,
      ).then((value) {
        setState(() {
          _isRooted = value.toString();
          if (_isRooted == "true") {
            exit(0);
          }
        });
      });
    } on PlatformException {
      setState(() {
        _isRooted = 'Failed to get root status.';
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  final RouteObserver<PageRoute> _routeObserver = RouteObserver();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_firebaseFuture]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MultiBlocProvider(
                  providers: _getProviders(),
                  child: OverlaySupport.global(
                    child: Portal(
                        child: Provider.value(
                      value: _routeObserver,
                      child: SecureWidget(
                        isSecure: false,
                        builder: (BuildContext context, void Function() onInit,
                            void Function() onDispose) {
                          return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            navigatorKey: aliceDev.getNavigatorKey(),
                            title: 'Komunitaz',
                            home: SplashscreenPage(),
                            onGenerateRoute: Routes.generateRoute,
                            navigatorObservers: <NavigatorObserver>[FirebaseAnalyticsService.observer],
                            localizationsDelegates: const [
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                          );
                        },
                        overlayWidgetBuilder: (context) => BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: SizedBox(
                            child: Center(
                              child: Image.asset("assets/ic_launcher.png"),
                            ),
                          ),
                        ),
                        appSwitcherMenuColor: EpregnancyColors.primer,
                        protectInAppSwitcherMenu: true,
                      ),
                      // child: MaterialApp(
                      //   debugShowCheckedModeBanner: false,
                      //   navigatorKey: aliceDev.getNavigatorKey(),
                      //   title: 'Komunitaz',
                      //   home: SplashscreenPage(),
                      //   onGenerateRoute: Routes.generateRoute,
                      //   localizationsDelegates: const [
                      //     GlobalMaterialLocalizations.delegate,
                      //     GlobalWidgetsLocalizations.delegate,
                      //     GlobalCupertinoLocalizations.delegate,
                      //   ],
                      // ),
                    )),
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
            create: (context) =>
                Injector.container.resolve<ConsultationPageBloc>()),
        BlocProvider<ChangePasswordBloc>(
            create: (context) =>
                Injector.container.resolve<ChangePasswordBloc>()),
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
            create: (context) =>
                Injector.container.resolve<ForgotPasswordPageBloc>()),
        BlocProvider<PinCheckInBloc>(
            create: (context) => Injector.container.resolve<PinCheckInBloc>()),
        BlocProvider<DisclaimerPageBloc>(
            create: (context) =>
                Injector.container.resolve<DisclaimerPageBloc>()),
        BlocProvider<PatientSelectBloc>(
            create: (context) =>
                Injector.container.resolve<PatientSelectBloc>()),
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
