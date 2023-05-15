import 'package:PregnancyApp/data/model/notification_model/notification_list_model.dart';
import 'package:PregnancyApp/pages/notification_page/bloc/notification_bloc.dart';
import 'package:PregnancyApp/pages/notification_page/widget/list_notif_seperator.dart';
import 'package:PregnancyApp/pages/notification_page/widget/notification_item.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';


class ListNotificationWidget extends StatelessWidget {
  const ListNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>
      (builder: (context, state) {
      return GroupedListView<NotificationListModel, String>(
        elements: state.listNotification!,
        groupBy: (element) => DateFormatter.dateFormatChat.format(DateTime.parse(element.createdDate!)),
        groupSeparatorBuilder: (String groupByValue) => ListNotifSeperator(date: groupByValue),
        itemBuilder: (context, NotificationListModel element) => NotificationItem(isRead: element.read!, title: element.title, desc: element.body),
        // itemComparator: (item1, item2) => item1.createdDate!.compareTo(item2.createdDate!), // optional
        itemComparator: (item1, item2) => DateFormatter.dateFormatChat.format(DateTime.parse(item1.createdDate!)).compareTo(DateFormatter.dateFormatChat.format(DateTime.parse(item2.createdDate!))), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: false, // optional
        order: GroupedListOrder.ASC, // optional
      );
    });
  }
}
