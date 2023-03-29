import 'package:PregnancyApp/pages/audio_page/widgets/build_play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../../main_development.dart';
import '../../../utils/epragnancy_color.dart';
import '../../splashscreen_page/splashscreen_page.dart';

class BottomSheetPlayer extends StatefulWidget {
  const BottomSheetPlayer({Key? key}) : super(key: key);

  @override
  State<BottomSheetPlayer> createState() => _BottomSheetPlayerState();
}

class _BottomSheetPlayerState extends State<BottomSheetPlayer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w),
              topRight: Radius.circular(10.w),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
          // border: Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1.w))

      ),
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
              "${playerDev.sequenceState?.currentSource?.tag?.title ?? ""}", style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
            )),
            InkWell(
              onTap: (){
                if(playerDev.playing){
                  playerDev.stop();
                } else {
                  playerDev.play();
                }
              },
              child: AudioPlayButton()
            )
          ],
        ),
      ),
    );

  }
}
