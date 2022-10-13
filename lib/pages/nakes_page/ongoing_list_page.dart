import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:PregnancyApp/pages/chat_page/empty_chat_list_page.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/chat_placeholder_widget.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/start_consultation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../data/entity/chat_message_entity.dart';
import '../../data/model/user_model_api/user_model.dart';
import '../../data/shared_preference/app_shared_preference.dart';
import '../chat_page/new_chat_room.dart';

class OngoingListPage extends StatefulWidget {
  const OngoingListPage({Key? key}) : super(key: key);

  @override
  State<OngoingListPage> createState() => _OngoingListPageState();
}

class _OngoingListPageState extends State<OngoingListPage> {
  String? _userId;



  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        List<ChatMessageEntity> chatMessageList = [];
        if(state.type == 'chat-room-success'){
          Navigator.pop(context);
          state.listPersonalChatRoom?.forEach((element) {
            chatMessageList.add(
                ChatMessageEntity(
                    name: element.fromId,
                    message: element.message,
                    dateTime: element.createdDate,
                    profileImage: element.from?.imageUrl,
                    imageUrl:  element.imageUrl,
                    mine: element.fromId == _userId ? true : false
                )
            );
          });
          print('ongoing chat length : ${chatMessageList.length}');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
            // reversed karna dari sisi midwife
            isNakes: true,
            fromId: state.listPersonalChatRoom?[0].toId,
            toId: state.listPersonalChatRoom?[0].fromId,
            toImageUrl: state.listPersonalChatRoom?[0].to?.imageUrl,
            chatMessageList: chatMessageList,
            toName: state.listPersonalChatRoom?[0].from?.name,
            pendingChat:  false,
          ))).then((value) {
            if(value != null){
              Navigator.pop(context, 'back');
            }
          });
        }
      },
      child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
        if (state.listChatOngoing?.length == 0) {
          return const EmptyChatListPage();
        } else if (state.listChatOngoing == null) {
          return Center(child: CircularProgressIndicator(),);
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.listChatOngoing?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Injector.resolve<ChatBloc>().add(FetchPersonalChatRoom(state.listChatOngoing?[index].fromId));
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)
                            ),
                            child: Container(
                              width: 40.w,
                                height: 100.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20.h),
                                    Text("Loading...")
                                  ],
                                )
                            )
                        )
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ChatPlaceHolderWidget(
                        unread: false,
                        name: state.listChatOngoing![index].from?.name,
                        message: state.listChatOngoing![index].message),
                  ),
                );
              },
            ),
          );
        }
      }),
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
    Injector.resolve<ChatBloc>().add(FetchChatOngoingEvent());
    super.initState();
  }
}
