import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/injector/injector.dart';
import '../../../common/style/custom_text_style.dart';
import '../../../utils/epragnancy_color.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key, this.isRead = true, this.title, this.desc, required this.id}) : super(key: key);

  final bool isRead;
  final String? title, desc;
  final String id;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  late bool read = widget.isRead;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          read = true;
          Injector.resolve<NotificationBloc>().add(NotificationReadEvent(widget.id));
          Injector.resolve<NotificationBloc>().add(const NotificationFetchEvent(0));
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
        decoration:  BoxDecoration(
            color: !read  ? EpregnancyColors.primer.withOpacity(0.25) : Colors.white,
            border: const Border(top: BorderSide(color: EpregnancyColors.greyDivider, width: 1,), bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blackText16(widget.title ?? ""),
            SizedBox(height: 5.h,),
            blackText12W500(widget.desc ?? "")
          ],
        ),
      ),
    );
  }
}
