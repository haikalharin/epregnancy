import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';
import '../../splashscreen_page/splashscreen_page.dart';

class ItemPlayList extends StatefulWidget {
  const ItemPlayList({Key? key, required this.title, required this.index}) : super(key: key);
  final String? title;
  final int? index;

  @override
  State<ItemPlayList> createState() => _ItemPlayListState();
}

class _ItemPlayListState extends State<ItemPlayList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(playerDev.currentIndex == widget.index && playerDev.playing){
          playerDev.pause();
        } else {
          playerDev.seek(Duration.zero, index: widget.index);
          playerDev.play();
        }
      },
      child: Card(
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
                widget.title ?? "", style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700),
              )),
              InkWell(
                  onTap: (){
                    if(playerDev.currentIndex == widget.index && playerDev.playing){
                      playerDev.pause();
                    } else {
                      playerDev.seek(Duration.zero, index: widget.index);
                      playerDev.play();
                    }
                  },
                  child: SvgPicture.asset(playerDev.currentIndex == widget.index && playerDev.playing ? "assets/icPause.svg" : "assets/icPlay.svg"))
            ],
          ),
        ),
      ),
    );
  }
}
