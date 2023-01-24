import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/new_chat_room.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../data/entity/chat_message_entity.dart';
import '../../../data/model/chat_model/chat_pending_send_request.dart';
import '../../../data/model/hospital_model/hospital_model.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/epragnancy_color.dart';
import '../bloc/chat_bloc/chat_bloc.dart';

class InitialConsultationLoadPage extends StatefulWidget {
  const InitialConsultationLoadPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<InitialConsultationLoadPage> createState() => _InitialConsultationLoadPageState();
}

class _InitialConsultationLoadPageState extends State<InitialConsultationLoadPage> {
  List<ChatMessageEntity> chatMessageList = [];



  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) async {
        // todo listener chat patient
        print('state type : ${state.type}');
        if(state.type == 'fetch-active-chat-success'){
          List<ChatMessageEntity> chatMessageList = [];
          if(state.chatPendingPatientResponse?.isNotEmpty ?? false){
            state.chatPendingPatientResponse?.forEach((element) {
              print('fromId pending : ${element.fromId}');
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
              fromId: state.chatPendingPatientResponse?[0].fromId,
              toId: state.chatPendingPatientResponse?[0].hospital?.id,
              toImageUrl: state.chatPendingPatientResponse?[0].hospital?.imageUrl,
              chatMessageList: chatMessageList,
              toName: state.chatPendingPatientResponse?[0].hospital?.name,
              isArchive: false,
              pendingChat:  true,
            ))).then((value) {
              if(value != null){
                Navigator.pop(context, 'back');
              }
            });
          } else {
            // state.listPersonalChatRoom?.forEach((element) {
            //   chatMessageList.add(
            //       ChatMessageEntity(
            //           name: element.fromId,
            //           message: element.message,
            //           dateTime: element.createdDate,
            //           imageUrl: element.imageUrl,
            //           profileImage: element.fromId == widget.userId ? element.from?.imageUrl : element.to?.imageUrl,
            //           mine: element.fromId == widget.userId ? true: false
            //       )
            //   );
            // });
            for(var element in state.listPersonalChatRoom ?? []) {
              String _fromId = element.fromId;
              String? fromImageUrl = element.from?.imageUrl ;
              String? toImageUrl = element.to?.imageUrl;
              chatMessageList.add(
                    ChatMessageEntity(
                        name: _fromId,
                        message: element.message,
                        dateTime: element.createdDate,
                        imageUrl: element.imageUrl,
                        profileImage: _fromId != widget.userId ? toImageUrl : fromImageUrl,
                        mine: _fromId == widget.userId ? true: false
                    )
                );
            }
            print('ongoing chat length : ${chatMessageList.length}');
            // String? toId;
            // String? toName;
            // if(state.listPersonalChatRoom?[0].fromId == widget.userId){
            //   toId = state.listPersonalChatRoom?[0].toId;
            //   toName = state.listPersonalChatRoom?[0].to?.name;
            // } else {
            //   toId = state.listPersonalChatRoom?[0].fromId;
            //   toName = state.listPersonalChatRoom?[0].from?.name;
            // }

            String? _toId = state.listPersonalChatRoom?[0].toId;
            String? _toImageUrl = state.listPersonalChatRoom?[0].to?.imageUrl;
            String? _toName = await aesDecryptor(state.listPersonalChatRoom?[0].to?.name);
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
              fromId: widget.userId,
              toId: _toId,
              toImageUrl: _toImageUrl,
              chatMessageList: chatMessageList,
              toName: _toName,
              pendingChat:  false,
            ))).then((value) {
              if(value != null){
                Navigator.pop(context, 'back');
              }
            });
          }
        } else if (state.type == 'fetch-active-chat-failed' && state.status != FormzStatus.submissionInProgress) {
          // Navigator.pushNamed(context, RouteName.chatPage, arguments: widget.userId).then((value) {
          //   print('with data from chat page');
          //   if(value != null){
          //     Navigator.pop(context);
          //   }
          // });
          final UserModel userModel = await AppSharedPreference.getUser();
          final HospitalModel _hospital = await AppSharedPreference.getHospital();

          ChatPendingSendRequest _chatPendingSendRequest = ChatPendingSendRequest(fromId: userModel.id, hospitalId: _hospital.id, message: "Hai Bunda ${userModel.name}, selamat datang di tanya Bidan.");
          ChatPendingSendRequest _chatPendingSendRequest2 = ChatPendingSendRequest(fromId: userModel.id, hospitalId: _hospital.id, message: "Di sini, Bunda bisa bertanya mengenai informasi umum dan tips seputar kehamilan langsung dengan Bidan.");
          ChatPendingSendRequest _chatPendingSendRequest3 = ChatPendingSendRequest(fromId: userModel.id, hospitalId: _hospital.id, message: "Pertanyaan akan dijawab maksimal 3x24 jam. Yuk, Bunda bisa mulai bertanya.");

          Injector.resolve<ChatBloc>().add(SendChatPendingEvent(_chatPendingSendRequest, firsTime: true));
          await Future.delayed(const Duration(seconds: 1));
          Injector.resolve<ChatBloc>().add(SendChatPendingEvent(_chatPendingSendRequest2, firsTime: true));
          await Future.delayed(const Duration(seconds: 1));
          Injector.resolve<ChatBloc>().add(SendChatPendingEvent(_chatPendingSendRequest3, firsTime: true));
        } else if (state.type == 'send-pending-success' && state.chatPendingSendResponse != null) {
          chatMessageList.add(
              ChatMessageEntity(
                  name: state.chatPendingSendResponse?.from?.hospital?.name,
                  message: state.chatPendingSendResponse?.message,
                  dateTime: state.chatPendingSendResponse?.createdDate,
                  mine: state.chatPendingSendResponse?.fromId == widget.userId ? true: false
              )
          );
          print("chat message list pending : ${chatMessageList.length}");
          if(chatMessageList.length == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewChatRoom(
              fromId: state.chatPendingSendResponse?.fromId,
              toImageUrl: state.chatPendingSendResponse?.to?.imageUrl,
              toId: state.chatPendingSendResponse?.hospitalId,
              chatMessageList: chatMessageList,
              toName: state.chatPendingSendResponse?.to?.name ?? hospitalModel?.name ,
              pendingChat: true,
            ))).then((value) {
              if(value != null){
                print('back with data');
                Navigator.pop(context, "back");
              }
            });
          }
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

  HospitalModel? hospitalModel;

  void getHospital() async {
    HospitalModel _hospitalModel = await AppSharedPreference.getHospital();
    if(_hospitalModel != null && mounted){
      setState(() {
        hospitalModel = _hospitalModel;
      });
    }
  }

  @override
  void initState() {
    Injector.resolve<ChatBloc>().add(const FetchChatPendingPatientEvent());
    getHospital();
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
