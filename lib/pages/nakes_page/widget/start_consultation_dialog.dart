import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/pages/nakes_page/bloc/chat_pending_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/entity/chat_message_entity.dart';
import '../../../utils/epragnancy_color.dart';
import '../../chat_page/new_chat_room.dart';

class StartConsulationDialog extends StatefulWidget {
  const StartConsulationDialog({Key? key, required this.name, required this.hospitalId, required this.fromId, required this.userId}) : super(key: key);
  final String? name;
  final String? fromId;
  final String? hospitalId;
  final String? userId;

  @override
  State<StartConsulationDialog> createState() => _StartConsulationDialogState();
}

class _StartConsulationDialogState extends State<StartConsulationDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatPendingBloc, ChatPendingState>(
      listener: (context, state) {
        List<ChatMessageEntity> chatMessageList = [];
        if(state.type == 'responding-pending-chat-success'){
          Injector.resolve<ChatPendingBloc>().add(FetchChatPendingByHospitalId(widget.hospitalId));
          state.chatPendingResponseList?.forEach((element) {
            chatMessageList.add(
                ChatMessageEntity(
                    name: element.fromId,
                    message: element.message,
                    dateTime: element.createdDate,
                    profileImage: element.from?.imageUrl,
                    mine: false
                )
            );
          });
          print('ongoing chat length : ${chatMessageList.length}');
          print('fromid : ${state.chatPendingResponseList?[0].fromId}');
          print('toId : ${state.chatPendingResponseList?[0].toId}');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
            isNakes: true,
            fromId: state.chatPendingResponseList?[0].toId,
            toId: state.chatPendingResponseList?[0].fromId,
            toImageUrl: state.chatPendingResponseList?[0].from?.imageUrl,
            chatMessageList: chatMessageList,
            toName: state.chatPendingResponseList?[0].from?.name,
            pendingChat:  false,
          ))).then((value) {
            if(value != null){
              Navigator.pop(context, 'back');
            }
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        height: MediaQuery.of(context).size.height / 5.5,
        child: Column(
          children: [
            Text(
              "Apakah anda ingin memulai konsultasi dengan",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${widget.name} ?",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                EpregnancyColors.blueDark),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          Injector.resolve<ChatPendingBloc>().add(RespondPendingChat(hospitalId: widget.hospitalId, fromId: widget.fromId));
                        },
                        child: Center(
                          child: _isLoading ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ) : Text(
                            "Ya",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(EpregnancyColors.white),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: EpregnancyColors.blueDark)))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "Tidak",
                              style: TextStyle(
                                  color: EpregnancyColors.blueDark, fontSize: 16),
                            ),
                          )),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
