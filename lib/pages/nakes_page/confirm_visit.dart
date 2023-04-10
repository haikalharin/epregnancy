import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/pages/nakes_page/widget/confirm_card.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmVisit extends StatefulWidget {
  const ConfirmVisit({Key? key}) : super(key: key);

  @override
  State<ConfirmVisit> createState() => _ConfirmVisitState();
}

class _ConfirmVisitState extends State<ConfirmVisit> {
  int _selectedWeekIndex = 2;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(16.w),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: EpregnancyColors.greyPony,
                    borderRadius: BorderRadius.circular(8.w)),
              ),
              blackText16("Rekomendasi Kunjungan Selanjutnya"),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 4.h, left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    blackText10("Kunjungan Kehamilan ke-4"),
                    blackText10W500(DateFormatter.dateFormatdMMyyyy.format(DateTime.now())),
                  ],
                ),
              ),
              ConfirmCard(),
              Container(
                height: 15.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _selectedWeekIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 1.h),
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            color: _selectedWeekIndex == index ? EpregnancyColors.primer : EpregnancyColors.greyText,
                            borderRadius: BorderRadius.circular(32.w)
                          ),
                          child: whiteText10(weekText(index)),
                        ),
                      );
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ElevatedButton(
                  onPressed: () async {
                  },
                  child: Text("Kirim Jadwal Ke Bunda"),
                  style: ElevatedButton.styleFrom(
                    primary: EpregnancyColors.primer,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  
  String weekText(int index) {
    if(index == 0){
      return "1 Minggu";
    } else if (index == 1) {
      return "2 Minggu";
    } else if (index == 2) {
      return "4 Minggu";
    } else {
      return "Lainnya";
    }
  }
}
