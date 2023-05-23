import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/pages/child_list_page/growth_tracker_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/epragnancy_color.dart';

class AddGrowthButton extends StatelessWidget {
  const AddGrowthButton({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return GrowthTrackerForm(babyId: id);
            }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 56.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: EpregnancyColors.primer,
            borderRadius: BorderRadius.circular(12.w)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            whiteText16("Tambah Data Pertumbuhan"),
            Icon(Icons.add, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}