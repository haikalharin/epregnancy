import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/person_model/person_model.dart';
import 'package:PregnancyApp/pages/article_page/article_detail_page.dart';
import 'package:PregnancyApp/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/event_page_bloc.dart';

class ListScheduleTime extends StatelessWidget {
  List<NotificationModel>? listScheduleTime = [];

  ListScheduleTime({this.listScheduleTime});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventPageBloc, EventPageState>(
      builder: (context, state) {
        return Container(
            height: 25,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(color: Colors.white),
            child: listScheduleTime!.isEmpty
                ? Stack(children: [
              Container(margin: EdgeInsets.only(), child: Container())
            ])
                : Stack(
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String s = listScheduleTime![index].time??'';
                    TimeOfDay _time = TimeOfDay(hour: int.parse(s.split(
                        ":")[0]),
                        minute: int.parse(s.split(":")[1]));
                    return Row(
                      children: [
                        index == 0 ?  Container(): SizedBox(width: 10),
                        InkWell(
                          onTap: () async {
                            TimeOfDay initialTime = _time;
                            var pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                              initialEntryMode: TimePickerEntryMode.input,
                            );

                            TimeOfDay time = pickedTime?? TimeOfDay.now();

                            Injector.resolve<EventPageBloc>().add(
                                EventlistScheduleTimeChanged(time.to24hours(),index));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: EpregnancyColors.primer),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  listScheduleTime![index].time??'',
                                  style: TextStyle(
                                      color: EpregnancyColors.white,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.access_time_outlined,
                                  size: 20,
                                  color: EpregnancyColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: listScheduleTime!.length,
                ),
              ],
            ));
      },
    );
  }
}
