import 'dart:io';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/article_page/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../data/firebase/event/event_storage_example.dart';
import '../../utils/epragnancy_color.dart';
import '../article_page/bloc/article_bloc.dart';

class ListArticle extends StatelessWidget {
  List<ArticleModel>? listArticle = [];

  ListArticle({this.listArticle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 170.w,
      child: listArticle!.isEmpty
          ? Container(margin: EdgeInsets.only(), child: Container())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String outputDate = "";
                var outputFormat = DateFormat.yMMMMd('id');
                outputDate = outputFormat.format(DateTime.parse(
                    listArticle?[index].publishDate ?? "0000-00-00"));
                // 12/3
                return InkWell(
                      onTap: () {
                        Injector.resolve<ArticlePageBloc>().add(
                            ArticleReadEvent(listArticle?[index].id ?? ""));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticleDetailPage(
                                    article: listArticle?[index])));
                      },
                      child: Container(
                        height: 150.h,
                        margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                        decoration: listArticle![index].imageUrl != null &&
                                listArticle![index].imageUrl != ""
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      listArticle![index].imageUrl!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: EpregnancyColors.primer)
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: EpregnancyColors.primer),
                        child: Container(
                          height: 150.h,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: EpregnancyColors.primer.withAlpha(110)),
                          child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Wrap(
                                    //   // spacing: 5.w,
                                    //   children: [
                                    //     Container(
                                    //         width: 200,
                                    //         height: 85,
                                    //         margin: EdgeInsets.only(),
                                    //         child: Text(
                                    //           listArticle![index].title!,
                                    //           maxLines: 4,
                                    //           style: TextStyle(
                                    //               fontSize: 16,
                                    //               fontWeight: FontWeight.bold,
                                    //               color: Colors.white),
                                    //         )),
                                    //     // Align(
                                    //     //   alignment: Alignment.topRight,
                                    //     //   child: Container(
                                    //     //     padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.h),
                                    //     //     decoration: BoxDecoration(
                                    //     //         color: Colors.white,
                                    //     //         borderRadius: BorderRadius.circular(24.w)
                                    //     //     ),
                                    //     //     child: Row(
                                    //     //       children: [
                                    //     //         SvgPicture.asset("assets/icP.svg"),
                                    //     //         Text(" 50", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10.sp),)
                                    //     //       ],
                                    //     //     ),
                                    //     //   ),
                                    //     // ),
                                    //   ],
                                    // ),
                                    Container(
                                        width: 200,
                                        height: 85,
                                        margin: EdgeInsets.only(),
                                        child: Text(
                                          listArticle![index].title!,
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 16.h),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        child: Icon(
                                                          Icons.access_time,
                                                          color: Colors.white,
                                                          size: 12,
                                                        )),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                        child: Text(
                                                          outputDate,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.white),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                    color: EpregnancyColors.primer),
                                                height: 18,
                                                width: 60,
                                                child: Center(
                                                    child: Text(
                                                      "Berita",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ])),

                        ),
                      ),
                    );
              },
              itemCount: listArticle!.length,
            ),
    );
  }
}
