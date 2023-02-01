import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/pages/consultation_page/comment_bottom_sheet.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

import 'bloc/consultation_page_bloc.dart';

class ForumEventSection extends StatefulWidget {
  const ForumEventSection({Key? key, required this.consultationModel, required this.userId})
      : super(key: key);
  final ConsultationModel consultationModel;
  final String? userId;

  @override
  State<ForumEventSection> createState() => _ForumEventSectionState();
}

class _ForumEventSectionState extends State<ForumEventSection> {
  ConsultationModel? _consultationModel;
  late final bool _isLiked = widget.consultationModel.isLiked ?? false;
  late final int _likesCount = widget.consultationModel.likesCount ?? 0;
  late final int _commentCounts = widget.consultationModel.commentsCount ?? 0;

  late ValueNotifier<bool> isLiked = ValueNotifier<bool>(_isLiked);
  late ValueNotifier<int> likesCount = ValueNotifier<int>(_likesCount);
  late ValueNotifier<int> commentCounts = ValueNotifier<int>(_commentCounts);

  late int commentCount = widget.consultationModel.commentsCount ?? 0;

  bool enableComment = true;

  int newCommentCount = 0;

  @override
  void initState() {
    setState(() {
      _consultationModel = widget.consultationModel;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    ToastContext().init(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 2),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<int>(
                              valueListenable: likesCount,
                              builder: (context, value, child) {
                                return Container(
                                    width: 200,
                                    child: Text(
                                      '$value orang menyukai post ini',
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ));
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<int>(
                    valueListenable: commentCounts,
                    builder: (context, value, child) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            newCommentCount = commentCounts.value;
                          });

                          showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              context: context,
                              builder: (context) {
                                return CommentBottomSheet(
                                    isLiked: isLiked,
                                    userId: widget.userId,
                                    likesCount: likesCount,
                                    commentCounts: commentCounts,
                                    consultationModel: _consultationModel);
                              }).then((result) {
                            if (newCommentCount != commentCounts.value) {
                              Injector.resolve<ConsultationPageBloc>()
                                  .add(const ConsultationFetchEvent());
                            }

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          });
                        },
                        child: Text("$value komentar",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                      );
                    })
              ],
            ),
          ),
          BlocBuilder<ConsultationPageBloc, ConsultationPageState>(
            builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.userModel?.imageUrl != null
                      ? Container(
                          // width: 62,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/ic_no_photo.png'),
                              image:
                                  NetworkImage(state.userModel?.imageUrl ?? ""),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          // width: 62,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: const FadeInImage(
                              placeholder: AssetImage('assets/ic_no_photo.png'),
                              image: AssetImage('assets/ic_no_photo.png'),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  // komentar
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: InkWell(
                        onTap: () {
                          // show comment modal bottom sheet

                          setState(() {
                            newCommentCount = commentCounts.value;
                          });

                          showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              context: context,
                              builder: (context) {
                                return CommentBottomSheet(
                                    isLiked: isLiked,
                                    userId: widget.userId,
                                    likesCount: likesCount,
                                    commentCounts: commentCounts,
                                    consultationModel: _consultationModel);
                              }).then((result) {
                            if (newCommentCount != commentCounts.value) {
                              Injector.resolve<ConsultationPageBloc>()
                                  .add(const ConsultationFetchEvent());
                            }

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          });
                        },
                        child: Hero(
                          tag: 'comment',
                          child: Container(
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  height: 2.0,
                                  color: Colors.black),
                              enabled: false,
                              // onTap: (){
                              //   setState(() {
                              //     Toast.show("Update terus Komunitazmu untuk menikmati fitur komentar");
                              //     Future.delayed(Duration(seconds: 2), (){
                              //       setState(() {
                              //         enableComment = false;
                              //       });
                              //     });
                              //   });
                              // },
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
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isLiked,
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            if (value == false) {
                              Injector.resolve<ConsultationPageBloc>()
                                  .add(ConsultationLikeSubmitted(
                                  _consultationModel?.id ?? '',
                                  true));
                              setState(() {
                                isLiked.value = true;
                                likesCount.value += 1;
                              });
                            } else {
                              Injector.resolve<ConsultationPageBloc>()
                                  .add(ConsultationLikeSubmitted(
                                  _consultationModel?.id ?? '',
                                  false));
                              setState(() {
                                isLiked.value = false;
                                likesCount.value -= 1;
                              });
                            }
                          },
                          child: value == true
                              ? SvgPicture.asset(
                            'assets/ic_like_fill.svg',
                            fit: BoxFit.fitHeight,
                          )
                              : SvgPicture.asset(
                            'assets/like_logo.svg',
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      }),)
                ],
              ));
            },
          ),
        ],
      ),
    );
  }
}
