import 'dart:async';
import 'dart:ui';

import 'package:PregnancyApp/common/constants/bloc_providers.dart';
import 'package:PregnancyApp/utils/countly_analytics.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/firebase_analytics.dart';
import 'package:PregnancyApp/utils/firebase_service.dart';
import 'package:countly_flutter/countly_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:root_detector/root_detector.dart';
import 'flavors.dart';


import 'dart:io';

import 'package:PregnancyApp/pages/splashscreen_page/splashscreen_page.dart';
import 'package:PregnancyApp/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'common/configurations/configurations.dart';
import 'common/injector/injector_config.dart';
import 'env.dart' as config;
import 'package:flutter_alice/alice.dart';
import 'package:secure_content/secure_content.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
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
// final AudioPlayer playerDev = AudioPlayer();


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

  // final playlist = ConcatenatingAudioSource(children: [
  //   // AudioSource.uri(Uri.parse("assets/audio/al_fatihah.mp3"),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-fatihah.mp3"), tag: const MediaItem(
  //     title: 'Surat Al-Fatihah',
  //     id: "0",
  //     artist: "Surat Al-Fatihah",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-35.mp3"), tag: const MediaItem(
  //     title: 'Surat Al-Imran ayat 35',
  //     id: "1",
  //     artist: "Surat Al-Imran ayat 35",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-36.mp3"), tag: const MediaItem(
  //     title: 'Surat Al-Imran ayat 36',
  //     id: "2",
  //     artist: "Surat Al-Imran ayat 36",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-38.mp3"), tag: const MediaItem(
  //     title: 'Surat Al-Imran ayat 38',
  //     id: "3",
  //     artist: "Surat Al-Imran ayat 38",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-araf-54.mp3"), tag: const MediaItem(
  //     title: """Surat Al-A'raf ayat 54""",
  //     id: "4",
  //     artist: """Surat Al-A'raf ayat 54""",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-ibrahim-40.mp3"), tag: const MediaItem(
  //     title: 'Surat Ibrahim ayat 40',
  //     id: "5",
  //     artist: "Surat Ibrahim ayat 40",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-4-5.mp3"), tag: const MediaItem(
  //     title: 'Surat Maryam ayat 4-5',
  //     id: "6",
  //     artist: "Surat Maryam ayat 4-5",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-19-21.mp3"), tag: const MediaItem(
  //       title: 'Surat Maryam ayat 19-21.',
  //       id: "7",
  //       artist: "Surat Maryam ayat 19-21",
  //       album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-muminun-12-14.mp3"), tag: const MediaItem(
  //     title: """Surat Al-Mu'minun ayat 12-14""",
  //     id: "8",
  //     artist: "Surat Al-Mu'minun ayat 12-14",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-furqan-74.mp3"), tag: const MediaItem(
  //     title: 'Surat Al-Furqan ayat 74',
  //     id: "9",
  //     artist: "Surat Al-Furqan ayat 74",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-luqman-14.mp3"), tag: const MediaItem(
  //     title: 'Surat Luqman ayat 14',
  //     id: "10",
  //     artist: "Surat Luqman ayat 14",
  //     album: "Murottal",)),
  //   LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-as-saffat-100.mp3"), tag: const MediaItem(
  //     title: 'Surat As-Saffat ayat 100',
  //     id: "11",
  //     artist: "Surat As-Saffat ayat 100",
  //     album: "Murottal",)),
  //   // AudioSource.uri(Uri.parse("https://ia801408.us.archive.org/11/items/Raad-Al_Kurdi/001.mp3"),
  //   //     tag: MediaItem(
  //   //         title: 'Al-Fatihah',
  //   //         id: "1",
  //   //         artist: "Al-Fatihah",
  //   //         album: "Murottal",
  //   //         artUri: Uri.parse(
  //   //             "https://lh3.googleusercontent.com/-kxVDXfXqEXA/YVsZmqZ-GQI/AAAAAAABe1c/gY88VU3gT50-ww0zDs0oG5MzeZizDzd2QCLcBGAsYHQ/w1200-h630-p-k-no-nu/image.png")))
  // ]);

  // Future<void> _init() async {
  //   final session = await AudioSession.instance;
  //   await session.configure(const AudioSessionConfiguration.music());
  //   // Listen to errors during playback.
  //   playerDev.playbackEventStream.listen((event) {},
  //       onError: (Object e, StackTrace stackTrace) {
  //         print('A stream error occurred: $e');
  //       });
  //   try {
  //     await playerDev.setAudioSource(playlist);
  //   } catch (e, stackTrace) {
  //     // Catch load errors: 404, invalid url ...
  //     print("Error loading playlist: $e");
  //     print(stackTrace);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _init();
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
    _firebaseFuture = FirebaseService().initializeFlutterFirebase(context);
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
                  providers: getProviders(),
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
