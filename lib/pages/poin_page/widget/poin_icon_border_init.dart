import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoinIconBorderInitial extends StatelessWidget {
  const PoinIconBorderInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: EpregnancyColors.blueBorder)
        ),
        child: PoinIconWidget(height: 10.w, width: 10.w,)
    );
  }
}
