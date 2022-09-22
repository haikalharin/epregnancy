import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class LocationListPage extends StatefulWidget {
  const LocationListPage({Key? key, this.currentHospital}) : super(key: key);
  final String? currentHospital;

  @override
  State<LocationListPage> createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  HospitalModel? _selectedHospital;

  final _searchTextController = TextEditingController();


  @override
  void initState() {
    Injector.resolve<HospitalBloc>().add(const FetchHospitalsEvent(''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 30.h, left: 10.w, right: 10.w, bottom: 10.h),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: TextFormField(
                    controller: _searchTextController,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (keyWord) {
                      Injector.resolve<HospitalBloc>().add(FetchHospitalsEvent(keyWord));
                    },
                    decoration: InputDecoration(
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 35, maxWidth: 35),
                      prefixText: '  ',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: SvgPicture.asset(
                          'assets/icTarget.svg',
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(maxWidth: 40, maxHeight: 21),
                      suffixIcon: InkWell(
                        onTap: () {
                          _searchTextController.clear();
                          Injector.resolve<HospitalBloc>().add(const FetchHospitalsEvent(''));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
                      hintText: "Puskesmas",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: EpregnancyColors.primer,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: EpregnancyColors.borderGrey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<HospitalBloc, HospitalState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.status == FormzStatus.submissionFailure){
            return Container(
              child: Center(
                child: Text('Puskesmas Tidak Ditemukan ...')
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(bottom: 10.h),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.currentHospital != null ? (state.hospitals?.length ?? 0 + 1) : (state.hospitals?.length ?? 0),
                  itemBuilder: (context, index) {
                    print('current index : $index');
                    if (widget.currentHospital != null) {
                      if(index == 0){
                        return ListTile(
                          leading: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: EpregnancyColors.primerSoft,
                                  shape: BoxShape.circle
                              ),
                              child: Container(
                                child: SvgPicture.asset('assets/icLocation.svg', color: EpregnancyColors.blueDark, height: 25, width: 25,
                                    fit: BoxFit.scaleDown),
                              )
                          ),
                          title: Text("Lokasi Sekarang", style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(widget.currentHospital ?? '', style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),)),);
                      } else {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              _selectedHospital = state.hospitals?[index - 1];
                            });
                            Navigator.pop(context, _selectedHospital);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  state.hospitals?[index - 1].name ?? '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp),
                                ),
                                Text(
                                  state.hospitals?[index - 1].address ?? '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    } else {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _selectedHospital = state.hospitals?[index];
                          });
                          Navigator.pop(context, _selectedHospital);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.hospitals?[index].name ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                state.hospitals?[index].address ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                      child: Divider(
                          color: EpregnancyColors.borderGrey,
                          height: 2.h,
                          thickness: 2.h),
                    );
                  }),
            );
          }
        }),
    );
  }
}
