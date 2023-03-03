import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/model/baby_model/new_baby_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/epragnancy_color.dart';
import '../../utils/image_utils.dart';

class BabyTrackerDetail extends StatefulWidget {
  const BabyTrackerDetail({Key? key, required this.newBabyModel})
      : super(key: key);
  final NewBabyModel? newBabyModel;

  @override
  State<BabyTrackerDetail> createState() => _BabyTrackerDetailState();
}

class _BabyTrackerDetailState extends State<BabyTrackerDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BtnBackIosStyle(),
          centerTitle: true,
          title: Text(
            "Detail Bayi dan Bunda",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
          bottom: const TabBar(
              isScrollable: true,
              unselectedLabelColor: EpregnancyColors.greyDarkFontColor,
              labelColor: EpregnancyColors.primer,
              tabs: [
                Tab(
                  text: "Perkembangan",
                ),
                Tab(
                  text: "Ukuran",
                ),
                Tab(
                  text: "Perubahan Bunda",
                ),
              ]),
        ),
        body: TabBarView(children: <Widget>[
          // page perkembangan
          ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      EpregnancyColors.primerSoft2,
                      EpregnancyColors.white
                    ])),
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Hero(
                  tag: "baby-illustration",
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Center(
                      child: FadeInImage(
                        width: 200,
                        height: 200,
                        placeholder: AssetImage('assets/ic_no_photo.png'),
                        image: NetworkImage(ImageUtils.imageNetwork(
                            widget.newBabyModel!.illustrationImage ?? "")),
                        fit: BoxFit.fill,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/ic_no_photo.png',
                              width: 200, height: 200, fit: BoxFit.cover);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w,16.w,16.w,8.w),
                child: Text(
                  "Perkembangan Bayi dalam Rahim",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16.sp),
                ),
              ),
              Container( margin:EdgeInsets.symmetric(horizontal: 10),child: Html(data: widget.newBabyModel?.growthDescription))
            ],
          ),
          // page ukuran
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: EpregnancyColors.pink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.w)),
                  margin:
                      EdgeInsets.symmetric(horizontal: 78.w, vertical: 30.h),
                  child: DottedBorder(
                    padding: EdgeInsets.all(16.w),
                    color: EpregnancyColors.borderPink,
                    strokeWidth: 6.0,
                    radius: Radius.circular(8.w),
                    borderType: BorderType.RRect,
                    child: Center(
                        child: Text(
                      widget.newBabyModel?.sizeDescription ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12.sp),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Text(
                    DateFormat('dd MMM').format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: FadeInImage(
                      width: 80.w,
                      height: 80.h,
                      placeholder: AssetImage('assets/ic_no_photo.png'),
                      image: NetworkImage(ImageUtils.imageNetwork(
                          widget.newBabyModel!.sizeIllustrationImage ?? "")),
                      fit: BoxFit.fill,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80.w,
                          height: 80.h,
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.h, vertical: 16.h),
                  decoration: BoxDecoration(
                      color: EpregnancyColors.pinkDark,
                      borderRadius: BorderRadius.circular(8.w)),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icLength.svg",
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Panjang",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "± ${widget.newBabyModel?.length ?? 0} cm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icWeight.svg",
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Berat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "± ${(widget.newBabyModel?.weight ?? 0) / 100} kg",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3.h),
                    width: MediaQuery.of(context).size.width,
                    height: 200.h,
                    child: Image.asset("assets/dummies/perubahan_bunda_image.png", fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Text(
                      "Perubahan pada Tubuh Bunda",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Html(data: widget.newBabyModel?.symptomDescription),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
