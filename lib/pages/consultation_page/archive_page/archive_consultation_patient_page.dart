import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/chat_page/bloc/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/router_constants.dart';
import '../../../data/model/hospital_model/hospital_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/epragnancy_color.dart';
import '../../../utils/string_constans.dart';
import '../../chat_page/chat_patient_page/initial_consultation_load_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BtnBackIosStyle(),
        title: Text('Arsip', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
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
                  return Container(
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
                        child: state.listArchiveChat?[index].to?.imageUrl != null ? Image.network(state.listArchiveChat![index].to!.imageUrl!) : Image.asset('assets/dummies/dummy_avatar.png'),
                      ),
                      title: Text(state.listArchiveChat?[index].to?.name ?? '', style: TextStyle(color: EpregnancyColors.blueDark, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                      subtitle: Text(state.listArchiveChat?[index].message?? '', style: TextStyle(color: EpregnancyColors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),),
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
                child: Text('Internal Server Error!', style: TextStyle(color: Colors.black),),
              ),
            );
          }
        },
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
