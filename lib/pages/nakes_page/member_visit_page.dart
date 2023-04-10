import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/visit_card_item_list.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberVisitPage extends StatefulWidget {
  const MemberVisitPage({Key? key}) : super(key: key);

  @override
  State<MemberVisitPage> createState() => _MemberVisitPageState();
}

class _MemberVisitPageState extends State<MemberVisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        title: Text("Kunjungan Anggota", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16.sp),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 4.h, top: 16.h),
            child: Text("Hari ini", style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w700), ),
          ),
          VisitCardItemList(withButton: true),
          VisitCardItemList(withButton: false),
          VisitCardItemList(),
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 4.h, top: 16.h),
            child: Text(DateFormatter.dateWithDay.format(DateTime.now()), style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w700), ),
          ),
          VisitCardItemList(withButton: true),
          VisitCardItemList(withButton: false),
          VisitCardItemList(),
        ],
      ),
    );
  }
}
