import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/epragnancy_color.dart';
import '../chat_page/empty_chat_list_page.dart';

class ArchiveNakesPage extends StatefulWidget {
  const ArchiveNakesPage({Key? key}) : super(key: key);

  @override
  State<ArchiveNakesPage> createState() => _ArchiveNakesPageState();
}

class _ArchiveNakesPageState extends State<ArchiveNakesPage> with AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    Injector.resolve<ChatBloc>().add(const FetchArchiveChatEvent());
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (conetxt, state){
          if(state.type == 'archive-chat-loading'){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state.type == 'archive-chat-success'){
            if(state.listArchiveChat?.length != 0) {
              return ListView.builder(
                itemCount: state.listArchiveChat?.length ?? 0,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget(
                        unread: true,
                        name: state.listArchiveChat![index].to?.name,
                        message: state.listArchiveChat![index].message),
                  );
                },
              );
            } else {
              if(state.listArchiveChat?.length != 0) {
                return ListView.builder(
                  itemCount: state.listArchiveChat?.length ?? 0,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ChatPlaceHolderWidget(
                          unread: true,
                          name: state.listArchiveChat![index].to?.name,
                          message: state.listArchiveChat![index].message),
                    );
                  },
                );
              } else {
                return const EmptyChatListPage();
              }
            }
          } else {
            if(state.listArchiveChat?.length != 0) {
              return ListView.builder(
                itemCount: state.listArchiveChat?.length ?? 0,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget(
                        unread: true,
                        name: state.listArchiveChat![index].to?.name,
                        message: state.listArchiveChat![index].message),
                  );
                },
              );
            } else {
              return const EmptyChatListPage();
            }
          }
        },
      ),
    );
  }
}
