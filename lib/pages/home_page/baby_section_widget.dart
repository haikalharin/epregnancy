import 'package:PregnancyApp/common/widget/btn_primary_white.dart';
import 'package:PregnancyApp/common/widget/primary_btn.dart';
import 'package:PregnancyApp/pages/home_page/baby_tracker_detail_page.dart';
import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/image_utils.dart';
import '../new_born_page/bloc/new_born_page_bloc.dart';
import '../profile_page/bloc/profile_page_bloc.dart';

class BabySectionWidget extends StatelessWidget {
  BabySectionWidget(
      {Key? key,
      this.one,
      required this.state,
      required this.tooltipController,
      required this.psTriggerTooltip, this.refresh, this.refreshIndicatorKey})
      : super(key: key);
  final GlobalKey? one;
  final HomePageState state;
  final JustTheController tooltipController;
  final PublishSubject<bool> psTriggerTooltip;
  final VoidCallback? refresh;
  final GlobalKey<LiquidPullToRefreshState>? refreshIndicatorKey;
  var duration = 0;

  Path defaultTailBuilder(Offset tip, Offset point2, Offset point3) {
    return Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(point2.dx, point2.dy)
      ..lineTo(point3.dx, point3.dy)
      ..close();
  }

  void _babyLostDialog(context) {
     showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return WillPopScope(
            child: Center(
              child: Container(
                width: 300.w,
                height: MediaQuery.of(dialogContext).size.height * 0.5,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.w))),
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Scrollbar(
                          isAlwaysShown: true,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ListView(
                              children: [
                                Center(
                                  child: SvgPicture.asset("assets/ic_baby_lost.svg"),
                                ),
                                SizedBox(height: 16.h,),
                                Center(
                                  child: Text(
                                    "Turut Berduka Cita",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "bold"),
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Text("Komunitaz turut prihatin atas kehilangan yang Bunda alami. Kami berharap Bunda dapat menemukan ketenangan dalam waktu sulit ini. Kedepannya kami tidak lagi mengirimkan pemberitahuan terkait kehamilan.",
                                textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                            padding:
                            EdgeInsets.fromLTRB(0.w, 24.w, 0.w, 0.w),
                            child: SizedBox(
                              height: 46.w,
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(4.w)),
                                  color: EpregnancyColors.primer,
                                  disabledColor: Colors.grey,
                                  child: Text('Setuju',
                                      style: TextStyle(
                                          fontFamily: "bold",
                                          fontSize: 13.sp,
                                          color: Colors.white)),
                                  onPressed: () {
                                    refresh?.call();
                                    Navigator.pop(dialogContext);
                                  }),
                            ))
                    ],
                  ),
                ),
              ),
            ),
            onWillPop: () => Future.value(false));
      },
    );
  }

  void _babyDeleteDialog(context, String babyId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
            child: Center(
              child: Container(
                width: 300.w,
                height: MediaQuery.of(context).size.height * 0.33,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Scrollbar(
                          isAlwaysShown: true,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ListView(
                              children: [
                                Center(
                                  child: Text(
                                    "Sebelum Hapus Data Anak",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: EpregnancyColors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "bold"),
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text("Apakah Anda Yakin? dengan mengkonfirmasi maka Profil Anak akan dihapus secara permanen.", textAlign: TextAlign.center, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),),
                                ),
                                SizedBox(height: 16.h,),
                                Container(
                                  child: BtnPrimary(
                                    text: "Ya, Hapus Data Anak",
                                    function: (){
                                      AppSharedPreference.remove("babyData");
                                      Injector.resolve<NewBornPageBloc>().add(DeleteBabyEvent(babyId));
                                      Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
                                      Injector.resolve<HomePageBloc>().add(FetchSimpleTipEvent());
                                      Injector.resolve<HomePageBloc>().add(const ResetBaby());
                                      Injector.resolve<ProfilePageBloc>().add(const InitialProfileEvent());
                                      // refreshIndicatorKey?.currentState?.activate();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Container(
                                  child: BtnPrimaryWhite(
                                    text: "Tidak, Nanti Saja",
                                    function: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onWillPop: () => Future.value(false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return state.showGuide!
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
            )]),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 8),
                    padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: EpregnancyColors.pink),
                              padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BabyTrackerDetail(
                                            newBabyModel: state.baby)));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      child: const Text(
                                    'Lihat Detail',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: EpregnancyColors.primer,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                  )),
                                  IconButton(
                                      onPressed: () {
                                        print("clicked lihat detail");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BabyTrackerDetail(
                                                        newBabyModel: state.baby)));
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: EpregnancyColors.grey,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  DateFormat('dd MMM').format(DateTime.now()),
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                ))
                          ],
                        ),
                        state.baby != null
                            ? InkWell(
                              onTap: () {
                                tooltipController.showTooltip(
                                    immediately: true);
                              },
                              child: Hero(
                                tag: "baby-illustration",
                                child: Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: Center(
                                    child: FadeInImage.memoryNetwork(
                                      placeholder:kTransparentImage,
                                      image:  ImageUtils.imageNetwork(
                                          state.baby!.illustrationImage ??
                                              ""),
                                      fit: BoxFit.fill,
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/ic_no_photo.png',
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : SizedBox(
                                width: 60.w,
                                height: 60.w,
                              ),
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 16, top: 16),
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Prakiraan Kelahiran: ',
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: EpregnancyColors.black),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: DateFormat('dd MMMM yyyy')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: EpregnancyColors.black))
                                  ]))),
                        ),

                      ],
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: psTriggerTooltip.stream,
                      builder: (context, snapshot) {
                        return  Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 130),
                              padding: EdgeInsets.only(top: 16,left: 24),
                              height: 150,
                              width: 190,
                              alignment: Alignment(0.3, -0.52),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/bg_tooltip.png'),
                                    fit: BoxFit.fill),
                              ),
                              child:  Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 6),
                                width: 180,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    state.baby?.textFromBaby ?? "",
                                    style: TextStyle(
                                        color:
                                        EpregnancyColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          )
        : Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: EpregnancyColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )]),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8),
                  padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: EpregnancyColors.pink),
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Text(
                              "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BabyTrackerDetail(
                                          newBabyModel: state.baby)));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: const Text(
                                  'Lihat Detail',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: EpregnancyColors.primer,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BabyTrackerDetail(
                                                      newBabyModel: state.baby)));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
                                      color: EpregnancyColors.grey,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                DateFormat('dd MMM').format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                maxLines: 3,
                              ))
                        ],
                      ),
                      state.baby != null
                          ? InkWell(
                            onTap: () {
                              tooltipController.showTooltip(
                                  immediately: true);
                            },
                            child: Hero(
                              tag: "baby-illustration",
                              child: Container(
                                margin: EdgeInsets.only(top: 34),
                                child: Center(
                                  child:  FadeInImage.memoryNetwork(
                                    placeholder:kTransparentImage,
                                    image:   ImageUtils.imageNetwork(
                                        state.baby!.illustrationImage ??
                                            ""),
                                    fit: BoxFit.fill,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/ic_no_photo.png',
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                          : SizedBox(
                              width: 60.w,
                              height: 60.w,
                            ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 16, top: 16),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Prakiraan Kelahiran: ',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: EpregnancyColors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: DateFormat('dd MMMM yyyy')
                                          .format(state.baby?.baby?.pregnancyAgeEstimatedBirth??DateTime.now()),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: EpregnancyColors.black))
                                ]))),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                RouteName.questionerNewBorn,
                                arguments: {
                                  "is_edit": false,
                                  "baby_id": state.baby?.baby?.id
                                }).then((value) {
                              if(value != null){
                                if(value == "lost-baby"){
                                  _babyLostDialog(context);
                                  Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
                                  Injector.resolve<HomePageBloc>().add(FetchSimpleTipEvent());
                                  Injector.resolve<HomePageBloc>().add(const ResetBaby());
                                  Injector.resolve<ProfilePageBloc>().add(const InitialProfileEvent());
                                } else if (value.toString().contains("delete-baby")){
                                  List strings = value.toString().split(" ");
                                  _babyDeleteDialog(context, strings[1]);
                                } else {
                                  refresh?.call();
                                }
                              }
                            });
                          },
                          child:int.parse(state.weeks!) >= 37? Container(
                            // width: MediaQuery.of(context).size.width/1.,
                            margin: EdgeInsets.only(bottom: 16),
                            width: MediaQuery.of(context).size.width * 0.55,
                            padding: EdgeInsets.only(left: 20.w,right: 20.w),
                            decoration: BoxDecoration(
                              color: EpregnancyColors.primer,
                              border: Border.all(
                                color: EpregnancyColors.primer,
                              ),
                              borderRadius:
                              BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: const Text(
                                      'Perbarui status kehamilan',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: EpregnancyColors.white,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    )),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons
                                            .arrow_forward_ios_rounded,
                                        size: 16,
                                        color: EpregnancyColors.white,
                                      )),
                                )
                              ],
                            ),
                          ):Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<bool>(
                    stream: psTriggerTooltip.stream,
                    builder: (context, snapshot) {
                      return  Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 110.w,top: 35.h),
                            padding: EdgeInsets.only(top: 16.h,left: 24.w),
                            height: 150.h,
                            width: 190.w,
                            alignment: Alignment(0.3, -0.52),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/bg_tooltip.png'),
                                  fit: BoxFit.fill),
                            ),
                            child:  Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 6),
                              width: 180,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  state.baby?.textFromBaby ?? "",
                                  style: TextStyle(
                                      color:
                                      EpregnancyColors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          );
  }
}
