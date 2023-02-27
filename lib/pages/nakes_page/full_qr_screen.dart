import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FullQrScreen extends StatelessWidget {
  const FullQrScreen({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Qr Check-in Pasien", style: TextStyle(color: Colors.black),),
        leading: const BtnBackIosStyle(),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: 'qr-hero',
          child: Center(
            child: QrImage(
              data: value,
              version: QrVersions.auto,
              size: 200.w,
            ),
          ),
        ),
      ),
    );
  }
}
