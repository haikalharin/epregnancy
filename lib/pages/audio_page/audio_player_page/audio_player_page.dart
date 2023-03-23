import 'package:audio_session/audio_session.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import '../../splashscreen_page/splashscreen_page.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../../common/injector/injector.dart';
import '../../../utils/epragnancy_color.dart';
import '../../../utils/firebase_messaging.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  bool isPlaying = false;
  bool buffering = false;
  Duration? _duration;
  Duration? _buffer;
  Duration? _position;
  bool shuffleActive = false;

  @override
  void initState() {
    super.initState();
    // playerDev.setLoopMode(LoopMode.one);
    // playerDev.setAsset("assets/audio/al_fatihah.mp3");
    // playerDev.setAudioSource(playlist,
    //     initialIndex: 0, initialPosition: Duration.zero);

    playerDev.shuffleModeEnabledStream.listen((shuffle) {
      if(mounted){
        setState(() {
          shuffleActive = shuffle;
        });
      }
    });

    playerDev.playerStateStream.listen((state) {
      if (state.playing) {
        if (mounted) {
          setState(() {
            isPlaying = true;
          });
        }
      }
      switch (state.processingState) {
        case ProcessingState.idle:
          break;
        case ProcessingState.loading:
          print('loading');
          setState(() {
            buffering = true;
          });
          break;
        case ProcessingState.buffering:
          print('buffering');
          if(mounted){
            setState(() {
              buffering = true;
            });
          }
          break;
        case ProcessingState.ready:
          print('ready');
          if(mounted){
            setState(() {
              buffering = false;
            });
          }
          break;
        case ProcessingState.completed:
          setState(() {
            isPlaying = false;
          });
          break;
      }
      print('isPlaying state : $isPlaying');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            EpregnancyColors.primer,
            EpregnancyColors.primerSoft2,
            Colors.white,
            Colors.white
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    )),
                Expanded(
                    child: Center(
                        child: Text(
                  "Audio Player",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ))),
                SvgPicture.asset("assets/icShare.svg")
                // Expanded(flex: 1, child: Container(width: 20.w,))
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 100.h),
                padding: EdgeInsets.all(120.w),
                decoration: BoxDecoration(
                    color: EpregnancyColors.primer,
                    borderRadius: BorderRadius.circular(8.w)),
                child: buffering ? SizedBox(height: 50.h, width: 50.w, child: const CircularProgressIndicator(color: Colors.white),) : SvgPicture.asset("assets/icMusic.svg",
                    color: Colors.white, height: 50.h, width: 50.w),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: Colors.white,
        height: 160.h,
        child: BottomAppBar(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${playerDev.sequenceState?.currentSource?.tag?.title}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ProgressBar(
                  progress: _position ?? Duration.zero,
                  buffered: _buffer ?? Duration.zero,
                  total: _duration ?? const Duration(milliseconds: 0),
                  timeLabelTextStyle: const TextStyle(color: Colors.white),
                  onSeek: (duration) {
                    playerDev.seek(duration);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      },
                      child: SvgPicture.asset(
                        'assets/icShuffle.svg',
                        color: shuffleActive ? EpregnancyColors.primer : EpregnancyColors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(playerDev.hasPrevious){
                          playerDev.seekToPrevious();
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icPrev.svg',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(buffering){
                          // do nothing
                        } else {
                          if (isPlaying) {
                            playerDev.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            playerDev.play();
                          }
                        }
                      },
                      child: buildPlayButton(context)
                    ),
                    InkWell(
                      onTap: (){
                        if(playerDev.hasNext){
                          playerDev.seekToNext();
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icSkip.svg',
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        if(playerDev.loopMode == LoopMode.all){
                          playerDev.setLoopMode(LoopMode.one);
                        } else {
                          playerDev.setLoopMode(LoopMode.all);
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icRepeat.svg', color: playerDev.loopMode == LoopMode.one ? EpregnancyColors.primer : EpregnancyColors.grey ,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            )),
      ),
    );
  }

  Widget buildPlayButton(BuildContext context){
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
          color: EpregnancyColors.primerSoft2,
          borderRadius: BorderRadius.circular(8.w)),
      child: Center(
        child: SvgPicture.asset(
          isPlaying
              ? 'assets/icPause.svg'
              : 'assets/icPlay.svg',
          color: EpregnancyColors.primer,
        ),
      ),
    );
    // if(buffering){
    //   return Container(
    //     padding: EdgeInsets.all(13.w),
    //     decoration: BoxDecoration(
    //         color: EpregnancyColors.primerSoft2,
    //         borderRadius: BorderRadius.circular(8.w)),
    //     child: Center(
    //       child: Container(
    //         height: 10.h,
    //         width: 10.w,
    //         child: CircularProgressIndicator(),
    //       )
    //     ),
    //   );
    // } else {
    //   return Container(
    //     padding: EdgeInsets.all(13.w),
    //     decoration: BoxDecoration(
    //         color: EpregnancyColors.primerSoft2,
    //         borderRadius: BorderRadius.circular(8.w)),
    //     child: Center(
    //       child: SvgPicture.asset(
    //         isPlaying
    //             ? 'assets/icPause.svg'
    //             : 'assets/icPlay.svg',
    //         color: EpregnancyColors.primer,
    //       ),
    //     ),
    //   );
    // }
  }
}
