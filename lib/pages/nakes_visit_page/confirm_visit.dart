import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/confirm_card.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../data/model/user_visit_model/user_visit_model.dart';
import '../home_page/bloc/home_page_bloc.dart';

class ConfirmVisit extends StatefulWidget {
  const ConfirmVisit({Key? key}) : super(key: key);

  @override
  State<ConfirmVisit> createState() => _ConfirmVisitState();
}

class _ConfirmVisitState extends State<ConfirmVisit> {
  int _selectedWeekIndex = 2;

  @override
  void initState() {
    var dateNextEvent = DateTime.now().add(const Duration(days: 28));
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    String outputDate = outputFormat.format(dateNextEvent);
    Injector.resolve<HomePageBloc>().add(ChangeNextVisitEvent(outputDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.tipe == "submit-next-visit") {
          Injector.resolve<HomePageBloc>()
              .add(const FetchListVisitEvent(0, isFromSubmit: true));
        } else  if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.tipe == "submit-next-visit-accepted") {
          Navigator.pop(context);
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.w),
                    topLeft: Radius.circular(8.w),
                  )
              ),
              builder: (context) =>  const ConfirmVisit());

        }else  if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.tipe == "submit-next-visit-rejected") {
          Injector.resolve<HomePageBloc>()
              .add(const FetchListVisitEvent(0, isFromSubmit: true));

        } else if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.isFromSubmit == true &&
            state.tipe == "fetch-user-visit-success") {
          Navigator.pop(context);
        } else if (state.submitStatus == FormzStatus.submissionFailure &&
            state.tipe == "submit-next-visit") {
          var snackBar = SnackBar(
              content: Text(
                  state.errorMessage != null ? state.errorMessage! : 'failed'),
              backgroundColor: Colors.red);
          Scaffold.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(16.w),
                          width: 40.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                              color: EpregnancyColors.greyPony,
                              borderRadius: BorderRadius.circular(8.w)),
                        ),
                        state.userVisitModel?.status == StringConstant.pending? blackText16("Konfirmasi Kunjungan"):blackText16("Rekomendasi Kunjungan Selanjutnya"),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, bottom: 4.h, left: 16.w, right: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              blackText10(
                                  "Kunjungan Kehamilan ke-${(state.userVisitModel?.user?.totalVisit ?? 0) + 1}"),
                              blackText10W500(DateFormatter.dateFormatdMMyyyy
                                  .format(DateTime.now())),
                            ],
                          ),
                        ),
                        ConfirmCard(
                          userVisitModel: state.userVisitModel,
                        ),
                        state.userVisitModel?.status == StringConstant.pending
                            ? Column(
                                children: [

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40.h,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 8.h),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Injector.resolve<HomePageBloc>().add(
                                            SubmitNextVisitEvent(
                                                state.userVisitModel?.id,StringConstant.accepted));
                                      },
                                      child: Text("Konfirmasi"),
                                      style: ElevatedButton.styleFrom(
                                        primary: EpregnancyColors.primer,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 40.h,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 16.h),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Bunda tidak mengunjungi',
                                          style: TextStyle(
                                              color: EpregnancyColors.primer),
                                        ),
                                        onPressed: () {
                                          Injector.resolve<HomePageBloc>().add(
                                              SubmitNextVisitEvent(
                                                  state.userVisitModel?.id,StringConstant.rejected));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          side: BorderSide(
                                              width: 1.w,
                                              color: EpregnancyColors.primer),
                                          primary: EpregnancyColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      )),
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 15.h,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedWeekIndex = index;
                                              });
                                              var dateNextEvent = DateTime.now()
                                                  .add(
                                                      const Duration(days: 28));
                                              if (index == 0) {
                                                dateNextEvent = DateTime.now()
                                                    .add(const Duration(
                                                        days: 7));
                                              } else if (index == 1) {
                                                dateNextEvent = DateTime.now()
                                                    .add(const Duration(
                                                        days: 14));
                                              }
                                              DateFormat outputFormat =
                                                  DateFormat('yyyy-MM-dd');
                                              String outputDate = outputFormat
                                                  .format(dateNextEvent);
                                              Injector.resolve<HomePageBloc>()
                                                  .add(ChangeNextVisitEvent(
                                                      outputDate));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w,
                                                  vertical: 1.h),
                                              margin:
                                                  EdgeInsets.only(right: 8.w),
                                              decoration: BoxDecoration(
                                                  color: _selectedWeekIndex ==
                                                          index
                                                      ? EpregnancyColors.primer
                                                      : EpregnancyColors
                                                          .greyText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.w)),
                                              child:
                                                  whiteText10(weekText(index)),
                                            ),
                                          );
                                        }),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40.h,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 16.h),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Injector.resolve<HomePageBloc>().add(
                                            SubmitNextVisitEvent(
                                                state.userVisitModel?.id,StringConstant.done));
                                      },
                                      child: Text("Kirim Jadwal Ke Bunda"),
                                      style: ElevatedButton.styleFrom(
                                        primary: EpregnancyColors.primer,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    _Loading()
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String weekText(int index) {
    if (index == 0) {
      return "1 Minggu";
    } else if (index == 1) {
      return "2 Minggu";
    } else if (index == 2) {
      return "4 Minggu";
    } else {
      return "Lainnya";
    }
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.tipe == "submit-next-visit") {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
