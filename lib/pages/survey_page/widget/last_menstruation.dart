import 'package:PregnancyApp/data/model/baby_model/new_baby_model.dart';
import 'package:PregnancyApp/data/model/baby_model_api/baby_Model_api.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../../common/injector/injector.dart';
import '../../../utils/epragnancy_color.dart';
import '../bloc/survey_page_bloc.dart';

class LastMenstruation extends StatefulWidget {
  LastMenstruation({
    Key? key,
    this.isEdit = false,
    this.baby,
  }) : super(key: key);
  final bool? isEdit;
  NewBabyModel? baby;

  @override
  State<LastMenstruation> createState() => _LastMenstruationState();
}

class _LastMenstruationState extends State<LastMenstruation> {
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyPageBloc, SurveyPageState>(
      builder: (context, state) {
        return  Column(
          children: [
            Container(
              height: 160,
              width: 160,
              // margin: EdgeInsets.only(left: 50, right: 50),
              child: SvgPicture.asset(
                'assets/ic_baby.svg',
                // height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30, top: 10),
                    child: Center(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              child: const Text(
                                "Kapan hari pertama haid terakhir Anda ?",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, left: 30, right: 30),
                              child: const Text(
                                "Kami akan membantu memperkirakan hari kelahiran bayi Anda",
                                maxLines: 5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: DateTimeFormField(
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: -8)),
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  initialValue: state.date.valid
                                      ? DateTime.parse(state.date.value)
                                      : widget.baby?.baby != null
                                          ? DateTime.parse(widget.baby!.baby!
                                              .lastMenstruationDate!)
                                          : null,
                                  dateFormat: DateFormat('dd/MM/yyyy'),
                                  mode: DateTimeFieldPickerMode.date,
                                  decoration: InputDecoration(
                                    fillColor: EpregnancyColors.primerSoft2,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.black45),
                                    errorStyle: const TextStyle(
                                        color: Colors.redAccent),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: EpregnancyColors.primer),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: EpregnancyColors.primer),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: EpregnancyColors.primer),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(Icons.event_note),
                                    hintText: 'DD / MM / YYYY',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // errorText: state.date.invalid ? 'Mohon lengkapi Data' : null,
                                  ),
                                  onDateSelected: (DateTime value) {
                                    String dateTime =
                                        DateFormat('yyyy-MM-dd').format(value);
                                    Injector.resolve<SurveyPageBloc>()
                                        .add(SurveyDateChanged(dateTime));

                                    // Injector.resolve<SignUpQuestionnaireBloc>()
                                    //     .add(SignupDateChanged(dateTime));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
