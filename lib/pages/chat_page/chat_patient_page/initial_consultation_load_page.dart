import 'package:PregnancyApp/common/constants/router_constants.dart';
import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/new_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

import '../../../utils/epragnancy_color.dart';
import '../bloc/chat_bloc/chat_bloc.dart';

class InitialConsultationLoadPage extends StatefulWidget {
  const InitialConsultationLoadPage({Key? key}) : super(key: key);

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewChatRoom())).then((value) {
            if(value != null){
              Navigator.pop(context);
            }
          });
        } else if (state.type == 'fetch-active-chat-failed' && state.status != FormzStatus.submissionInProgress) {
          Navigator.pushNamed(context, RouteName.chatPage);
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
