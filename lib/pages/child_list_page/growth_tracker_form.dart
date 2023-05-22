import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/pages/child_list_page/bloc/child_list_bloc.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import '../home_page/bloc/home_page_bloc.dart';

class GrowthTrackerForm extends StatefulWidget {
  const GrowthTrackerForm({Key? key, required this.babyId}) : super(key: key);
  final String babyId;

  @override
  State<GrowthTrackerForm> createState() => _GrowthTrackerFormState();
}

class _GrowthTrackerFormState extends State<GrowthTrackerForm> {

  final TextEditingController _tallController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _headCircumferenceController = TextEditingController();

  late String? _checkDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: const BtnBackIosStyle(),
          centerTitle: true,
          title: Text("Tambah Pertumbuhan Anak", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
          elevation: 0,
      ),
      body: BlocListener<ChildListBloc, ChildListBlocState>(
        listener: (context, state){
          if(state.submitStatus == FormzStatus.submissionSuccess){
            const snackBar = SnackBar(
                content: Text("Pertumbuhan Anak Berhasil Ditambah!", style: TextStyle(color: Colors.white),), backgroundColor: EpregnancyColors.primer);
            Scaffold.of(context).showSnackBar(snackBar);
            Injector.resolve<HomePageBloc>().add(const HomeFetchBabyChildsEvent());
            Injector.resolve<HomePageBloc>().add(HomeFetchChildForDashboardEvent(widget.babyId, true));
            Navigator.pop(context);
          } else if (state.submitStatus == FormzStatus.submissionFailure){
            const snackBar = SnackBar(
                content: Text("Terjadi Kesalahan, Silahkan Coba Lagi!", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(
                height: 24.h,
              ),
              InkWell(
                onTap: () => _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.dmy,
                    maximumDate: DateTime.now(),
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      String dateTime = DateFormat('yyyy-MM-dd').format(newDate);

                      // Injector.resolve<SignUpQuestionnaireBloc>()
                      //     .add(SignupDateChanged(dateTime));
                    },
                  ),
                ),
                child: DateTimeFormField(
                  dateTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  dateFormat: DateFormat('dd / MM / yyyy'),
                  enabled: true,
                  initialValue: DateTime.now(),
                  lastDate: DateTime.now(),
                  mode: DateTimeFieldPickerMode.date,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  EpregnancyColors.primer, width: 2.w)
                      ),
                      // disabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: EpregnancyColors.greyDivider, width: 1.w
                      //   )
                      // ),
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(color: EpregnancyColors.primer, width: 1.w),
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      suffixIcon: Icon(Icons.event_note),
                      hintText: 'DD / MM / YYYY',
                      label: Text("Tanggal cek"),
                      labelStyle: TextStyle(color:EpregnancyColors.primer, fontWeight: FontWeight.w700)
                    // labelStyle: TextStyle(
                    //   color: Colors.black,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // errorText: state.date.invalid
                    //     ? 'Mohon lengkapi Data'
                    //     : null,
                  ),
                  // firstDate: DateTime.now().add(const Duration(days: 10)),
                  // lastDate: DateTime.now().add(const Duration(days: 40)),
                  // initialDate: DateTime.now().add(const Duration(days: 20)),
                  onDateSelected: (DateTime value) {

                    setState(() {
                      _checkDate = DateFormat('yyyy-MM-dd').format(value).toString();
                    });
                    // Injector.resolve<SignUpQuestionnaireBloc>()
                    //     .add(SignupDateChanged(dateTime));
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: _tallController,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                style: const TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  fillColor: Colors.white70,
                  label: Text('Tinggi anak (cm)'),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                style: const TextStyle(fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  fillColor: Colors.white70,
                  label: Text('Berat anak (kg)'),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: _headCircumferenceController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontWeight: FontWeight.w700),
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  fillColor: Colors.white70,
                  label: Text('Lingkar kepala (cm)'),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 56,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
          child: ElevatedButton(
            child: BlocBuilder<ChildListBloc, ChildListBlocState>(
              builder: (context, state) {
                if (state.submitStatus == FormzStatus.submissionInProgress) {
                  return const CircularProgressIndicator(color: Colors.white,);
                } else {
                  return Text('Simpan', style: TextStyle(fontSize: 16.sp));
                }
              },
            ),
            onPressed: _tallController.text == "" || _weightController.text == "" || _headCircumferenceController.text == "" ? null :() {
              Injector.resolve<ChildListBloc>().add(AddChildGrowthEvent(
                weight: double.parse(_weightController.text),
                visitDate: _checkDate,
                length: double.parse(_tallController.text),
                headCircumference: double.parse(_headCircumferenceController.text),
                babyId: widget.babyId
              ));
            },
            style: ElevatedButton.styleFrom(
              primary: EpregnancyColors.primer,
              onSurface: EpregnancyColors.primer
                  .withOpacity(0.25),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }

}
