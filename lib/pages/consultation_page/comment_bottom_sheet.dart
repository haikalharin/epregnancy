import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/injector/injector.dart';
import '../../data/model/consultation_model/consultation_model.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/comment_bloc.dart';
import 'bloc/consultation_page_bloc.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet(
      {Key? key,
      required this.isLiked,
      required this.likesCount,
      required this.userId,
      required this.commentCounts,
      this.consultationModel})
      : super(key: key);
  final ValueNotifier<int> likesCount;
  final ValueNotifier<int> commentCounts;
  final ValueNotifier<bool> isLiked;
  final ConsultationModel? consultationModel;
  final String? userId;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.90,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Semua komentar",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp)),
                Row(
                  children: [
                    Text(
                      "Terakhir dikomentari",
                      style: TextStyle(
                          color: EpregnancyColors.primer,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: EpregnancyColors.primer,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  print('type : ${state.type}');
                  if (state.status == FormzStatus.submissionInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == FormzStatus.submissionSuccess) {
                    print('list comment length : ${state.listComment?.length}');
                    if ((state.listComment?.length ?? 0) < 1) {
                      return const Center(
                        child: Text("Belum Ada Komentar"),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: state.listComment?.length,
                          itemBuilder: (context, index) {
                            // print('comment user id : ${state.listComment?[index].user?.id}');
                            // print('widget user id : ${widget.userId}');
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                              child: Row(
                                children: [
                                  state.listComment?[index].user?.imageUrl != null
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              state.listComment![index].user!
                                                  .imageUrl!,
                                              scale: 1.0),
                                        )
                                      : const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/dummies/dummy_avatar.png'),
                                        ),
                                  SizedBox(width: 10.w,),
                                  Expanded(
                                    child: Container(
                                      color: EpregnancyColors.greyChatBubble,
                                      margin: EdgeInsets.only(top: 3.h),
                                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h , left: 10.w, right: 10.w),
                                      child: Column(
                                        children: [
                                          Text(state.listComment?[index].user?.name ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 5.h,),
                                          Text(state.listComment?[index].message ?? ""),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                    ),
                                  ),
                                  state.listComment?[index].user?.id == widget.userId ?
                                  InkWell(
                                        onTap: (){
                                          // todo delete postingan
                                          print("comment id : ${state.listComment?[index].id}");
                                          Injector.resolve<CommentBloc>().add(DeleteCommentEvent(postId: state.listComment![index].id!));
                                          widget.commentCounts.value += 1;

                                        },
                                        child: SvgPicture.asset('assets/icDelete.svg', color: Colors.black,)): const SizedBox.shrink(),
                                ],
                              ),
                            );
                            // return ListTile(
                            //   leading: state.listComment?[index].user?.imageUrl != null ? CircleAvatar(
                            //     backgroundImage: NetworkImage(state.listComment![index].user!.imageUrl!, scale: 1.0),
                            //   ) : const CircleAvatar(
                            //     backgroundImage: AssetImage('assets/dummies/dummy_avatar.png'),
                            //   ),
                            //   title: Text(state.listComment?[index].user?.name ?? ""),
                            //   subtitle: Text(state.listComment?[index].message ?? ""),
                            // );
                          });
                    }
                  } else {
                    return const Center(
                      child: Text(
                          "Terjadi kesalahan di dalam aplikasi, mohon cek koneksi anda"),
                    );
                  }
                },
              )),
          Row(
            children: [
              // comment widget
              BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
                return Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: TextField(
                        controller: _commentTextController,
                        style: const TextStyle(
                            fontSize: 12.0, height: 2.0, color: Colors.black),
                        enabled: true,
                        maxLines: 3,
                        minLines: 1,
                        textInputAction: TextInputAction.go,
                        onEditingComplete: () {
                          if (_commentTextController.text.isNotEmpty) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            Injector.resolve<CommentBloc>().add(AddCommentEvent(
                                listComment: state.listComment,
                                comment: _commentTextController.text,
                                postId: widget.consultationModel!.id!));
                            _commentTextController.clear();

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            widget.commentCounts.value += 1;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Beri komentar...',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (value) {},
                      ),
                  ),
                );
              }),
              // like button
              Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: ValueListenableBuilder<bool>(
                          valueListenable: widget.isLiked,
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {
                                if (value == false) {
                                  Injector.resolve<ConsultationPageBloc>().add(
                                      ConsultationLikeSubmitted(
                                          widget.consultationModel?.id ?? '',
                                          true));
                                  setState(() {
                                    widget.isLiked.value = true;
                                    widget.likesCount.value += 1;
                                  });
                                } else {
                                  Injector.resolve<ConsultationPageBloc>().add(
                                      ConsultationLikeSubmitted(
                                          widget.consultationModel?.id ?? '',
                                          false));
                                  setState(() {
                                    widget.isLiked.value = false;
                                    widget.likesCount.value -= 1;
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
                          }))
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("total komen : ${widget.consultationModel?.comments?.length}");
    Injector.resolve<CommentBloc>().add(CommentEventInitialized(
        listComment: widget.consultationModel?.comments ?? []));
  }
}
