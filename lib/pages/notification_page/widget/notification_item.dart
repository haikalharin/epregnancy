import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/custom_text_style.dart';
import '../../../utils/epragnancy_color.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, this.isRead = true, this.title, this.desc}) : super(key: key);

  final bool isRead;
  final String? title, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
      decoration:  BoxDecoration(
          color: !isRead  ? EpregnancyColors.primer.withOpacity(0.25) : Colors.white,
          border: const Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1,), bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          blackText16(title ?? ""),
          SizedBox(height: 5.h,),
          blackText12W500(desc ?? "")
        ],
      ),
    );
  }
}
