import 'package:PregnancyApp/common/style/custom_text_style.dart';
import 'package:PregnancyApp/common/widget/btn_back_ios_style.dart';
import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


List<String> list = <String>['Laki-laki', 'Perempuan'];

class BabyBornFromPage extends StatefulWidget {
  const BabyBornFromPage({Key? key}) : super(key: key);

  @override
  State<BabyBornFromPage> createState() => _BabyBornFromPageState();
}

class _BabyBornFromPageState extends State<BabyBornFromPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


  String dropdownValue = list.first;

  String? _bornDateSelected;

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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
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
              fit: BoxFit.fill),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: SvgPicture.asset('assets/ic_basket.svg'),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: blackText24("Profil Anak"),
            ),
            SizedBox(
              height: 24.h,
            ),
            TextFormField(
              controller: _nameController,
              onChanged: (value) {},
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
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
              controller: _lastNameController,
              onChanged: (value) {},
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
            SizedBox(
              height: 16.h,
            ),
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
                  color: _bornDateSelected != null ? EpregnancyColors.primer : Colors.black,
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
                    borderSide: _bornDateSelected != null ? BorderSide(color:  EpregnancyColors.primer, width: 2.w) : const BorderSide()
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
                  label: Text("Tanggal Lahir"),
                  labelStyle: TextStyle(color:_bornDateSelected != null ? EpregnancyColors.primer : Colors.grey, fontWeight: FontWeight.w700)
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

                  setState(() {
                    _bornDateSelected =
                        DateFormat('yyyy-MM-dd').format(value).toString();
                  });
                  // Injector.resolve<SignUpQuestionnaireBloc>()
                  //     .add(SignupDateChanged(dateTime));
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InputDecorator(
              decoration: InputDecoration(
                labelText: "Jenis Kelamin",
                labelStyle: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700, fontSize: 14.sp),
                counter: const SizedBox.shrink(),
                contentPadding: EdgeInsets.fromLTRB(16.w, 6.h, 8.w, 6.h),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  EpregnancyColors.primer, width: 2.w)
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.w), borderSide: BorderSide(color: EpregnancyColors.primer)),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down, size: 30, color: EpregnancyColors.primer,),
                elevation: 16,
                underline: const SizedBox.shrink(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: EpregnancyColors.primer, fontWeight: FontWeight.w700),),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar : Container(
          height: 56,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
          child: ElevatedButton(
            child: Text('Simpan Profil', style: TextStyle(fontSize: 16.sp),),
            onPressed: _bornDateSelected == null ? null :() {
              // todo hit api add child
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
}
