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

class PlaylistPageMusic extends StatefulWidget {
  const PlaylistPageMusic({Key? key}) : super(key: key);

  @override
  State<PlaylistPageMusic> createState() => _PlaylistPageMusicState();
}

class _PlaylistPageMusicState extends State<PlaylistPageMusic> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BtnBackIosStyle(),
        title: Text(
          "Musik Kehamilan",
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
                  tag: 'musik-kehamilan',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.w),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/musik_image.png", fit: BoxFit.fitWidth,)),
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Membantu Bunda lebih santai, bahagia dan menstimulasi perkembangan otak bayi\n",
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
                            String? currentPlaylist = await AppSharedPreference.getString(AppSharedPreference.playlist);

                            if(playerDev.playing){
                              playerDev.pause();
                            } else {
                              if(state.currentPlaylist == "Music"){
                                playerDev.play();
                              } else {
                                Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Music"));
                                await playerDev.setAudioSource(playlistMusic);
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
                  ItemPlayList(title: "Before I Met You", index: 0, playlist: "Music"),
                  ItemPlayList(title: "First Love", index: 1, playlist: "Music"),
                  ItemPlayList(title: "Light of My Life", index: 2, playlist: "Music"),
                  ItemPlayList(title: "Little Miracle", index: 3, playlist: "Music"),
                  ItemPlayList(title: "Message of Love", index: 4, playlist: "Music"),
                  ItemPlayList(title: "New Chapter", index: 5, playlist: "Music"),
                  ItemPlayList(title: "Pure Hapiness", index: 6, playlist: "Music"),
                  ItemPlayList(title: "Sweet Dream", index: 7, playlist: "Music"),
                  ItemPlayList(title: "Sweet Moment", index: 8, playlist: "Music"),
                  ItemPlayList(title: "Tiny Kiss", index: 9, playlist: "Music"),
                  SizedBox(
                    height: 100.h,
                  ),
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
    if(mounted){
      setState(() {
        currentPlaylist = _currentPlaylist;
      });
    }

    print("current playlist : $currentPlaylist");
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
