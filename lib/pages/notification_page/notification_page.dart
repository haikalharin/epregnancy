import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:PregnancyApp/pages/notification_page/widget/list_notification_widget.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/injector/injector.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    Injector.resolve<NotificationBloc>().add(const NotificationFetchEvent(0));
  }

  @override
  void initState() {
    super.initState();

    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        title: blackText16("Notifikasi"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<NotificationBloc, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(color: Colors.white),
                child: state.listNotification == null
                    ? Stack(children: [
                        Container(margin: EdgeInsets.only(), child: Container())
                      ])
                    : state.listNotification!.isEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: Text("Belum ada notifikasi")))
                        : Stack(
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: LazyLoadScrollView(
                                      isLoading: state.submitStatus ==
                                              FormzStatus
                                                  .submissionInProgress &&
                                          state.type ==
                                              "get-next-page-notification",
                                      onEndOfPage: () {
                                        if (!state.last) {
                                          Injector.resolve<NotificationBloc>()
                                              .add(const NotificationFetchEvent(
                                                  0,
                                                  isNextPage: true));
                                        }
                                      },
                                      child: Scrollbar(
                                        child: LiquidPullToRefresh(
                                            color: EpregnancyColors.primer,
                                            key: _refreshIndicatorKey,
                                            onRefresh: _handleRefresh,
                                            showChildOpacityTransition: false,
                                            child:
                                                const ListNotificationWidget()),
                                      ),
                                    ),
                                  ),
                                  (state.submitStatus ==
                                              FormzStatus
                                                  .submissionInProgress &&
                                          state.type ==
                                              'get-next-page-notification')
                                      ? _LoadingBottom()
                                      : Container()
                                ],
                              ),
                            ],
                          ));
          },
        ),
      ),
    );
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
              state.type == 'get-next-page-notification' ||
          state.type == 'fetching-notifications') {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white.withAlpha(90),
            child: const Center(
                child: CircularProgressIndicator(
              color: EpregnancyColors.primer,
            )));
      } else {
        return const Text("");
      }
    });
  }
}
