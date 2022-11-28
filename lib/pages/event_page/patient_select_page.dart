import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/pages/location_select_page/bloc/hospital_bloc.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import 'bloc/patient_select_bloc.dart';

class PatientSelectPage extends StatefulWidget {
  const PatientSelectPage({Key? key}) : super(key: key);

  @override
  State<PatientSelectPage> createState() => _PatientSelectPageState();
}

class _PatientSelectPageState extends State<PatientSelectPage> {
  UserModel? _selectedUser;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    Injector.resolve<PatientSelectBloc>().add(const FetchPatientEvent(''));
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
                      Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(keyWord));
                    },
                    decoration: InputDecoration(
                      prefixIconConstraints:
                      BoxConstraints(maxHeight: 35, maxWidth: 35),
                      prefixText: '',
                      suffixIconConstraints:
                      BoxConstraints(maxWidth: 40, maxHeight: 21),
                      suffixIcon: InkWell(
                        onTap: () {
                          _searchTextController.clear();
                          Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: EpregnancyColors.primer, shape: BoxShape.circle),
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
                      hintText: "Nama Pasien",
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
      body: BlocBuilder<PatientSelectBloc, PatientSelectState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state.status == FormzStatus.submissionFailure){
              return  Container(
                child: const Center(
                    child: Text('Pasien Tidak Ditemukan ...')
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.only(bottom: 10.h),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.users?.length ?? 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _selectedUser = state.users?[index];
                          });
                          Navigator.pop(context, _selectedUser);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.users?[index].name ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      );
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
