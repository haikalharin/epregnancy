import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/utils/web_socket_chat_channel.dart';
import 'package:audio_session/audio_session.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../main_development.dart' as dev;
import 'bloc/splash_screen_bloc.dart';
import 'package:intl/intl_standalone.dart';

late final FirebaseRemoteConfig remoteConfig;
final playlist = ConcatenatingAudioSource(children: [
  // AudioSource.uri(Uri.parse("assets/audio/al_fatihah.mp3"),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-fatihah.mp3"), tag: const MediaItem(
    title: 'Surat Al-Fatihah',
    id: "0",
    artist: "Surat Al-Fatihah",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-35.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 35',
    id: "1",
    artist: "Surat Al-Imran ayat 35",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-36.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 36',
    id: "2",
    artist: "Surat Al-Imran ayat 36",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-38.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 38',
    id: "3",
    artist: "Surat Al-Imran ayat 38",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-araf-54.mp3"), tag: const MediaItem(
    title: """Surat Al-A'raf ayat 54""",
    id: "4",
    artist: """Surat Al-A'raf ayat 54""",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-ibrahim-40.mp3"), tag: const MediaItem(
    title: 'Surat Ibrahim ayat 40',
    id: "5",
    artist: "Surat Ibrahim ayat 40",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-4-5.mp3"), tag: const MediaItem(
    title: 'Surat Maryam ayat 4-5',
    id: "6",
    artist: "Surat Maryam ayat 4-5",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-19-21.mp3"), tag: const MediaItem(
    title: 'Surat Maryam ayat 19-21.',
    id: "7",
    artist: "Surat Maryam ayat 19-21",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-muminun-12-14.mp3"), tag: const MediaItem(
    title: """Surat Al-Mu'minun ayat 12-14""",
    id: "8",
    artist: "Surat Al-Mu'minun ayat 12-14",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-furqan-74.mp3"), tag: const MediaItem(
    title: 'Surat Al-Furqan ayat 74',
    id: "9",
    artist: "Surat Al-Furqan ayat 74",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-luqman-14.mp3"), tag: const MediaItem(
    title: 'Surat Luqman ayat 14',
    id: "10",
    artist: "Surat Luqman ayat 14",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-as-saffat-100.mp3"), tag: const MediaItem(
    title: 'Surat As-Saffat ayat 100',
    id: "11",
    artist: "Surat As-Saffat ayat 100",
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

final playlistMusic = ConcatenatingAudioSource(children: [
  // AudioSource.uri(Uri.parse("assets/audio/al_fatihah.mp3"),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/first-love.wav"), tag: const MediaItem(
    title: 'First Love',
    id: "0",
    artist: "First Love",
    album: "Musik Kehamilan",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-35.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 35',
    id: "1",
    artist: "Surat Al-Imran ayat 35",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-36.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 36',
    id: "2",
    artist: "Surat Al-Imran ayat 36",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-imran-38.mp3"), tag: const MediaItem(
    title: 'Surat Al-Imran ayat 38',
    id: "3",
    artist: "Surat Al-Imran ayat 38",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-araf-54.mp3"), tag: const MediaItem(
    title: """Surat Al-A'raf ayat 54""",
    id: "4",
    artist: """Surat Al-A'raf ayat 54""",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-ibrahim-40.mp3"), tag: const MediaItem(
    title: 'Surat Ibrahim ayat 40',
    id: "5",
    artist: "Surat Ibrahim ayat 40",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-4-5.mp3"), tag: const MediaItem(
    title: 'Surat Maryam ayat 4-5',
    id: "6",
    artist: "Surat Maryam ayat 4-5",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-maryam-19-21.mp3"), tag: const MediaItem(
    title: 'Surat Maryam ayat 19-21.',
    id: "7",
    artist: "Surat Maryam ayat 19-21",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-muminun-12-14.mp3"), tag: const MediaItem(
    title: """Surat Al-Mu'minun ayat 12-14""",
    id: "8",
    artist: "Surat Al-Mu'minun ayat 12-14",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-al-furqan-74.mp3"), tag: const MediaItem(
    title: 'Surat Al-Furqan ayat 74',
    id: "9",
    artist: "Surat Al-Furqan ayat 74",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-luqman-14.mp3"), tag: const MediaItem(
    title: 'Surat Luqman ayat 14',
    id: "10",
    artist: "Surat Luqman ayat 14",
    album: "Murottal",)),
  LockCachingAudioSource(Uri.parse("https://igbeyewo.allianz.co.id/di/epregnancy/api/stream/musics/surat-as-saffat-100.mp3"), tag: const MediaItem(
    title: 'Surat As-Saffat ayat 100',
    id: "11",
    artist: "Surat As-Saffat ayat 100",
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

final AudioPlayer playerDev = AudioPlayer();


class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  bool? skipOnboarding = false;
  static FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  bool _isLoading = true;
  late Color _color;
  // final Alice _alice = Alice(
  //     showNotification: true,
  //     darkTheme: false);

  void getFirstInstall() async{
    bool? _skipOnboarding = await AppSharedPreference.getBool(AppSharedPreference.newInstall);
    setState(() {
      skipOnboarding = _skipOnboarding;
      // _alice.showInspector();
    });
    print('skip onboarding : $skipOnboarding');
  }

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      print("update info : $info");
      if(info.updateAvailability == UpdateAvailability.updateAvailable){
        InAppUpdate.performImmediateUpdate();
      }
    }).catchError((e) {
      print("Error Perform Auto Update : $e");
    });
  }


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
    _init();
    playerDev.setLoopMode(LoopMode.all);
    getFirstInstall();
    Injector.resolve<SplashscreenBloc>().add(SplashscreenCheckUserExist());
    _initializeRemoteConfig();
    checkForUpdate();
    super.initState();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      await _remoteConfig.fetch();
      await _remoteConfig.activate();

      print('Last fetch status: ' + _remoteConfig.lastFetchStatus.toString());
      print('Last fetch time: ' + _remoteConfig.lastFetchTime.toString());
      print('New color enabled?: ' + _remoteConfig.getBool('new_color_enabled').toString());

      setState(() {
        remoteConfig = _remoteConfig;
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }

  }

  _initializeRemoteConfig() async {
    if (_remoteConfig == null) {
      _remoteConfig = await RemoteConfig.instance;

      final Map<String, dynamic> defaults = <String, dynamic>{
        'new_color_enabled': false
      };
      await _remoteConfig.setDefaults(defaults);

      _remoteConfig.setConfigSettings(RemoteConfigSettings(
       fetchTimeout:  Duration(milliseconds: 1), minimumFetchInterval: Duration(milliseconds: 1),
      ));

      await _fetchRemoteConfig();
    }



    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashscreenBloc, SplashscreenState>(
      listener: (context, state) async {
      if (state.submitStatus == FormzStatus.submissionSuccess) {
        if(state.isExist){
          // Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: state.role!.role);
          // todo handel login from API
          print('role splash : ${state.role}');
          if(state.role == 'MIDWIFE' || state.userModel?.isPatient == false) {
            HospitalModel _hospital = await AppSharedPreference.getHospital();
            Navigator.of(context).pushReplacementNamed(
                RouteName.dashboardNakesPage,
                arguments: {'name': state.userModel?.name, 'hospital_id': _hospital.id, 'image_url': state.userModel?.imageUrl}
            );
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.navBar,arguments: {'role': state.role, 'inital_index': 0, 'user_id':state.userModel?.id ??''});
          }
        } else{
          if(skipOnboarding == false || skipOnboarding == null){
            Navigator.of(context).pushReplacementNamed(RouteName.onboarding);
          } else {
            Navigator.of(context).pushReplacementNamed(RouteName.login, arguments: {'token_expired': false, 'is_from_register': false});
          }
        }
      }
      },
      child: BlocBuilder<SplashscreenBloc, SplashscreenState>(
        builder: (context, state) {
          return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/splashscreen.png", fit: BoxFit.fill),
              )
          );
        },
      ),
    );
  }
}
