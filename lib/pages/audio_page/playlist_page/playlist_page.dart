import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/router_constants.dart';
import '../../../main_development.dart';
import '../../../utils/epragnancy_color.dart';
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
                colors: [EpregnancyColors.primer, Colors.white, Colors.white],
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
                  Padding(
                    padding: EdgeInsets.all(13.w),
                    child: SvgPicture.asset('assets/icShuffle.svg'),
                  ),
                  SizedBox(width: 10.w,),
                  InkWell(
                    onTap: (){
                      if(playerDev.playing){
                        playerDev.pause();
                      } else {
                        playerDev.play();
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
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w)
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(13.w),
                            decoration: BoxDecoration(
                                color: EpregnancyColors.primerSoft2,
                                borderRadius: BorderRadius.circular(8.w)),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icMusic.svg',
                                color: EpregnancyColors.primer,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Expanded(child: Text(
                            "Al-Fatihah", style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
                          )),
                          SvgPicture.asset("assets/icPlay.svg")
                        ],
                      ),
                    ),
                  ),
                  MusicCard(),
                  MusicCard(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
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
      )
    );
  }

  Duration? _duration;
  Duration? _buffer;
  Duration? _position;


  @override
  void initState() {
    super.initState();

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
