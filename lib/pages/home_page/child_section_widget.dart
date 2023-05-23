import 'package:PregnancyApp/data/model/my_child_dashboard/my_child_dashboard.dart';
import 'package:PregnancyApp/pages/growth_page/growth_page.dart';
import 'package:PregnancyApp/pages/home_page/baby_tracker_detail_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../common/constants/router_constants.dart';
import '../../common/style/custom_text_style.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/image_utils.dart';
import '../child_list_page/growth_tracker_form.dart';
import '../new_born_page/baby_born_form_page.dart';

class ChildSectionWidget extends StatelessWidget {
  ChildSectionWidget(
      {Key? key,
      this.one,
      required this.state,
      required this.tooltipController,
      required this.psTriggerTooltip})
      : super(key: key);
  final GlobalKey? one;
  final HomePageState state;
  final JustTheController tooltipController;
  final PublishSubject<bool> psTriggerTooltip;
  var duration = 0;

  Path defaultTailBuilder(Offset tip, Offset point2, Offset point3) {
    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(point2.dx, point2.dy)
      ..lineTo(point3.dx, point3.dy)
      ..close();
  }

  @override
  Widget build(BuildContext context) {
    return state.showGuide == true
        ? Showcase(
            key: one ?? GlobalKey(),
            title: 'Selamat datang !',
            description:
                'Anda akan dengan mudah mengetahui fase kehamilan dengan gambar interaktif yang menunjukkan kondisi janin Anda',
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: EpregnancyColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 8),
                padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: EpregnancyColors.pink),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text(
                                    "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.grey[700])
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : state.myChildDashboard == null ? Container() : BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ageChild(state.myChildDashboard),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return GrowthTrackerForm(
                                babyId: state.myChildDashboard!.child!.id!
                            );
                          }));
                    },
                    child: Container(
                      width: 118.w,
                      height: 32.h,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: EpregnancyColors.primer,
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          whiteText12("Tambah Data"),
                          Expanded(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: EpregnancyColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
              margin: EdgeInsets.only(
                  left: 20, right: 20, bottom: 16.h, top: 17.h),
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Berat",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: EpregnancyColors.greyDarkFontColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${state.myChildDashboard?.growth?.weight ?? "-"} kg",
                          style: TextStyle(
                              fontSize: 24,
                              color: EpregnancyColors.primer,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // disable temporary
                        // Text(
                        //   state.myChildDashboard?.growthStatus?.weight ??
                        //       "Tidak ada data",
                        //   style: _styleBuilder(state.myChildDashboard
                        //       ?.growthStatus?.weight ??
                        //       "Tidak ada data"),
                        // ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.h),
                      width: 2,
                      height: 100,
                      color: EpregnancyColors.greyDivider,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tinggi",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: EpregnancyColors.greyDarkFontColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${state.myChildDashboard?.growth?.length ?? "-"} cm",
                          style: TextStyle(
                              fontSize: 24,
                              color: EpregnancyColors.primer,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // disable temporary
                        // Text(
                        //   state.myChildDashboard?.growthStatus?.length ??
                        //       "Tidak ada data",
                        //   style: _styleBuilder(state.myChildDashboard
                        //       ?.growthStatus?.length ??
                        //       "Tidak ada data"),
                        // ),
                      ],
                    ),
                    Container(
                      width: 2,
                      height: 100,
                      color: EpregnancyColors.greyDivider,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lingkar kepala",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: EpregnancyColors.greyDarkFontColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${state.myChildDashboard?.growth?.headCircumference ?? "-"} cm",
                          style: TextStyle(
                              fontSize: 24,
                              color: EpregnancyColors.primer,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //     state.myChildDashboard?.growthStatus
                        //         ?.headCircumference ??
                        //         "Tidak ada data",
                        //     style: _styleBuilder(state.myChildDashboard
                        //         ?.growthStatus?.headCircumference ??
                        //         "Tidak ada data")),
                      ],
                    ),
                    Container(
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: EpregnancyColors.primer,
                              size: 18,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => GrowthPage(childId: state.myChildDashboard!.child!.id!)));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  TextStyle _styleBuilder(String type) {
    if (type == "Normal") {
      return const TextStyle(
          fontSize: 12,
          color: EpregnancyColors.greenMight,
          fontWeight: FontWeight.bold);
    } else if (type == "Tidak ada data") {
      return const TextStyle(
          fontSize: 12,
          color: EpregnancyColors.greyText,
          fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(
          fontSize: 12,
          color: EpregnancyColors.jingga,
          fontWeight: FontWeight.bold);
    }
  }

  Widget _ageChild(MyChildDashboard? myChildDashboard) {
    if ((myChildDashboard?.child?.age?.year ?? 0) < 1 &&
        (myChildDashboard?.child?.age?.month ?? 0) < 1) {
      return blackText12W500("${myChildDashboard?.child?.age?.day ?? 0} Hari");
    } else if ((myChildDashboard?.child?.age?.year ?? 0) < 1 &&
        (myChildDashboard?.child?.age?.month ?? 0) >= 1) {
      return blackText12W500(
          "${myChildDashboard?.child?.age?.month ?? 0} Bulan ${myChildDashboard?.child?.age?.day ?? 0} Hari");
    } else {
      return blackText12W500(
          "${myChildDashboard?.child?.age?.year ?? 0} Tahun ${myChildDashboard?.child?.age?.month ?? 0} Bulan ${myChildDashboard?.child?.age?.day ?? 0} Hari");
    }
  }
}
