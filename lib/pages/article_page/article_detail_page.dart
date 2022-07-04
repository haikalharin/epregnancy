import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/article_model/article_model.dart';
import 'list_body_article.dart';

class ArticleDetailPage extends StatelessWidget {
  ArticleModel? article = ArticleModel.empty();

  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    String outputDate = "";
    var outputFormat = DateFormat.yMMMMd('id');
    outputDate = outputFormat.format(
        DateTime.parse(article!.createdDate!));

    return Scaffold(
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
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Container(),
                background: Image(
                  image: NetworkImage(article!.cardImgURL!),
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
                            Icon(Icons.photo),
                            Icon(Icons.download_rounded),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                article!.title!,
                                maxLines: 5,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                        children: [
                          Container(child: Icon(Icons.access_time,size: 12,)),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              child: Text(
                                outputDate,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
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
          listBodyArticle : article!.content ?? [],
        )
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
  double get maxExtent => 100;

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
