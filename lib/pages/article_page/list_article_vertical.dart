import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/article_page/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/injector/injector.dart';
import '../../main_default.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/article_bloc.dart';

class ListArticleVertical extends StatefulWidget {
  List<ArticleModel>? listArticle = [];
  String? condition = '';
  bool? isSearch = false;

  ListArticleVertical(
      {this.listArticle, this.condition, this.isSearch = false});

  @override
  State<ListArticleVertical> createState() => _ListArticleVerticalState();
}

class _ListArticleVerticalState extends State<ListArticleVertical> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(widget.condition ?? "", 0));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>()
          .add(ArticleFetchEvent(widget.condition ?? "", 0));
    }

    super.initState();
  }

  var articleBgColor = [
    EpregnancyColors.coolGreen,
    EpregnancyColors.periwinkle,
    EpregnancyColors.rosePink
  ];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(color: Colors.white),
              child: state.listArticle == null
                  ? Stack(children: [
                      Container(margin: EdgeInsets.only(), child: Container())
                    ])
                  : state.listArticle!.isEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: Text("Artikel tidak tersedia")))
                      : Stack(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: LazyLoadScrollView(
                                    isLoading: state.submitStatus ==
                                            FormzStatus.submissionInProgress &&
                                        state.type == "get-next-page-article",
                                    onEndOfPage: () {
                                      if (!state.last) {
                                        if (widget.isSearch == true) {
                                          Injector.resolve<ArticlePageBloc>()
                                              .add(ArticleFetchEvent("", 0,
                                                  keyword: state.keyword,
                                                  isNextPage: true,
                                                  isSearch: true));
                                        } else {
                                          Injector.resolve<ArticlePageBloc>()
                                              .add(ArticleFetchEvent(
                                                  widget.condition ?? "", 0,
                                                  isNextPage: true));
                                        }
                                      }
                                    },
                                    child: Scrollbar(
                                      child: LiquidPullToRefresh(
                                          color: EpregnancyColors.primer,
                                          key: _refreshIndicatorKey,
                                          onRefresh: _handleRefresh,
                                          showChildOpacityTransition: false,
                                          child: _ListArticleBody(articleBgColor)),
                                    ),
                                  ),
                                ),
                                (state.submitStatus ==
                                            FormzStatus.submissionInProgress &&
                                        state.type == 'get-next-page-article')
                                    ? _LoadingBottom()
                                    : Container()
                              ],
                            ),
                          ],
                        ));
        },
      ),
    );
  }
}

class _ListArticleBody extends StatelessWidget {
  _ListArticleBody(this.articleBgColor);

  List<Color> articleBgColor = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          String outputDate = "";
          var outputFormat = DateFormat.yMMMMd('id');
          outputDate = outputFormat.format(DateTime.parse(
              state.listArticle![index].publishDate ?? "0000-00-00"));
          // 12/3
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Injector.resolve<ArticlePageBloc>().add(
                      ArticleReadEvent(state.listArticle![index].id ?? ""));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticleDetailPage(
                              article: state.listArticle![index])));
                },
                child: Container(
                  height: 150,
                  // padding: EdgeInsets.,
                  decoration: BoxDecoration(
                    image: state.listArticle != null &&
                            state.listArticle![index].imageUrl != ''
                        ? DecorationImage(
                            image: NetworkImage(
                                state.listArticle![index].imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image:
                                new AssetImage('assets/article-default-bg.png'),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: articleBgColor[Random().nextInt(3)],
                  ),
                  // color: Colors.greenAccent,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: EpregnancyColors.primer.withAlpha(110)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Expanded(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    margin: EdgeInsets.only(),
                                    child: Text(
                                      state.listArticle![index].title!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ],
                              )),
                            ])),
                      ],
                    ),
                  ),
                ),
              ),
              index == state.listArticle!.length - 1
                  ? SizedBox(height: 20)
                  : Container()
            ],
          );
        },
        itemCount: state.listArticle!.length,
      );
    });
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'get-next-page-article') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.white.withAlpha(90),
            child: Center(
                child: CircularProgressIndicator(
              color: EpregnancyColors.primer,
            )));
      } else {
        return Text("");
      }
    });
  }
}
