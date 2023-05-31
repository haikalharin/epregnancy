import 'dart:convert';
import 'dart:io';
import 'package:PregnancyApp/common/injector/injector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../pages/home_page/bloc/home_page_bloc.dart';
import '../pages/notification_page/bloc/notification_bloc.dart';

class NotifController {
  static Future initLocalNotification() async {
    final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      var initializationSettingsAndroid =
          AndroidInitializationSettings('icon_notification');
      var initializationSettingsIOS = IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) async {},
      );
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (payload) async {},
      );
    } else {
      var initializationSettingsAndroid =
          AndroidInitializationSettings('icon_notification');
      var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) async {},
      );
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (payload) async {},
      );
    }
  }

  static Future<void> sendNotification({
    String? type,
    String? myLastChat,
    String? myUid,
    String? myName,
    String? photo,
    String? personToken,
  }) async {
    String serverKey =
        'AAAAGvTpeIE:APA91bExCASFgviJSDQO0ZtBMRWDX30Jg6pTCx-gypyR_L3k32JCuhG6Vk7ZuHk0af09nIDki-aJgIElS1eXpSofllfxpXeNnG9o_76zIlGp_b1x8UxneC9T3r7qk2NIibxZZXPG2b2a';
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$serverKey',
        },
        body: json.encode(
          {
            'notification': {
              'body': type == 'text'
                  ? myLastChat!.length >= 25
                      ? myLastChat.substring(0, 25) + '...'
                      : myLastChat
                  : '<Image>',
              'title': myName,
              "sound": "default",
              'tag': myUid,
            },
            'priority': 'high',
            'to': personToken,
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getTokenFromDevice() async {
    String? token = '';
    try {
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      String vapidKey =
          'BNXheQGG8RWiHCRHmEVBT9tHbSdpbmn7B0HDABeVJNMYKuDF94SV3QpRF4d4W-Aaad1KpsTRZuwkuSY5-YvRRqQ';
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        token = await FirebaseMessaging.instance.getToken(vapidKey: vapidKey);
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        FirebaseMessaging.instance.getToken(vapidKey: vapidKey).then((value) {
          print('token : $value');
        });
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        Injector.resolve<NotificationBloc>().add(const NotificationFetchEvent(0));
        Injector.resolve<HomePageBloc>().add(const HomeFetchNotificationTotalUnreadEvent());
        print('A new onMessageOpenedApp event was published!');
      });
    } catch (e) {
      print(e);
    }
    return token!;
  }
}
