import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'bloc/consultation_page_bloc.dart';

class ForumEventSection extends StatefulWidget {
  const ForumEventSection({Key? key, required this.consultationModel}) : super(key: key);
  final ConsultationModel consultationModel;

  @override
  State<ForumEventSection> createState() => _ForumEventSectionState();
}

class _ForumEventSectionState extends State<ForumEventSection> {
  ConsultationModel? _consultationModel;
  late bool isLiked = widget.consultationModel.isLiked ?? false;
  late int likesCount = widget.consultationModel.likesCount ?? 0;
  late int commentCount = widget.consultationModel.commentsCount ?? 0;

  @override
  void initState() {
    setState(() {
      _consultationModel = widget.consultationModel;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin:
                          EdgeInsets.only(right: 2),
                          child: SvgPicture.asset(
                            'assets/like_logo.svg',
                            fit: BoxFit.fitHeight,
                            height: 17,
                            width: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                '$likesCount orang menyukai post ini',
                                maxLines: 3,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors
                                        .grey),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Text("${_consultationModel?.commentsCount} komentar",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black)),
              ],
            ),
          ),
          BlocBuilder<ConsultationPageBloc,
              ConsultationPageState>(
            builder: (context, state) {
              return Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      state.userModel?.imageUrl != null
                          ? Container(
                        // width: 62,

                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(
                              40),
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                'assets/ic_no_photo.png'),
                            image: NetworkImage(state
                                .userModel
                                ?.imageUrl ??
                                ""),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          : Container(
                        // width: 62,

                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(
                              40),
                          child: const FadeInImage(
                            placeholder: AssetImage(
                                'assets/ic_no_photo.png'),
                            image: AssetImage(
                                'assets/ic_no_photo.png'),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // komentar
                      Container(
                        width: 230,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 12.0,
                              height: 2.0,
                              color: Colors.black),
                          maxLines: 3,
                          minLines: 1,
                          decoration: const InputDecoration(
                            hintText: 'Beri komentar...',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        child: isLiked ? InkWell(
                          onTap: (){
                            Injector.resolve<ConsultationPageBloc>().add(ConsultationLikeSubmitted(_consultationModel?.id ?? '', false));
                                setState(() {
                              isLiked = false;
                              likesCount -= 1;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/ic_like_fill.svg',
                            fit: BoxFit
                                .fitHeight,
                          ),
                        )
                            : InkWell(
                              onTap: (){
                                Injector.resolve<ConsultationPageBloc>().add(ConsultationLikeSubmitted(_consultationModel?.id ?? ''
                                    , true));
                                setState(() {
                                  isLiked = true;
                                  likesCount += 1;
                                });
                              },
                              child: SvgPicture.asset(
                          'assets/like_logo.svg',
                          fit: BoxFit
                                .fitHeight,
                        ),
                            ),
                      )
                    ],
                  ));
            },
          ),
        ],
      ),
    );

  }
}
