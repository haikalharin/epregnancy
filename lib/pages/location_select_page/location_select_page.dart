import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/epragnancy_color.dart';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({Key? key}) : super(key: key);

  @override
  State<LocationSelectPage> createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
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
                child: Image.asset('assets/image_kepesertaan.png', fit: BoxFit.fitWidth,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                child: Text('Data Kepesertaan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 32.sp),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
                child: Text('Lokasi dan Kepemilikan BPJS / KIS', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14.sp),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 20.h),
                child: Text('Lokasi Puskesmas', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.sp),),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 40.h,
          margin:  EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
          child: ElevatedButton(
              child: Text('Simpan', style: TextStyle(color: EpregnancyColors.white, fontSize: 14.sp),),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(EpregnancyColors.primer),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      )
                  )
              )
          )),
    );
  }
}
