import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import '../../../common/constants/router_constants.dart';
import '../../../data/entity/chat_message_entity.dart';
import '../../../data/model/hospital_model/hospital_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/epragnancy_color.dart';
import '../../../utils/string_constans.dart';
import '../../chat_page/chat_patient_page/initial_consultation_load_page.dart';
import '../../chat_page/new_chat_room.dart';

class ArchiveConsultationPatientPage extends StatefulWidget {
  const ArchiveConsultationPatientPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<ArchiveConsultationPatientPage> createState() => _ArchiveConsultationPatientPageState();
}

class _ArchiveConsultationPatientPageState extends State<ArchiveConsultationPatientPage> {
  HospitalModel? _hospitalModel;

  void getHospitalFromLocal() async {
    HospitalModel _hospital = await AppSharedPreference.getHospital();
    if (_hospital != null && mounted) {
      setState(() {
        _hospitalModel = _hospital;
      });
    }
  }


  @override
  void initState() {
    getHospitalFromLocal();
    Injector.resolve<ChatBloc>().add(const FetchArchiveChatEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BtnBackIosStyle(),
        title: Text('Arsip', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: BlocListener<ChatBloc, ChatState>(
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
                      mine: element.fromId == widget.userId ? true : false
                  )
              );
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewChatRoom(
              // reversed karna dari sisi midwife
              isNakes: false,
              fromId: state.listPersonalChatRoom?[0].fromId,
              toId: state.listPersonalChatRoom?[0].toId,
              toImageUrl: state.listPersonalChatRoom?[0].to?.imageUrl,
              chatMessageList: chatMessageList,
              toName: state.listPersonalChatRoom?[0].to?.name,
              pendingChat:  false,
              isArchive: true,
            ))).then((value) {
              Injector.resolve<ChatBloc>().add(const FetchArchiveChatEvent());
              // if(value != null){
              //   Navigator.pop(context, 'back');
              // }
            });
          } else if (state.type == 'chat-room-empty'){
            Navigator.pop(context);
            Toast.show("Chat Telah Expired!");
          }
        },
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (conetxt, state){
            if(state.type == 'archive-chat-loading'){
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state.type == 'archive-chat-success' || state.type == 'chat-room-empty'){
              if(state.listArchiveChatByFrom?.length != 0) {
                return ListView.builder(
                  itemCount: state.listArchiveChatByFrom?.length ?? 0,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Injector.resolve<ChatBloc>().add(FetchPersonalChatRoom(state.listArchiveChatByFrom?[index]?.toId, true));
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
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle
                            ),
                            child: state.listArchiveChatByFrom?[index]!.to?.imageUrl != null ? Image.network(state.listArchiveChatByFrom![index]!.from!.imageUrl!) : Image.asset('assets/dummies/dummy_avatar.png'),
                          ),
                          title: Text(state.listArchiveChatByFrom?[index]!.to?.name ?? '', style: TextStyle(color: EpregnancyColors.blueDark, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                          subtitle: Text(state.listArchiveChatByFrom?[index]!.message?? '', style: TextStyle(color: EpregnancyColors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text('Tidak Ada Data Archive', style: TextStyle(color: Colors.black),),
                  ),
                );
              }
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text('Belum Ada Konsultasi Yang Telah Selesai!', style: TextStyle(color: Colors.black),),
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 10.h),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    EpregnancyColors.blueDark),
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
            onPressed: () {
              if(_hospitalModel == null){
                Navigator.pushNamed(context, RouteName.locationSelect).then((value) {
                  if(value != null){
                    setState(() {
                      _hospitalModel = value as HospitalModel?;
                    });
                  }
                });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InitialConsultationLoadPage(userId: widget.userId,)));
              }
            },
            child: Center(
              child: Text(
                StringConstant.startConsultation,
                style: TextStyle(
                    color: Colors.white, fontSize: 16),
              ),
            )),
      ),
    );
  }
}
