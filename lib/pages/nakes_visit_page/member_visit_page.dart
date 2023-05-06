import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/visit_card_item_list.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/function_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import '../home_page/bloc/home_page_bloc.dart';

class MemberVisitPage extends StatefulWidget {
  const MemberVisitPage({Key? key}) : super(key: key);

  @override
  State<MemberVisitPage> createState() => _MemberVisitPageState();
}

class _MemberVisitPageState extends State<MemberVisitPage> {
  @override
  void initState() {
    Injector.resolve<HomePageBloc>().add(
        const ChangeDataVisitEvent(
            UserVisitModel()));
    Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0));
    super.initState();
  }

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BtnBackIosStyle(),
          title: Text(
            "Kunjungan Anggota",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            return state.listUserVisitModel != null?
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: LazyLoadScrollView(
                      isLoading: state.submitStatus ==
                          FormzStatus.submissionInProgress &&
                          state.tipe == "get-next-page-list_user-visit",
                      onEndOfPage: () {
                        if (!state.lastPageListVisit) {
                          Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0,isNextPage: true));
                        }
                      },
                      child: LiquidPullToRefresh(
                        color: EpregnancyColors.primer,
                        key: _refreshIndicatorKey,
                        onRefresh: () async {
                          Injector.resolve<HomePageBloc>().add(FetchListVisitEvent(0));

                        },
                        child: Center(
                            child: Stack(
                              children: [
                                    ListView.builder(
                                    itemCount: state.listUserVisitModel?.length,
                                    itemBuilder: (_, index) {
                                      bool isSameDate = true;
                                      final String dateString = state.listUserVisitModel?[index].createdDate??'0000-00-00';
                                      final DateTime date = DateTime.parse(dateString);
                                      final item = state.listUserVisitModel?[index];
                                      if (index == 0) {
                                        isSameDate = false;
                                      } else {
                                        final String prevDateString = state.listUserVisitModel?[index - 1].createdDate??'';
                                        final DateTime prevDate = DateTime.parse(
                                            prevDateString);
                                        isSameDate = date.isSameDate(prevDate);
                                      }
                                      if (index == 0 || !(isSameDate)) {
                                        return Column(children: [
                                          // Text(date.formatDate()),
                                      Padding(
                                            padding: EdgeInsets.only(left: 16.w, bottom: 4.h, top: 16.h),
                                            child: Text(date.formatDate(), style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w700), ),
                                          ),
                                          VisitCardItemList(withButton: true, userVisitModel: item,),
                                          // ListTile(title: Text('item $index'))
                                        ]);
                                      } else {
                                        return  VisitCardItemList(withButton: true, userVisitModel: item);
                                      }
                                    }),
                                _Loading()
                                  ],
                            )),
                      ),
                    ),
                  ),
                ),
                (state.submitStatus == FormzStatus.submissionInProgress &&
                    state.tipe == 'get-next-page-list_user-visit')
                    ? _LoadingBottom()
                    : Container()
              ],
            ):Container();
          },
        )
    );
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.tipe == 'get-next-page-list_user-visit') {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            color: Colors.white.withAlpha(90),
            child: Center(
                child: CircularProgressIndicator(
                  color: EpregnancyColors.primer,
                )));
      } else {
        return Text("");
      }
    });
  }}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.tipe == "fetching-list-user-visit") {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Text("");
      }
    });
  }
}
