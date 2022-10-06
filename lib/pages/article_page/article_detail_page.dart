import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../data/model/article_model/article_model.dart';
import '../../utils/epragnancy_color.dart';
import '../../utils/string_constans.dart';
import '../home_page/bloc/home_page_bloc.dart';
import 'list_body_article.dart';

class ArticleDetailPage extends StatelessWidget {
  ArticleModel? article = ArticleModel();

  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    String outputDate = "";
    var outputFormat = DateFormat.yMMMMd('id');
    outputDate = outputFormat.format(DateTime.parse(article?.createdDate?? "0000-00-00"));

    return WillPopScope(
      onWillPop: () {
        Injector.resolve<HomePageBloc>().add(PointFetchEvent());
        return Future.value(true);
      },
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  leading: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Injector.resolve<HomePageBloc>().add(PointFetchEvent());
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Container(),
                    background: Image(
                      image: NetworkImage(
                          article!.imageUrl != null && article!.imageUrl != ""
                              ? article!.imageUrl!
                              : StringConstant.imagenodata),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        "Berita",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                  ),
                                ),
                                Icon(Icons.ios_share),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      article!.title ?? '',
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                      child: Icon(
                                    Icons.access_time,
                                    size: 18,
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Text(
                                    outputDate,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  )),
                                ],
                              )),
                        ],
                      ),
                    ),
                  )),
                ),
              ];
            },
            body: ListBodyArticle(
              longDesc: article!.longDescription ?? "",
            )),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._widget);

  final Widget _widget;

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 120;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _widget,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
