import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BabyBornFromPage extends StatefulWidget {
  const BabyBornFromPage({Key? key}) : super(key: key);

  @override
  State<BabyBornFromPage> createState() => _BabyBornFromPageState();
}

class _BabyBornFromPageState extends State<BabyBornFromPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context, 'back');
            Navigator.pop(context, 'back');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: const BoxDecoration(
          color: EpregnancyColors.primerSoft,
          image: DecorationImage(
            image: AssetImage("assets/bg_profile_form.png"),
            fit: BoxFit.fill
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 32.h,),
            Center(child: SvgPicture.asset('assets/ic_basket.svg'),),
            SizedBox(height: 15.h,),
            Center(child: blackText24("Profil Anak"),),
            SizedBox(height: 24.h,),
            TextFormField(
              controller: _nameController,
              onChanged: (value) {

              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.w),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
                label: Text('Nama Depan'),
              ),
            ),
            SizedBox(height: 16.h,),
            TextFormField(
              controller: _lastNameController,
              onChanged: (value) {

              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.w),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                fillColor: Colors.white70,
                label: Text('Nama Belakang'),
              ),
            ),
            SizedBox(height: 16.h,),
            InkWell(
              // todo used cupertino picker
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
                  color: EpregnancyColors.primer,
                  fontWeight: FontWeight.w700,
                ),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                dateFormat: DateFormat('dd / MM / yyyy'),
                enabled: true,
                lastDate: DateTime.now(),
                mode: DateTimeFieldPickerMode.date,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: EpregnancyColors.primer, width: 2.w
                    )
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: EpregnancyColors.primer, width: 1.w),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  suffixIcon: Icon(Icons.event_note),
                  hintText: 'DD / MM / YYYY',
                  label: Text("Tanggal Lahir"),
                  labelStyle: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700)
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
                  String dateTime = DateFormat('yyyy-MM-dd').format(value);

                  // Injector.resolve<SignUpQuestionnaireBloc>()
                  //     .add(SignupDateChanged(dateTime));
                },
              ),
            ),
          ],),
      ),
    );
  }
}
