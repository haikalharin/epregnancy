import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/consultation_page_bloc.dart';

class ListForumWidget extends StatefulWidget {
  ListForumWidget(
      {Key? key,
      this.tipeAcara,
      required this.listConsul,
      required this.psLikesCount})
      : super(key: key);
  final String? tipeAcara;
  List<ConsultationModel> listConsul = [];
  final PublishSubject<bool> psLikesCount;

  @override
  State<ListForumWidget> createState() => _ListForumWidgetState();
}

class _ListForumWidgetState extends State<ListForumWidget> {
  Future<void> onLike() async {
    if (widget.psLikesCount != null) {
      widget.psLikesCount.sink.add(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: widget.listConsul.isEmpty
            ? Stack(children: [
                Container(margin: EdgeInsets.only(), child: Container())
              ])
            : Stack(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      bool isChange = false;
                      bool isLike = false;
                      bool isLocal = false;
                      String likesCount = "";
                      var like = 0;
                      String? date = "";
                      if (widget.listConsul[index].createdDate != null) {
                        DateTime dt = DateTime.parse(
                            widget.listConsul[index].createdDate ??
                                "0000-00-00 00:00:00");
                        final df = DateFormat('yyyy MMM dd, HH:mm');
                        date = df.format(dt);
                      }

                      var f = NumberFormat("###.###", "en_US");
                      var commentsCount =
                          f.format(widget.listConsul[index].commentsCount);
                      if (!isLocal) {
                        likesCount =
                            f.format(widget.listConsul[index].likesCount);
                      }

                      return Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: Colors.greenAccent,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 30),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
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
                                              widget.listConsul[index].user
                                                          ?.imageUrl !=
                                                      null
                                                  ? Container(
                                                      // width: 62,

                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                        child: FadeInImage(
                                                          placeholder: AssetImage(
                                                              'assets/ic_no_photo.png'),
                                                          image: NetworkImage(widget
                                                                  .listConsul[
                                                                      index]
                                                                  .user
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
                                                            BorderRadius
                                                                .circular(40),
                                                        child:
                                                            const FadeInImage(
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
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      child:  Text(
                                                        widget
                                                            .listConsul[
                                                        index]
                                                            .user
                                                            ?.name??"",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.access_time),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      date != null
                                                          ? Container(
                                                              // width: 62,

                                                              child: Text(
                                                              date,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                            ))
                                                          : Container(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.ios_share)
                                      ],
                                    ),
                                  ),
                                  widget.listConsul[index].imageUrl != null &&
                                          widget.listConsul[index].imageUrl !=
                                              ""
                                      ? ClipRRect(
                                          child: FadeInImage(
                                            placeholder: AssetImage(
                                                'assets/ic_no_photo.png'),
                                            image: NetworkImage(widget
                                                    .listConsul[index]
                                                    .imageUrl ??
                                                ''),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            children: [
                                              // Container(
                                              //     width: 230,
                                              //     margin: EdgeInsets.only(bottom: 10),
                                              //     child: Text(
                                              //         listPrivilegesData[index]
                                              //             .name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 30, bottom: 30),
                                                  width: 300,
                                                  child: Text(widget
                                                          .listConsul[index]
                                                          .message ??
                                                      "")),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width - 40 * 2,
                              color: Colors.grey.shade200,
                            ),
                            Container(
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
                                              StreamBuilder<bool>(
                                                  stream: widget
                                                      .psLikesCount.stream
                                                      .cast(),
                                                  builder: (context, snapshot) {
                                                    return Column(
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
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Text("$commentsCount komentar",
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
                                            // width: 62,

                                            child: InkWell(
                                              onTap: () async {
                                                // if (isLike == false) {
                                                //   like = widget.listConsul[index]
                                                //       .likesCount! +
                                                //       1;
                                                //   likesCount = f.format(like);
                                                //   isLike = true;
                                                //   isLocal = true;
                                                //   await onLike();
                                                //   isChange = true;
                                                //   // Injector.resolve<ConsultationPageBloc>()
                                                //   //     .add( ConsultationLikeSubmitted(widget.listConsul[index].id??"", true));
                                                //
                                                // } else {
                                                //   like = like - 1;
                                                //   likesCount = f.format(like);
                                                //   isLike = false;
                                                //   isLocal = true;
                                                //   await onLike();
                                                //   isChange = true;
                                                //   // Injector.resolve<ConsultationPageBloc>()
                                                //   //     .add( ConsultationLikeSubmitted(widget.listConsul[index].id??"", false));
                                                //
                                                // }
                                              },
                                              child: StreamBuilder<bool>(
                                                  stream: widget
                                                      .psLikesCount.stream
                                                      .cast(),
                                                  builder: (context, snapshot) {
                                                    if (isChange == true) {
                                                      if (snapshot.data ==
                                                          true) {
                                                        Injector.resolve<
                                                                ConsultationPageBloc>()
                                                            .add(ConsultationLikeSubmitted(
                                                                widget
                                                                        .listConsul[
                                                                            index]
                                                                        .id ??
                                                                    "",
                                                                true));
                                                        isChange = false;
                                                      } else {
                                                        Injector.resolve<
                                                                ConsultationPageBloc>()
                                                            .add(ConsultationLikeSubmitted(
                                                                widget
                                                                        .listConsul[
                                                                            index]
                                                                        .id ??
                                                                    "",
                                                                false));
                                                        isChange = false;
                                                      }
                                                    }
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      child: isLike
                                                          ? SvgPicture.asset(
                                                              'assets/ic_like_fill.svg',
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                              // height: 200,
                                                              // height: 60,
                                                              // width: 60,
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/like_logo.svg',
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                              // height: 200,
                                                              // height: 60,
                                                              // width: 60,
                                                            ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ));
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: widget.listConsul.length,
                  ),
                ],
              ));
  }
}
