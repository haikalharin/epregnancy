import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/growth_page/widget/add_growth_button.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import 'bloc/growth_bloc.dart';

class GrowthPage extends StatefulWidget {
  const GrowthPage({Key? key, required this.childId}) : super(key: key);
  final String childId;

  @override
  State<GrowthPage> createState() => _GrowthPageState();
}

class _GrowthPageState extends State<GrowthPage> {


  @override
  void initState() {
    Injector.resolve<GrowthBloc>().add(FetchGrowthEvent(widget.childId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BtnBackIosStyle(),
        title: blackText16("Data Pertumbuhan Anak"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<GrowthBloc, GrowthState>(
        builder: (context, state){
          if(state.status == FormzStatus.submissionSuccess) {
            if((state.growths?.length ?? 0) >= 1){
              return Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: state.growths?.length ?? 0,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
                        decoration: BoxDecoration(
                          border: const Border(bottom: BorderSide(color: EpregnancyColors.greyDivider, width: 1))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: blackText12W500(DateFormatter.dateFormatChat.format(DateTime.parse(state.growths![index].visitDate!)))),
                            Expanded(child: blackText12("T: ${state.growths?[index].length ?? 0} cm | B: ${state.growths?[index].weight ?? 0} kg | LK: ${state.growths?[index].headCircumference} cm")),
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return _noData(context);
            }
          } else if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _noData(context);
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<GrowthBloc, GrowthState>(
        builder: (context, state){
          if((state.growths?.length ?? 0) >= 1){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AddGrowthButton(id: widget.childId),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      )
    );
  }

  Widget _noData(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 16.h),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/imgChilds.svg"),
          SizedBox(height: 30.h,),
          Text("Belum ada data\npertumbuhan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.sp), textAlign: TextAlign.center,),
          SizedBox(height: 36.h,),
          AddGrowthButton(id: widget.childId)
        ],
      ),
    );
  }
}
