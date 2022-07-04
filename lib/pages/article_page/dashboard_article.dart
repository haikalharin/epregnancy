import 'dart:io';
import 'dart:ui';

import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/article_page/tab_bar_article_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/person_model/person_model.dart';
import '../../common/injector/injector.dart';


class DashboardArticle extends StatefulWidget {
  @override
  _DashboardArticleState createState() => _DashboardArticleState();
}

class _DashboardArticleState extends State<DashboardArticle> {
  PersonModel? _myPerson;


  @override
  void initState() {
    Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            title: Container(child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
              builder: (context, state) {
                return  Container(
                  margin: EdgeInsets.only(right: 20, top: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:  BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize:  12),
                      hintText: 'Cari artikel...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                    ),
                  ),
                );
              },
            ),),
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                })),
        body: BlocBuilder<ArticlePageBloc, ArticlePageState>(
          builder: (context, state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 20, bottom: 30),

                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 20,right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Berita",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 2,),
                              Icon(Icons.filter_list),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: TabBarArticlePage(
                    listArticle: state.listArticle ?? [],)),

                ],
              ),
            );
          },
        ),
      ),
    );
  }


}
