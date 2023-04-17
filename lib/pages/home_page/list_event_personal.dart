import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/home_page_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListEventPersonalWidget extends StatefulWidget {
  ListEventPersonalWidget({Key? key, this.tipeAcara, this.dateTime, this.isMidwife = false})
      : super(key: key);
  final String? tipeAcara;
  final DateTime? dateTime;
  final bool isMidwife;

  @override
  State<ListEventPersonalWidget> createState() =>
      _ListEventPersonalWidgetState();
}

class _ListEventPersonalWidgetState extends State<ListEventPersonalWidget> {
  @override
  void initState() {
    onRefresh();
    super.initState();
  }

  void onRefresh() async {
    Future.delayed(const Duration(milliseconds: 1800), ()
    {
      Injector.resolve<HomePageBloc>().add(EventFetchEvent(
          widget.tipeAcara == StringConstant.typeEventJadwalUmum
              ? StringConstant.typePublic
              : StringConstant.typePersonal,
          widget.dateTime ?? DateTime.now(), isMidwife: widget.isMidwife));
    });
  }

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess) {
          if (state.tipe == "deleteSchedule") {
            onRefresh();
          }
        }
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: state.listEventPersonal == null ||
                          (state.listEventPersonal != null &&
                              state.listEventPersonal!.isEmpty)
                      ? Stack(children: [
                    Container(
                        margin: EdgeInsets.only(),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Belum ada jadwal hari ini', style: TextStyle(color: EpregnancyColors.blueDark, fontSize: 12.sp),),
                            SizedBox(height: 10.h,),
                            SvgPicture.asset('assets/icCalendarIlustration.svg'),
                          ],
                        )),
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
                                return InkWell(
                                  onTap: () {
                                    _showMyDialog(context,
                                        state.listEventPersonal![index].id!);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
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
                                              state.listEventPersonal![index]
                                                          .type ==
                                                      StringConstant
                                                          .visitHospital
                                                  ? Container(
                                                      child: SvgPicture.asset(
                                                        'assets/ic_health.svg',
                                                        fit: BoxFit.fitHeight,
                                                        // height: 200,
                                                        // height: 60,
                                                        // width: 60,
                                                      ),
                                                    )
                                                  : state
                                                              .listEventPersonal![
                                                                  index]
                                                              .type ==
                                                          StringConstant
                                                              .consumeMedicine
                                                      ? Container(
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/ic_pills_unselected.svg',
                                                            fit: BoxFit
                                                                .fitHeight,
                                                            // height: 200,
                                                            // height: 60,
                                                            // width: 60,
                                                          ),
                                                        )
                                                      : Container(
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/ic_notes.svg',
                                                            fit: BoxFit
                                                                .fitHeight,
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
                                  ),
                                );
                              },
                              itemCount: state.listEventPersonal != null
                                  ? state.listEventPersonal!.length
                                  : 0,
                            ),
                          ],
                        )),

            ],
          );
        },
      ),
    );
  }

  void _showPicker(BuildContext context, String id) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Hapus'),
                      onTap: () async {
                        Navigator.pop(context);
                        Injector.resolve<HomePageBloc>()
                            .add(HomeEventDeleteSchedule(id));
                      }),

                ],
              ),
            ),
          );
        });
  }

  Future<bool?> _showMyDialog(BuildContext context, String id) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda Yakin Ingin menghapus ?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Injector.resolve<HomePageBloc>()
                    .add(HomeEventDeleteSchedule(id));
                Navigator.of(context).pop(true);
              },
              child: Text('Ya'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
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
