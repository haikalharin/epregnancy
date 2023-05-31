import 'package:PregnancyApp/pages/new_born_page/baby_born_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/custom_text_style.dart';
import '../../../utils/epragnancy_color.dart';

class AddChildButton extends StatelessWidget {
  const AddChildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BabyBornFromPage(babyId: "", isEdit: true,);
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
            whiteText16("Tambah Data Anak"),
            Icon(Icons.add, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
