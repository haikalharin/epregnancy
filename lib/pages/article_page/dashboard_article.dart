import 'dart:io';
import 'dart:ui';

import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';
import 'package:PregnancyApp/pages/article_page/tab_bar_article_page.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../data/model/person_model/person_model.dart';
import '../../common/injector/injector.dart';
import '../../utils/string_constans.dart';
import 'list_article_vertical.dart';


class DashboardArticle extends StatefulWidget {
  @override
  _DashboardArticleState createState() => _DashboardArticleState();
}

class _DashboardArticleState extends State<DashboardArticle> {
  PersonModel? _myPerson;


  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
  builder: (context, state) {
    return WillPopScope(
      onWillPop: () {
        if(state.isSearch == true){
          Injector.resolve<ArticlePageBloc>().add(ArticleBackEvent());
          return Future.value(false);
        } else{
          Navigator.pop(context);
          return Future.value(true);
        }
      },
      child: Stack(
        children: [
            Scaffold(
              appBar: AppBar(
                  titleSpacing: 0,
                  title:   Align(
                    alignment: Alignment(-0.2,0),
                    child:
                     Container(
                          margin: EdgeInsets.only(right: 20, top: 12, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:  BorderRadius.circular(12),
                          ),
                          child:  TextField(
                            keyboardType: TextInputType.text,
                            onSubmitted: (value){
                              Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent("",keyword: value, isSearch: true));
                            },
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize:  12),
                              hintText: 'Cari artikel...',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14,left: 20,right: 20,bottom: 10),
                            ),
                          ),
                        ),


                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  leading: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onTap: () {
                        if(state.isSearch == true){
                          Injector.resolve<ArticlePageBloc>().add(ArticleBackEvent());
                        } else{
                          Navigator.pop(context);
                        }

                      })),
              body:  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 20, bottom: 16),

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

                            ],
                          ),
                        ),
                        Expanded(child: state.isSearch == true? ListArticleVertical(condition: "",isSearch: true):TabBarArticlePage()),

                      ],
                    ),
                  ),

            ),
          _Loading()
          ],
      ),
    );
  },
),
    );
  }
  
}
class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          if (state.submitStatus == FormzStatus.submissionInProgress) {
            return Container(
                color: Colors.white.withAlpha(90),
                child: Center(child: CircularProgressIndicator()));
          } else {
            return Text("");
          }
        });
  }
}

