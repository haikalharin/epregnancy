import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void basicLoadinDialog(BuildContext context){
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
}