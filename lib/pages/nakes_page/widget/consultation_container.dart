import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/router_constants.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../utils/epragnancy_color.dart';
import '../../../utils/string_constans.dart';

enum ConsultationEnum { newest, onGoing }

class ConsultationContainer extends StatelessWidget {
  const ConsultationContainer(
      {Key? key, this.value = 0, required this.consultationEnum, this.role})
      : super(key: key);
  final int value;
  final ConsultationEnum consultationEnum;
  final String? role;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          print("role : $role");
          if (consultationEnum == ConsultationEnum.newest) {
            // todo handle web socket for chat
            Navigator.of(context).pushNamed(RouteName.navBar,
                arguments: {'role': role, 'initial_index': 0});
          } else {
            Navigator.of(context).pushNamed(RouteName.navBar,
                arguments: {'role': role, 'initial_index': 1});
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          height: 56.h,
          decoration: BoxDecoration(
            color: EpregnancyColors.primer.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                consultationEnum == ConsultationEnum.newest
                    ? StringConstant.baru
                    : StringConstant.onGoing,
                maxLines: 2,
                style: TextStyle(
                    color: EpregnancyColors.blackBack,
                    fontWeight: FontWeight.w500,
                    fontSize: 9.sp,
                    height: 1.5),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 20.w),
                height: 32.h,
                width: 32.w,
                decoration: consultationEnum == ConsultationEnum.newest
                    ? const BoxDecoration(
                        color: EpregnancyColors.primer, shape: BoxShape.circle)
                    : BoxDecoration(
                        color: EpregnancyColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: EpregnancyColors.primer)),
                child: Center(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        color: consultationEnum == ConsultationEnum.newest
                            ? Colors.white
                            : EpregnancyColors.primer,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
