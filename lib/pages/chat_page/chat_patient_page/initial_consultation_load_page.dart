import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/new_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../data/entity/chat_message_entity.dart';
import '../../../utils/epragnancy_color.dart';
import '../bloc/chat_bloc/chat_bloc.dart';

class InitialConsultationLoadPage extends StatefulWidget {
  const InitialConsultationLoadPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<InitialConsultationLoadPage> createState() => _InitialConsultationLoadPageState();
}

class _InitialConsultationLoadPageState extends State<InitialConsultationLoadPage> {



  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        // todo listener chat patient
        print('state type : ${state.type}');
        if(state.type == 'fetch-active-chat-success'){
          List<ChatMessageEntity> chatMessageList = [];
          if(state.chatPendingPatientResponse?.content?.isNotEmpty ?? false){
            state.chatPendingPatientResponse?.content?.forEach((element) {
              chatMessageList.add(
                  ChatMessageEntity(
                      name: element.fromId,
                      message: element.message,
                      dateTime: element.createdDate,
                      profileImage: element.fromId == widget.userId ? element.from?.imageUrl : element.hospital?.imageUrl,
                      mine: element.fromId == widget.userId ? true: false
                  )
              );
            });
            print('pending chat length : ${chatMessageList.length}');
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
              fromId: state.chatPendingPatientResponse?.content?[0].fromId,
              toId: state.chatPendingPatientResponse?.content?[0].hospital?.id,
              toImageUrl: state.chatPendingPatientResponse?.content?[0].hospital?.imageUrl,
              chatMessageList: chatMessageList,
              toName: state.chatPendingPatientResponse?.content?[0].hospital?.name,
              pendingChat:  true,
            ))).then((value) {
              if(value != null){
                Navigator.pop(context, 'back');
              }
            });
          } else {
            state.listPersonalChatRoom?.forEach((element) {
              chatMessageList.add(
                  ChatMessageEntity(
                      name: element.fromId,
                      message: element.message,
                      dateTime: element.createdDate,
                      profileImage: element.fromId == widget.userId ? element.from?.imageUrl : element.to?.imageUrl,
                      mine: element.fromId == widget.userId ? true: false
                  )
              );
            });
            print('ongoing chat length : ${chatMessageList.length}');
            String? toId;
            String? toName;
            // if(state.listPersonalChatRoom?[0].fromId == widget.userId){
            //   toId = state.listPersonalChatRoom?[0].toId;
            //   toName = state.listPersonalChatRoom?[0].to?.name;
            // } else {
            //   toId = state.listPersonalChatRoom?[0].fromId;
            //   toName = state.listPersonalChatRoom?[0].from?.name;
            // }
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
              fromId: widget.userId,
              toId: state.listPersonalChatRoom?[0].toId,
              toImageUrl: state.listPersonalChatRoom?[0].to?.imageUrl,
              chatMessageList: chatMessageList,
              toName: state.listPersonalChatRoom?[0].to?.name,
              pendingChat:  false,
            ))).then((value) {
              if(value != null){
                Navigator.pop(context, 'back');
              }
            });
          }
        } else if (state.type == 'fetch-active-chat-failed' && state.status != FormzStatus.submissionInProgress) {
          Navigator.pushNamed(context, RouteName.chatPage, arguments: widget.userId).then((value) {
            print('with data from chat page');
            if(value != null){
              Navigator.pop(context);
            }
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BtnBackIosStyle(),
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20.h,),
              Text('Mohon tunggu sebentar ...')
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 40.h,
            margin:  EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
            child: ElevatedButton(
                child: const Text('Batalkan', style: TextStyle(color: EpregnancyColors.primer),),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(EpregnancyColors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: EpregnancyColors.primer)
                        )
                    )
                )
            )),
      ),
    );
  }

  @override
  void initState() {
    Injector.resolve<ChatBloc>().add(const FetchChatPendingPatientEvent());
    // Injector.resolve<ChatBloc>().add(const FetchChatOngoingEvent());
    super.initState();
  }

  @override
  void dispose() {
    print('disponse');
    Injector.resolve<ChatBloc>().add(const DisposeChatBlocEvent());
    super.dispose();
  }
}
