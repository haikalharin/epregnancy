import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../common/constants/router_constants.dart';
import '../../utils/epragnancy_color.dart';

class BabySectionWidget extends StatelessWidget {
  const BabySectionWidget({Key? key, this.one, required this.state})
      : super(key: key);
  final GlobalKey? one;
  final HomePageState state;

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
                  borderRadius: BorderRadius.circular(8.0),
                  color: EpregnancyColors.primer),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  10.0),
                              color:
                              EpregnancyColors.primer),
                          height: 20,
                          width: 80,
                          child: Center(
                              child: Text(
                                "Minggu Pertama",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                          ),
                        ),
                        state.baby != null
                            ? Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  state.baby!.length != 0
                                      ? state.baby!.baby!.name ?? ""
                                      : "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                ))
                            : Container(),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.baby != null
                            ? Container(
                                // margin: EdgeInsets.only(left: 50, right: 50),
                                child: FadeInImage(
                                  placeholder:
                                      AssetImage('assets/ic_no_photo.png'),
                                  image: NetworkImage(
                                      state.baby!.illustrationImage ?? ""),
                                  width: 60.w,
                                  height: 60.h,
                                  fit: BoxFit.fill,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/ic_no_photo.png',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              )
                            : Container(
                                width: 60,
                                height: 60,
                              ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        width: 150.w,
                                        child: Text(
                                          state.baby != null
                                              ? state.baby!.textFromBaby ?? ""
                                              : '',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 5,
                                        )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    // Container(
                                    //   child:
                                    //       const Icon(
                                    //     Icons
                                    //         .arrow_forward_ios,
                                    //     color: Colors
                                    //         .white,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 200,
                                  child: Html(
                                      data: state.baby != null
                                          ? state.baby!.growthDescription!
                                          : '',
                                      style: {
                                        "body": Style(
                                            fontSize: FontSize(12.0),
                                            color: Colors.white,
                                            maxLines: 3),
                                      })),
                              Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    state.weeks != null
                                        ? "${state.weeks} Minggu ${state.days} Hari"
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              // InkWell(
                              //   onTap: (){
                              //     Navigator.of(
                              //         context)
                              //         .pushNamed(
                              //         RouteName
                              //             .surveyPageBaby,
                              //         arguments:
                              //         true);
                              //   },
                              //   child: Container(
                              //       decoration: BoxDecoration(
                              //           borderRadius:
                              //           BorderRadius
                              //               .circular(
                              //               6.0),
                              //           color: Colors
                              //               .white),
                              //       child: Container(
                              //         width: 210,
                              //         height: 30,
                              //         child: Center(
                              //           child:
                              //           Container(
                              //             child:
                              //             const Text(
                              //               "Ubah Profil Kehamilan ",
                              //               style: TextStyle(
                              //                   fontSize:
                              //                   14,
                              //                   color:
                              //                   EpregnancyColors.primer),
                              //               maxLines:
                              //               3,
                              //             ),
                              //           ),
                              //         ),
                              //       )),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: EpregnancyColors.white),
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
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(
                                20.0),
                            color:
                            EpregnancyColors.pink),
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: Text(
                          "Minggu ke- ${state.baby?.baby?.pregnancyAgeWeek}",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Row(
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

                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: EpregnancyColors.grey,
                              ))
                        ],
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
                      ? Container(
                    margin: EdgeInsets.only(top:16),
                        child: Center(
                          child: Container(
                    // margin: EdgeInsets.only(left: 50, right: 50),
                    child: FadeInImage(
                          placeholder:
                          AssetImage('assets/ic_no_photo.png'),
                          image: NetworkImage(
                              state.baby!.illustrationImage ?? ""),
                          fit: BoxFit.fill,
                          imageErrorBuilder:
                              (context, error, stackTrace) {
                            return Image.asset('assets/ic_no_photo.png',
                                width: 60, height: 60, fit: BoxFit.cover);
                          },
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
                        margin: EdgeInsets.only(bottom: 16,top: 16),
                        child: RichText(
                    text:  TextSpan(
                    text: 'Prakiraan Kelahiran: ',
                        style: const TextStyle(
                            fontSize: 13,
                            color: EpregnancyColors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: EpregnancyColors.black))
                        ]))),
                  ),
                ],
              ),
            ),
          );
  }
}
