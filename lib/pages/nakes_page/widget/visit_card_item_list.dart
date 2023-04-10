import 'package:PregnancyApp/pages/nakes_page/confirm_visit.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';

class VisitCardItemList extends StatelessWidget {
  const VisitCardItemList({Key? key, this.withButton = false}) : super(key: key);
  final bool? withButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const FadeInImage(
              placeholder: AssetImage(
                  'assets/ic_no_photo_blue.png'),
              image: AssetImage(
                  'assets/ic_no_photo_blue.png'),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mia Andi",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight:
                          FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    !withButton! ? Text(
                      'Kunjungan Selanjutnya',
                      style: TextStyle(
                          color: EpregnancyColors.greyDarkFontColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500),
                    ) : const SizedBox.shrink()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icMom.svg'),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('Kehamilan 5 Minggu', style: TextStyle(
                            color: EpregnancyColors.primer,
                            fontSize: 10.sp,
                            fontWeight:
                            FontWeight.w500),
                        )
                      ],
                    ),
                    !withButton! ? Text(
                      DateFormatter.dateFormatdMMyyyy.format(DateTime.now()),
                      style: TextStyle(
                          color: EpregnancyColors.greyDarkFontColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700),
                    ) : const SizedBox.shrink()
                  ],
                ),
              ],
            ),
          ),
          withButton! ? ElevatedButton(
            onPressed: () async {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.w),
                      topLeft: Radius.circular(8.w),
                    )
                  ),
                  builder: (context) => const ConfirmVisit());
            },
            child: Text("Konfirmasi"),
            style: ElevatedButton.styleFrom(
              primary: EpregnancyColors.primer,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ) : const SizedBox.shrink()
        ],
      ),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: EpregnancyColors.greyDivider, width: 1.h
          )
        )
      ),
    );
  }
}
