import 'package:PregnancyApp/data/shared_preference/app_shared_preference.dart';
import 'package:PregnancyApp/pages/audio_page/bloc/audio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/injector/injector.dart';
import '../../../utils/epragnancy_color.dart';
import '../../splashscreen_page/splashscreen_page.dart';


class ItemPlayList extends StatefulWidget {
  const ItemPlayList({Key? key, required this.title, required this.index, required this.playlist}) : super(key: key);
  final String? title;
  final int? index;
  final String playlist;

  @override
  State<ItemPlayList> createState() => _ItemPlayListState();
}

class _ItemPlayListState extends State<ItemPlayList> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state){
        return InkWell(
          onTap: () async {
            print("play clicked");
            if(playerDev.currentIndex == widget.index && playerDev.playing){
              print("if here");
              playerDev.pause();
            } else {
              print("else here");
              if(state.currentPlaylist == widget.playlist){
                print('if play');
                playerDev.seek(Duration.zero, index: widget.index);
                playerDev.play();
              } else {
                if(widget.playlist == "Murottal"){
                  try {
                    print('murottal play');
                    Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Murottal"));
                    await playerDev.setAudioSource(playlist);
                    await playerDev.seek(Duration.zero, index: widget.index);
                    playerDev.play();

                  } catch (e, stackTrace) {
                    // Catch load errors: 404, invalid url ...
                    print("Error loading playlist: $e");
                    print(stackTrace);
                  }

                } else {
                  try {
                    print('music play');
                    Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Music"));
                    await playerDev.setAudioSource(playlistMusic);
                    await playerDev.seek(Duration.zero, index: widget.index);
                    playerDev.play();

                  } catch (e, stackTrace) {
                    // Catch load errors: 404, invalid url ...
                    print("Error loading playlist: $e");
                    print(stackTrace);
                  }
                }
              }
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
                      onTap: () async {
                        print("play clicked");
                        if(playerDev.currentIndex == widget.index && playerDev.playing){
                          print("if here");
                          playerDev.pause();
                        } else {
                          print("else here");
                          if(state.currentPlaylist == widget.playlist){
                            print('if play');
                            playerDev.seek(Duration.zero, index: widget.index);
                            playerDev.play();
                          } else {
                            if(widget.playlist == "Murottal"){
                              try {
                                print('murottal play');
                                Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Murottal"));
                                await playerDev.setAudioSource(playlist);
                                await playerDev.seek(Duration.zero, index: widget.index);
                                playerDev.play();

                              } catch (e, stackTrace) {
                                // Catch load errors: 404, invalid url ...
                                print("Error loading playlist: $e");
                                print(stackTrace);
                              }

                            } else {
                              try {
                                print('music play');
                                Injector.resolve<AudioBloc>().add(const AudioEventChangePlaylist("Music"));
                                await playerDev.setAudioSource(playlistMusic);
                                await playerDev.seek(Duration.zero, index: widget.index);
                                playerDev.play();

                              } catch (e, stackTrace) {
                                // Catch load errors: 404, invalid url ...
                                print("Error loading playlist: $e");
                                print(stackTrace);
                              }
                            }
                          }
                        }
                      },
                      child: SvgPicture.asset(playerDev.currentIndex == widget.index && playerDev.playing && state.currentPlaylist == widget.playlist ? "assets/icPause.svg" : "assets/icPlay.svg"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
