import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/nakes_visit_page/confirm_visit.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../../common/injector/injector.dart';
import '../../../utils/epragnancy_color.dart';
import '../../home_page/bloc/home_page_bloc.dart';

class VisitCardItemList extends StatelessWidget {
  const VisitCardItemList(
      {Key? key, this.withButton = false, this.userVisitModel})
      : super(key: key);
  final bool? withButton;
  final UserVisitModel? userVisitModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        String outputDate = "";
        var outputFormat = DateFormat.yMMMMd('id');
        outputDate = outputFormat.format(
            DateTime.parse(userVisitModel?.nextVisitDate ?? "0000-00-00"));
        return InkWell(
          onTap: () {
            Injector.resolve<HomePageBloc>()
                .add(ChangeDataVisitEvent(userVisitModel));
            Future.delayed(const Duration(milliseconds: 500));
            if (userVisitModel?.status == StringConstant.acceptedVisit) {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.w),
                    topLeft: Radius.circular(8.w),
                  )),
                  builder: (context) => ConfirmVisit());
            }
          },
          child: Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: userVisitModel?.user?.imageUrl != null
                      ? FadeInImage(
                          placeholder:
                              const AssetImage('assets/ic_no_photo_blue.png'),
                          image: NetworkImage(
                              userVisitModel?.user?.imageUrl ?? ''),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        )
                      : FadeInImage(
                          placeholder:
                              AssetImage('assets/ic_no_photo_blue.png'),
                          image: AssetImage('assets/ic_no_photo_blue.png'),
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
                            userVisitModel?.user?.name ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp),
                          ),
                          userVisitModel?.status == StringConstant.doneVisit
                              ? Text(
                                  'Kunjungan Selanjutnya',
                                  maxLines: 5,
                                  style: TextStyle(
                                      color: EpregnancyColors.greyDarkFontColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              : userVisitModel?.status ==
                                      StringConstant.acceptedVisit
                                  ? Container(
                            width: MediaQuery.of(context).size.width/2,
                                    child: Text(
                                        'Tap untuk atur jadwal',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: EpregnancyColors
                                                .primer,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                  )
                                  :userVisitModel?.status == StringConstant.rejectedVisit
                              ?   Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text(
                              'Dibatalkan',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: EpregnancyColors
                                      .greyDarkFontColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ):const SizedBox.shrink()
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
                              Text(
                                'Kehamilan ${userVisitModel?.user?.pregnancyWeek ?? '0'} Minggu',
                                style: TextStyle(
                                    color: EpregnancyColors.primer,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          userVisitModel?.status == StringConstant.doneVisit
                              ? Text(
                                  outputDate,
                                  style: TextStyle(
                                      color: EpregnancyColors.greyDarkFontColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ),
                userVisitModel?.status == 'PENDING'
                    ? ElevatedButton(
                        onPressed: () async {
                          Injector.resolve<HomePageBloc>()
                              .add(ChangeDataVisitEvent(userVisitModel));
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.w),
                                topLeft: Radius.circular(8.w),
                              )),
                              builder: (context) => ConfirmVisit());
                        },
                        child: Text("Konfirmasi"),
                        style: ElevatedButton.styleFrom(
                          primary: EpregnancyColors.primer,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        color: EpregnancyColors.greyDivider, width: 1.h))),
          ),
        );
      },
    );
  }
}
