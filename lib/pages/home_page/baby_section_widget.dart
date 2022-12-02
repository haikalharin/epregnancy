import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../common/constants/router_constants.dart';
import '../../utils/epragnancy_color.dart';

class BabySectionWidget extends StatelessWidget {
  const BabySectionWidget({Key? key, this.one, required this.state}) : super(key: key);
  final GlobalKey? one;
  final HomePageState state;

  @override
  Widget build(BuildContext context) {
    return state.showGuide! ? Showcase(
      key: one?? GlobalKey(),
      title: 'Selamat datang !',
      description: 'Anda akan dengan mudah mengetahui fase kehamilan dengan gambar interaktif yang menunjukkan kondisi janin Anda',
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(15.0),
            color: EpregnancyColors.primer),
        margin: EdgeInsets.only(
            left: 20, right: 20),
        child: Container(
          margin: EdgeInsets.only(
              left: 30, right: 30),
          padding: EdgeInsets.only(
              top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              state.baby != null
                  ? Container(
                  margin: EdgeInsets.only(
                      bottom: 10),
                  child: Text(
                    state.baby!.length !=
                        0
                        ? state.baby!.first.name!
                        : "",
                    style: TextStyle(
                        fontSize: 16,
                        color:
                        Colors.white,
                        fontWeight:
                        FontWeight
                            .bold),
                    maxLines: 3,
                  ))
                  : Container(),
              Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  state.babyProgressModel !=
                      null
                      ? Container(
                    // margin: EdgeInsets.only(left: 50, right: 50),
                    child: FadeInImage(
                      placeholder:
                      AssetImage(
                          'assets/ic_no_photo.png'),
                      image: NetworkImage(state
                          .babyProgressModel!
                          .iconUrl!),
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.fill,
                      imageErrorBuilder:
                          (context,
                          error,
                          stackTrace) {
                        return Image
                            .asset(
                          'assets/ic_no_photo.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit
                              .cover,
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
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                      10),
                                  width:
                                  150.w,
                                  child: Text(
                                    state.babyProgressModel !=
                                        null
                                        ? state
                                        .babyProgressModel!
                                        .title!
                                        : '',
                                    style: TextStyle(
                                        fontSize:
                                        14,
                                        color: Colors
                                            .white,
                                        fontWeight:
                                        FontWeight.bold),
                                    maxLines:
                                    5,
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
                            margin: EdgeInsets
                                .only(
                                bottom:
                                10),
                            width: 200,
                            child: Text(
                              state.babyProgressModel !=
                                  null
                                  ? state
                                  .babyProgressModel!
                                  .condition!
                                  : '',
                              style: TextStyle(
                                  fontSize:
                                  12,
                                  color: Colors
                                      .white),
                              maxLines: 3,
                            )),
                        Container(
                            margin: EdgeInsets
                                .only(
                                bottom:
                                20),
                            child: Text(
                              state.weeks !=
                                  null
                                  ? "${state.weeks} Minggu ${state.days} Hari"
                                  : '',
                              style: TextStyle(
                                  fontSize:
                                  12,
                                  color: Colors
                                      .white,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            )),
                        InkWell(
                          onTap: (){
                            Navigator.of(
                                context)
                                .pushNamed(
                                RouteName
                                    .surveyPageBaby,
                                arguments:
                                true);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      6.0),
                                  color: Colors
                                      .white),
                              child: Container(
                                width: 210,
                                height: 30,
                                child: Center(
                                  child:
                                  Container(
                                    child:
                                    const Text(
                                      "Ubah Profil Kehamilan ",
                                      style: TextStyle(
                                          fontSize:
                                          14,
                                          color:
                                          EpregnancyColors.primer),
                                      maxLines:
                                      3,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ) : Container(
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(15.0),
          color: EpregnancyColors.primer),
      margin: EdgeInsets.only(
          left: 20, right: 20),
      child: Container(
        margin: EdgeInsets.only(
            left: 30, right: 30),
        padding: EdgeInsets.only(
            top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            state.baby != null
                ? Container(
                margin: EdgeInsets.only(
                    bottom: 10),
                child: Text(
                  state.baby!.length !=
                      0
                      ? state.baby!.first.name!
                      : "",
                  style: TextStyle(
                      fontSize: 16,
                      color:
                      Colors.white,
                      fontWeight:
                      FontWeight
                          .bold),
                  maxLines: 3,
                ))
                : Container(),
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                state.babyProgressModel !=
                    null
                    ? Container(
                  // margin: EdgeInsets.only(left: 50, right: 50),
                  child: FadeInImage(
                    placeholder:
                    AssetImage(
                        'assets/ic_no_photo.png'),
                    image: NetworkImage(state
                        .babyProgressModel!
                        .iconUrl!),
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.fill,
                    imageErrorBuilder:
                        (context,
                        error,
                        stackTrace) {
                      return Image
                          .asset(
                        'assets/ic_no_photo.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit
                            .cover,
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
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                    10),
                                width:
                                150.w,
                                child: Text(
                                  state.babyProgressModel !=
                                      null
                                      ? state
                                      .babyProgressModel!
                                      .title!
                                      : '',
                                  style: TextStyle(
                                      fontSize:
                                      14,
                                      color: Colors
                                          .white,
                                      fontWeight:
                                      FontWeight.bold),
                                  maxLines:
                                  5,
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
                          margin: EdgeInsets
                              .only(
                              bottom:
                              10),
                          width: 200,
                          child: Text(
                            state.babyProgressModel !=
                                null
                                ? state
                                .babyProgressModel!
                                .condition!
                                : '',
                            style: TextStyle(
                                fontSize:
                                12,
                                color: Colors
                                    .white),
                            maxLines: 3,
                          )),
                      Container(
                          margin: EdgeInsets
                              .only(
                              bottom:
                              20),
                          child: Text(
                            state.weeks !=
                                null
                                ? "${state.weeks} Minggu ${state.days} Hari"
                                : '',
                            style: TextStyle(
                                fontSize:
                                12,
                                color: Colors
                                    .white,
                                fontWeight:
                                FontWeight
                                    .bold),
                          )),
                      InkWell(
                        onTap: (){
                          Navigator.of(
                              context)
                              .pushNamed(
                              RouteName
                                  .surveyPageBaby,
                              arguments:
                              true);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    6.0),
                                color: Colors
                                    .white),
                            child: Container(
                              width: 210,
                              height: 30,
                              child: Center(
                                child:
                                Container(
                                  child:
                                  const Text(
                                    "Ubah Profil Kehamilan ",
                                    style: TextStyle(
                                        fontSize:
                                        14,
                                        color:
                                        EpregnancyColors.primer),
                                    maxLines:
                                    3,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
