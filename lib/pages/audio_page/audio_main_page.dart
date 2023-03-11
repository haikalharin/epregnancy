import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/pages/audio_page/widgets/bottom_sheet_player.dart';
import 'package:PregnancyApp/pages/audio_page/widgets/music_card.dart';
import 'package:PregnancyApp/routes/routes.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/router_constants.dart';

class AudioMainPage extends StatefulWidget {
  const AudioMainPage({Key? key}) : super(key: key);

  @override
  State<AudioMainPage> createState() => _AudioMainPageState();
}

class _AudioMainPageState extends State<AudioMainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:16.w, vertical: 30.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [EpregnancyColors.whiteBlue, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Audio", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp),),
            SizedBox(height: 10.h,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical :40.w, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/audio_banner.svg'),
                    SizedBox(height: 10.h,),
                    Text("Musik dinilai mampu mengurangi nyeri, meredakan stres dan meningkatkan refleks janin.", maxLines: 3, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteName.playlist);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.w)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical :16.w, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'img-banner',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.w),
                            child: Image.asset('assets/music_murottal.png', height: 100.h, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,)),
                      ),
                      SizedBox(height: 10.h,),
                      Text("Murottal", maxLines: 3, textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10.h,),
                      Text("Menyejukan, menenangkan hati dan mengajak bayi untuk lebih dekat dengan nasihat Allah dalam Al-Quran", style: TextStyle(
                         fontWeight: FontWeight.w500, fontSize: 12.sp, color: EpregnancyColors.black
                        ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
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
