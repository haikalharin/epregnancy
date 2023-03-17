import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/consultation_page/forum_event_section.dart';
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
        required this.userId,
      required this.listConsul,
      required this.psLikesCount})
      : super(key: key);
  final String? tipeAcara;
  List<ConsultationModel> listConsul = [];
  final String? userId;
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
                Container(margin: EdgeInsets.only(), child: Container(child: Center(
                  child: Text("Belum Ada Postingan"),
                ),))
              ])
            : Stack(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      bool isChange = false;
                      bool isLike = widget.listConsul[index].isLiked ?? false;
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
                      var commentsCount = f.format(widget.listConsul[index].commentsCount);
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
                                    margin: EdgeInsets.only(left: 20, right: 20),
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
                                              // widget image profile komentar
                                              widget.listConsul[index].user?.imageUrl != null
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
                                                      child: Text(
                                                        // widget.listConsul[index].user?.name ?? "",
                                                        widget.listConsul[index].user?.name ?? "",
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

                                        widget.listConsul[index].userId == widget.userId ?
                                        InkWell(
                                          onTap: (){
                                            // todo delete postingan
                                            Injector.resolve<ConsultationPageBloc>().add(ConsultationDeletePostEvent(widget.listConsul[index].id));
                                            // print("post id : ${widget.listConsul[index].id}");
                                          },
                                            child: SvgPicture.asset('assets/icDelete.svg', color: Colors.black,)): const SizedBox.shrink(),

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
                            ForumEventSection(consultationModel: widget.listConsul[index], userId: widget.userId,)
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
