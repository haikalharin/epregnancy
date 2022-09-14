import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';

class ListEventWidget extends StatefulWidget {
  ListEventWidget({Key? key, this.tipeAcara, this.dateTime}) : super(key: key);
  final String? tipeAcara;
  final DateTime? dateTime;

  @override
  State<ListEventWidget> createState() => _ListEventWidgetState();
}

class _ListEventWidgetState extends State<ListEventWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(EventFetchEvent(
        widget.tipeAcara == StringConstant.typeEventJadwalUmum
            ? StringConstant.typePublic
            : StringConstant.typePersonal,
        widget.dateTime ?? DateTime.now()));
    super.initState();
  }

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: state.listEvent == null ||
                          (state.listEvent != null && state.listEvent!.isEmpty)
                      ? Stack(children: [
                          Container(
                              margin: EdgeInsets.only(),
                              child: Center(
                                  child: Container(
                                child: Text("Belum ada acara"),
                              ))),
                        ])
                      : Stack(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                String outputDate = "";
                                var outputFormat = DateFormat.yMMMMd('id');
                                outputDate = outputFormat
                                    .format(widget.dateTime ?? DateTime.now());
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: EpregnancyColors.primer,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // color: Colors.greenAccent,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    // width: 62,

                                                    child: Text(outputDate)),
                                                Container(
                                                    // width: 62,

                                                    child: Text(
                                                  widget.tipeAcara ?? '',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          EpregnancyColors.primer),
                                                )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                      .size
                                                                      .width -
                                                                  200,
                                                          margin: EdgeInsets.only(
                                                              bottom: 10),
                                                          child: Text(
                                                            state.listEvent !=
                                                                        null &&
                                                                    state
                                                                            .listEvent![
                                                                                index]
                                                                            .title !=
                                                                        null
                                                                ? state
                                                                    .listEvent![
                                                                        index]
                                                                    .title!
                                                                : "",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                200,
                                                        child: ConstrainedBox(
                                                            constraints: isExpanded
                                                                ? new BoxConstraints()
                                                                : new BoxConstraints(
                                                                    maxHeight:
                                                                        50.0),
                                                            child: Text(
                                                              state.listEvent !=
                                                                          null &&
                                                                      state
                                                                              .listEvent![
                                                                                  index]
                                                                              .description !=
                                                                          null
                                                                  ? state
                                                                      .listEvent![
                                                                          index]
                                                                      .description!
                                                                  : "",

                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow.fade,

                                                            )),
                                                      ),

                                                      // Container(
                                                      //     width: MediaQuery.of(context).size.width -200,
                                                      //     margin: EdgeInsets.only(),
                                                      //     child: Text(state
                                                      //                     .listEvent !=
                                                      //                 null &&
                                                      //             state
                                                      //                     .listEvent![
                                                      //                         index]
                                                      //                     .description !=
                                                      //                 null
                                                      //         ? state
                                                      //             .listEvent![index]
                                                      //             .description!
                                                      //         : "", overflow: TextOverflow.ellipsis,maxLines: 3,)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: state
                                                                  .listEvent![index]
                                                                  .imageUrl !=
                                                              null &&
                                                          state.listEvent![index]
                                                                  .imageUrl !=
                                                              ""
                                                      ? BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                                state
                                                                    .listEvent![
                                                                        index]
                                                                    .imageUrl!),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0),
                                                          color: EpregnancyColors
                                                              .primer),
                                                  height: 80,
                                                  width: 80,
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                      isExpanded
                                          ? FlatButton(
                                          child:
                                          const Text('Read less'),
                                          onPressed: () =>
                                              setState(() =>
                                              isExpanded =
                                              false))
                                          : FlatButton(
                                          child:
                                          const Text('Read More'),
                                          onPressed: () =>
                                              setState(() =>
                                              isExpanded =
                                              true))
                                    ],
                                  ),
                                );
                              },
                              itemCount: state.listEvent != null
                                  ? state.listEvent!.length
                                  : 0,
                            ),
                          ],
                        )),
              widget.tipeAcara == StringConstant.typeEventJadwalPribadi
                  ? Align(
                      alignment: Alignment(0.9, 1),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: RaisedButton(
                          color: EpregnancyColors.primer,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '+',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 26)),
                                  TextSpan(
                                      text: '   Tambah Jadwal',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          onPressed: () async {
                            TimeOfDay initialTime = TimeOfDay.now();
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.status == FormzStatus.submissionInProgress &&
          state.tipe == 'listEvent') {
        return Container(
            height: 1000,
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
