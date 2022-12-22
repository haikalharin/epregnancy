import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FullQrScreen extends StatelessWidget {
  const FullQrScreen({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
