import 'package:PregnancyApp/pages/chat_page/empty_chat_list_page.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/start_consultation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../data/model/user_model_api/user_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';

class PendingChatTabPage extends StatefulWidget {
  const PendingChatTabPage({Key? key}) : super(key: key);

  @override
  State<PendingChatTabPage> createState() => _PendingChatTabPageState();
}

class _PendingChatTabPageState extends State<PendingChatTabPage> {
  String? _userId;


  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<ChatPendingBloc, ChatPendingState>(
      builder: (context, state) {
        if (state.chatPendingList?.length == 0) {
          return const EmptyChatListPage();
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.chatPendingList?.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                          child: StartConsulationDialog(
                            name: state.chatPendingList?[index].from?.name,
                            hospitalId: state.chatPendingList?[index].hospitalId,
                            fromId: state.chatPendingList?[index].fromId,
                            userId: _userId,
                          )
                        )
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget(
                        unread: false,
                        name: state.chatPendingList?[index].from?.name,
                        message: state.chatPendingList?[index].message
                    ),
                  ),
                );
              },
            ),
          );
        }
      }
    );
  }

  void getUserId() async {
    UserModel _userModel = await AppSharedPreference.getUser();
    if (_userModel != null && mounted) {
      setState(() {
        _userId = _userModel.id;
      });
    }
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }
}
