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

class BabyName extends StatelessWidget {
  const BabyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyPageBloc, SurveyPageState>(
  builder: (context, state) {
    return ListView(
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
          color: EpregnancyColors.primerSoft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                EdgeInsets.only(bottom: 30, top: 10),
                color: EpregnancyColors.primerSoft,
                child: Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, right: 30),
                          child: const Text(
                            "Siapa nama bayi Anda ?",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 8,
                              left: 30,
                              right: 30),
                          child: const Text(
                            "Kami akan membantu memperkirakan hari kelahiran bayi Anda",
                            maxLines: 5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w300,
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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 30, right: 30),
                            child:  TextField(
                              onChanged: (value) {
                                Injector.resolve<SurveyPageBloc>()
                                    .add(SurveyBabysNameChanged(value));
                              },
                              decoration:  InputDecoration(
                                fillColor:
                                EpregnancyColors
                                    .primerSoft2,
                                filled: true,
                                hintStyle:
                                const TextStyle(
                                    color: Colors
                                        .black45),
                                errorStyle:
                                const TextStyle(
                                    color: Colors
                                        .redAccent),
                                border:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      EpregnancyColors
                                          .primer),
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      EpregnancyColors
                                          .primer),
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                ),
                                enabledBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      EpregnancyColors
                                          .primer),
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),
                                ),
                                hintText:
                                'Masukan nama bayi anda',
                                labelStyle:
                                const TextStyle(
                                  color: Colors.black,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                                // errorText: state.date.invalid ? 'Mohon lengkapi Data' : null,
                              ),
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
