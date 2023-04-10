import 'package:PregnancyApp/data/model/baby_progress_model/simple_tip_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../common/injector/injector.dart';
import '../../utils/countly_analytics.dart';
import '../../utils/epragnancy_color.dart';
import '../article_page/article_detail_page.dart';
import '../article_page/bloc/article_bloc.dart';

class TipsKehamilanPage extends StatefulWidget {
   const TipsKehamilanPage({Key? key, required this.simpleTipResponse}) : super(key: key);
  final SimpleTipResponse simpleTipResponse;

  @override
  State<TipsKehamilanPage> createState() => _TipsKehamilanPageState();
}

class _TipsKehamilanPageState extends State<TipsKehamilanPage> {

  @override
  void initState() {
    CountlyAnalyticsService(context)
        .basicEvent({
      'key':
      'Tumbnail_tips_home_page',
      'count': 1
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 20, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: EpregnancyColors.white),
          borderRadius:
          BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color:
              Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,
                  3), // changes position of shadow
            )
          ]),
      child: Column(
        children: [
          Container(
            height: 20,
            width: 20,
            // margin: EdgeInsets.only(left: 50, right: 50),
            child: SvgPicture.asset(
              'assets/ic_tips.svg',
              height: 20,
              width: 20,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // todo simple tip
          Text(
            widget.simpleTipResponse.tips ?? "",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocListener<ArticlePageBloc,
              ArticlePageState>(
            listener: (context, state) {
              if (state.articleModel != null &&
                  state.submitStatus ==
                      FormzStatus
                          .submissionSuccess &&
                  state.type ==
                      'success-read-tips') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailPage(
                              article: state
                                  .articleModel,
                            )));
              }
            },
            child: widget.simpleTipResponse
                .articleId !=
                null
                ? Align(
              alignment:
              Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  CountlyAnalyticsService(
                      context)
                      .basicEvent({
                    'key':
                    'Tumbnail_tips_home_page_button_baca_article',
                    'count': 1
                  });
                  Injector.resolve<
                      ArticlePageBloc>()
                      .add(ArticleReadEvent(
                      widget.simpleTipResponse
                          .articleId ??
                          "",
                      isFromTips:
                      true));
                },
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .end,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .end,
                  children: [
                    Text(
                      "Baca Artikel",
                      style: TextStyle(
                          color:
                          EpregnancyColors
                              .primer,
                          fontSize: 12.sp,
                          fontWeight:
                          FontWeight
                              .w700),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons
                          .arrow_forward_ios_rounded,
                      color:
                      EpregnancyColors
                          .primer,
                      size: 14.w,
                    )
                  ],
                ),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}
