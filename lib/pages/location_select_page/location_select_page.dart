import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/pages/location_select_page/location_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/shared_preference/app_shared_preference.dart';
import '../../utils/epragnancy_color.dart';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({Key? key}) : super(key: key);

  @override
  State<LocationSelectPage> createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  bool haveBpjs = false;
  int bpjsValue = 0;
  HospitalModel? _hospitalModel;

  void getHospitalFromLocal() async {
    HospitalModel _hospital = await AppSharedPreference.getHospital();
    if(_hospital != null && mounted){
      setState(() {
        _hospitalModel = _hospital;
      });
    }
  }

  void getBpjsStatus() async {
    bool? _haveBpjs = await AppSharedPreference.getBool(AppSharedPreference.haveBpjsorKis);
    if(_haveBpjs != null && mounted){
      setState(() {
        haveBpjs = _haveBpjs;
        if(haveBpjs){
          bpjsValue = 1;
        } else {
          bpjsValue = 0;
        }
      });
    }
  }


  @override
  void initState() {
    getHospitalFromLocal();
    getBpjsStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BtnBackIosStyle(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/image_kepesertaan.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                child: Text(
                  'Data Kepesertaan',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 32.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
                child: Text(
                  'Lokasi dan Kepemilikan BPJS / KIS',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 20.h),
                child: Text(
                  'Lokasi Puskesmas',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  LocationListPage(currentHospital: _hospitalModel?.name,))).then((value) {
                    if(value != null){
                      setState(() {
                        _hospitalModel = value;
                      });
                    }
                  });
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: EpregnancyColors.borderGrey, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _hospitalModel?.name ?? 'Pilih Puskesmas',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SvgPicture.asset(
                        'assets/icLocation.svg',
                        color: EpregnancyColors.primer,
                        width: 20.w,
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 20.h),
                child: Text(
                  'Apakah anda memiliki BPJS / KIS ?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ),
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                padding: EdgeInsets.only(
                    left: 20.w, right:9.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: EpregnancyColors.borderGrey, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ada'),
                    Radio(
                      value: 1,
                      groupValue: bpjsValue,
                      onChanged: (val){
                        setState(() {
                          bpjsValue = (val as int?)!;
                          haveBpjs = true;
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                padding: EdgeInsets.only(
                    left: 20.w, right: 9.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: EpregnancyColors.borderGrey, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tidak Ada'),
                    Radio(
                      value: 0,
                      groupValue: bpjsValue,
                      onChanged: (val){
                        setState(() {
                          bpjsValue = (val as int?)!;
                          haveBpjs = false;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 40.h,
          margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
          child: ElevatedButton(
              child: Text(
                'Simpan',
                style:
                    TextStyle(color: EpregnancyColors.white, fontSize: 14.sp),
              ),
              onPressed: _hospitalModel == null ? null : () async{
                // todo save to local
                await AppSharedPreference.setHospital(_hospitalModel!);
                await AppSharedPreference.setBool(AppSharedPreference.haveBpjsorKis, haveBpjs);
                Navigator.pop(context, _hospitalModel);
              },
              style: ButtonStyle(
                  backgroundColor:
                      _hospitalModel == null ? MaterialStateProperty.all<Color>(EpregnancyColors.greyText) :  MaterialStateProperty.all<Color>(EpregnancyColors.primer),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))))),
    );
  }
}
