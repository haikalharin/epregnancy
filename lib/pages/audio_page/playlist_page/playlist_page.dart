import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/audio_page/audio_player_page/audio_player_page.dart';
import 'package:PregnancyApp/pages/audio_page/widgets/item_playlist.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../../common/constants/router_constants.dart';
import '../../../common/injector/injector.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../main_development.dart';
import '../../../utils/epragnancy_color.dart';
import '../../splashscreen_page/splashscreen_page.dart';
import '../bloc/audio_bloc.dart';
import '../widgets/bottom_sheet_player.dart';
import '../widgets/music_card.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BtnBackIosStyle(),
        title: Text(
          "Murottal",
          maxLines: 3,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [EpregnancyColors.primerSoft2, Colors.white, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: 'img-banner',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.w),
                    child: Image.asset("assets/music_murottal.png"),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Menyejukan, menenangkan hati dan mengajak bayi untuk lebih dekat dengan nasihat Allah dalam Al-Quran",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      if(playerDev.shuffleModeEnabled){
                        playerDev.setShuffleModeEnabled(false);
                        setState(() {
                          shuffleActive = false;
                        });
                      } else {
                        playerDev.setShuffleModeEnabled(true);
                        setState(() {
                          shuffleActive = true;
                        });
                      }
                      // playerDev.shuffle();
                      // playerDev.play();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(13.w),
                      child: SvgPicture.asset('assets/icShuffle.svg', color: shuffleActive ? EpregnancyColors.primer : EpregnancyColors.black,),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  BlocBuilder<AudioBloc, AudioState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            if(playerDev.playing){
                              playerDev.pause();
                            } else {
                              if(state.currentPlaylist == "Murottal"){
                                playerDev.play();
                              } else {
                                Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Murottal"));
                                await playerDev.setAudioSource(playlist);
                                await playerDev.seek(Duration.zero, index: 0);
                                playerDev.play();
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(13.w),
                            decoration: BoxDecoration(
                                color: EpregnancyColors.primerSoft2,
                                borderRadius: BorderRadius.circular(8.w)),
                            child: Center(
                              child: playerDev.playing ? SvgPicture.asset(
                                'assets/icPause.svg',
                                color: EpregnancyColors.primer,
                              ) : SvgPicture.asset(
                                'assets/icPlay.svg',
                                color: EpregnancyColors.primer,
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  ItemPlayList(title: "Surat Al-Fatihah", index: 0, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Al-Imran ayat 35", index: 1, playlist: "Murottal",),
                  ItemPlayList(title: "Surat Al-Imran ayat 36", index: 2, playlist: "Murottal",),
                  ItemPlayList(title: "Surat Al-Imran ayat 38", index: 3, playlist: "Murottal",),
                  ItemPlayList(title: """Surat Al-A'raf ayat 54""", index: 4, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Ibrahim ayat 40", index: 5, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Maryam ayat 4-5", index: 6, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Maryam ayat 19-21", index: 7, playlist: "Murottal"),
                  ItemPlayList(title: """Surat Al-Mu'minun ayat 12-14""", index: 8, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Al-Furqan ayat 74", index: 9, playlist: "Murottal"),
                  ItemPlayList(title: "Surat Luqman ayat 14", index: 10, playlist: "Murottal"),
                  ItemPlayList(title: "Surat As-Saffat ayat 100", index: 11, playlist: "Murottal"),










                  // MusicCard(),
                  // MusicCard(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: playerDev.playing,
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              Hero(
                tag: 'music-player',
                child: Material(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.audioPlayer);
                    },
                    child: SizedBox(
                        height: 80.h,
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width,
                        child: BottomSheetPlayer()
                    ),
                  ),
                ),
              ),
              ProgressBar(
                progress: _position ?? Duration.zero,
                buffered: _buffer ?? Duration.zero,
                total: _duration ?? const Duration(milliseconds: 0),
                thumbRadius: 1,
                timeLabelTextStyle: const TextStyle(color: Colors.white),
                onSeek: (duration) {
                  playerDev.seek(duration);
                },
              ),
            ],
          ),
        ),
      )
    );
  }

  Duration? _duration;
  Duration? _buffer;
  Duration? _position;
  bool shuffleActive = false;


  void _getCurrentPlaylist() async {
    String? _currentPlaylist = await AppSharedPreference.getString(AppSharedPreference.playlist);
    setState(() {
      currentPlaylist = _currentPlaylist;
    });
  }

  String? currentPlaylist;

  @override
  void initState() {
    super.initState();

    _getCurrentPlaylist();

    playerDev.shuffleModeEnabledStream.listen((shuffle) {
      if(mounted){
        setState(() {
          shuffleActive = shuffle;
        });
      }
    });

    playerDev.durationStream.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    playerDev.bufferedPositionStream.listen((newBuffer) {
      if(mounted){
        setState(() {
          _buffer = newBuffer;
        });
      }
    });

    playerDev.positionStream.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });
  }
}
