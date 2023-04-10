import 'package:PregnancyApp/main_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../../utils/epragnancy_color.dart';
import '../../splashscreen_page/splashscreen_page.dart';

class AudioPlayButton extends StatefulWidget {
  const AudioPlayButton({Key? key}) : super(key: key);

  @override
  State<AudioPlayButton> createState() => _AudioPlayButtonState();
}

class _AudioPlayButtonState extends State<AudioPlayButton> {

  bool buffering = false;

  @override
  void initState() {
    super.initState();

    playerDev.playerStateStream.listen((state) {
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
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(buffering){
      return const Center(
            child: CircularProgressIndicator()
      );
    } else {
      return Center(
          child: SvgPicture.asset(
            playerDev.playing
                ? 'assets/icPause.svg'
                : 'assets/icPlay.svg',
            color: EpregnancyColors.primer,
          ),
      );
    }
  }
}
