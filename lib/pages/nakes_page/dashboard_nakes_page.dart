import 'package:PregnancyApp/pages/home_page/bloc/home_page_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/consultation_container.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../common/constants/router_constants.dart';
import '../../common/injector/injector.dart';
import '../article_page/list_shimmer_verticle.dart';
import '../home_page/list_article.dart';

class DashBoardNakesPage extends StatefulWidget {
  const DashBoardNakesPage({Key? key, required this.userName}) : super(key: key);
  final String? userName;

  @override
  State<DashBoardNakesPage> createState() => _DashBoardNakesPageState();
}

class _DashBoardNakesPageState extends State<DashBoardNakesPage> {

  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(HomeFetchDataEvent());
    Injector.resolve<HomePageBloc>().add(ArticleFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DASHBOARD HEADER
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, RouteName.profileNakesPage);
                              },
                                child: Text('Halo, ${widget.userName} ', style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 16.sp),)),
                            const Icon(Icons.arrow_forward_ios, color: EpregnancyColors.primer,)
                          ],
                        ),
                        Text(DateFormatter.dateFormatWithSpace.format(DateTime.now()), style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 14.sp),),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(StringConstant.consultation, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16.sp),),
                  ),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConsultationContainer(consultationEnum: ConsultationEnum.newest, value: 6, role: state.role??'',),
                        SizedBox(width: 20.w,),
                        ConsultationContainer(consultationEnum: ConsultationEnum.onGoing, value: 34, role: state.role??'',),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(StringConstant.newestIncomingMessage, style: TextStyle(color: EpregnancyColors.blackBack, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget( unread: false,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget(unread: true,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(RouteName.navBar, arguments: {'role': state.role??'', 'initial_index': 0, 'user_id':state.user?.id ??''});
                      },
                      child: Center(
                        child: Text(StringConstant.seeAllConsulation, style: TextStyle(color: EpregnancyColors.greyDarkFontColor),),
                      ),
                    ),
                  ),

                  // artikel section
                  Container(
                    // height: 200,
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: const Text(
                                        StringConstant.publishedArticle,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          RouteName.dashboardArticle);
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              margin:
                                              EdgeInsets.only(right: 5),
                                              child: Text(
                                                StringConstant.otherArticle,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    color: Colors.grey),
                                              )),
                                          Container(
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                state.submitStatus ==
                                    FormzStatus
                                        .submissionInProgress &&
                                    state.tipe == 'listArticle'
                                    ? Expanded(child: ListShimmer())
                                    : Expanded(
                                    child: ListArticle(
                                      listArticle: state.listArticle ?? [],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        }),
      floatingActionButton: Align(
        alignment: Alignment(0.9, 1),
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: MediaQuery
              .of(context)
              .size
              .width / 2,
          height: 50,
          child: RaisedButton(
            color: EpregnancyColors.primer,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.h),
                    child: Text("+", style: TextStyle(color: Colors.white, fontSize: 40.sp),),
                  ),
                  SizedBox(width: 10,),
                  Padding(
                    padding:  EdgeInsets.only(top: 3.h),
                    child: Text("Tambah Jadwal", style: TextStyle(color: Colors.white, fontSize: 14.sp),),
                  ),
                ],
              )
            ),
            elevation: 8,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed(RouteName.chooseTypeEvent);
            },
          ),
        ),
      ),
      );
  }
}
