import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';

class ListEventPersonalWidget extends StatefulWidget {
  ListEventPersonalWidget({Key? key, this.tipeAcara, this.dateTime})
      : super(key: key);
  final String? tipeAcara;
  final DateTime? dateTime;

  @override
  State<ListEventPersonalWidget> createState() =>
      _ListEventPersonalWidgetState();
}

class _ListEventPersonalWidgetState extends State<ListEventPersonalWidget> {
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
                  child: state.listEventPersonal == null ||
                      (state.listEventPersonal != null && state.listEventPersonal!.isEmpty)
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
                          outputDate = outputFormat.format(DateTime.parse(
                              state.listEventPersonal != null &&
                                  state.listEventPersonal![index]
                                      .eventStartDate !=
                                      null
                                  ? state
                                  .listEventPersonal![index].eventStartDate!
                                  : ""));
                          return Container(

                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: EpregnancyColors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // color: Colors.greenAccent,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 30),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        // width: 62,

                                          child: Text(outputDate)),
                                      state.listEventPersonal![index].consulType ==
                                          StringConstant.visitHospital ?
                                      Container(
                                        child: SvgPicture.asset(
                                          'assets/ic_health.svg',
                                          fit: BoxFit.fitHeight,
                                          // height: 200,
                                          // height: 60,
                                          // width: 60,
                                        ),
                                      ) : state.listEventPersonal![index].consulType ==
                                          StringConstant.consumeMedicine
                                          ? Container(
                                        child: SvgPicture.asset(
                                          'assets/ic_pills_unselected.svg',
                                          fit: BoxFit.fitHeight,
                                          // height: 200,
                                          // height: 60,
                                          // width: 60,
                                        ),
                                      ):  Container(
                                        child: SvgPicture.asset(
                                          'assets/ic_notes.svg',
                                          fit: BoxFit.fitHeight,
                                          // height: 200,
                                          // height: 60,
                                          // width: 60,
                                        ),
                                      ),
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
                                          children: [
                                            Container(
                                                width: 230,
                                                margin: EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text(
                                                  state.listEventPersonal !=
                                                      null &&
                                                      state
                                                          .listEventPersonal![
                                                      index]
                                                          .title !=
                                                          null
                                                      ? state
                                                      .listEventPersonal![
                                                  index]
                                                      .title!
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: state.listEventPersonal != null
                            ? state.listEventPersonal!.length
                            : 0,
                      ),
                    ],
                  )),
              widget.tipeAcara == StringConstant.typeEventJadwalPribadi
                  ? Align(
                alignment: Alignment(0.9, 1),
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
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
