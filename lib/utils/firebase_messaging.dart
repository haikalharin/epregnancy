import 'dart:io';
import 'dart:convert';

import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/constants/router_constants.dart';
import '../data/model/Firebase_topic_response.dart';
import '../data/model/user_model_api/user_model.dart';
import '../data/shared_preference/app_shared_preference.dart';
import '../flavors.dart';
import '../main.dart';

import '../main_development.dart' as dev;
import '../main.dart' as main;
import '../main_production.dart' as prod;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String linkUri = "", target = "", content = "";
  BuildContext? mContext;

  Future<bool> getFirebaseTopic(FirebaseTopicResponse response) async {
    try {
      List<bool> subscribe = [];
      List<bool> unsubscribe = [];
      response.content?.allAvailableTopics?.forEach((element) {
        String data = element;
        _firebaseMessaging.unsubscribeFromTopic(data);
        if (data != null) {
          unsubscribe.add(true);
        } else {
          unsubscribe.add(false);
        }
      });

      response.content?.userRelatedTopics?.forEach((element) {
        String data = element;
        _firebaseMessaging.subscribeToTopic(data);
        if (data != null) {
          subscribe.add(true);
        } else {
          subscribe.add(false);
        }
      });
      if (!subscribe.contains(false) && !unsubscribe.contains(false)) {
        return true;
      } else {
        return false;
      }
    } catch (Exception) {
      return false;
    }
  }

  Future<String> getDeviceToken() async {
    String? strEncryInfoData = "";
    try {
      return _firebaseMessaging.getToken().then((token) {
        print(token);
        return strEncryInfoData = token ?? "";
      });
    } catch (Exception) {
      return strEncryInfoData ?? "";
    }
  }

  showNotification(String title, String body, [String? data]) async {
    var android = AndroidNotificationDetails('id', 'channel ',
        channelDescription: 'description',
        priority: Priority.high,
        importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, title, body, platform,
        payload: data);
    if (F.appFlavor == Flavor.DEVELOPMENT) {
      await dev.flutterLocalNotificationsPlugin
          .show(0, title, body, platform, payload: data);
    } else if (F.appFlavor == Flavor.PRODUCTION) {
      await prod.flutterLocalNotificationsPlugin
          .show(0, title, body, platform, payload: data);
    } else {
      await main.flutterLocalNotificationsPlugin
          .show(0, title, body, platform, payload: data);
    }
  }

  Future<void> setup(BuildContext context) async {
    mContext = context;
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/launch_background');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
    if (F.appFlavor == Flavor.DEVELOPMENT) {
      dev.flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification);
    } else if (F.appFlavor == Flavor.PRODUCTION) {
      prod.flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification);
    } else {
      main.flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification);
    }

    dev.flutterLocalNotificationsPlugin
        .initialize(initSetttings, onSelectNotification: onSelectNotification);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'id', // id
      'channel', // title// description
      importance: Importance.high,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (Platform.isIOS) {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
    }

    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      print("Push Messaging token: $token");
    });

    // Handle message when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null && Platform.isAndroid) {
        print('Message also contained a notification: ${message.notification}');
        var title = message.notification?.title;
        var body = message.notification?.body;
        showNotification(title ?? "", body ?? "", json.encode(message.data));
      }
    });

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data != null && message.data.length > 0) {
        print(
            'Message foreground also contained a notification: ${message.notification}');
        // onSelectNotification(json.encode(message.data));
      }
    });

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<NotificationSettings> getCurrent() async {
    return await FirebaseMessaging.instance.getNotificationSettings();
  }

  Future onSelectNotification(String? payload) async {
    print("payload " + payload!);
    // if (payload != null) {
    //   debugPrint('notification payload: ' + payload);
    //   // here set and put condition for property id
    //   var response = json.decode(payload) as Map;
    //   print("response : $response");
    //
    //   if (response.length > 0) {
    //     if (response["NOTIF_TYPE"].toString().toLowerCase() == "deeplink") {
    //       var linkUri = response["CONTENT"].toString().toLowerCase();
    //
    //       String? headerToken = "";
    //       if (F.appFlavor == Flavor.DEVELOPMENT) {
    //         headerToken = dev.sharedPreferences?.getString('PREF_HEADER_TOKEN');
    //       } else if (F.appFlavor == Flavor.PRODUCTION) {
    //         headerToken = prod.sharedPreferences?.getString('PREF_HEADER_TOKEN');
    //       }
    //
    //       var queryParams;
    //       if (linkUri != null && linkUri != "") {
    //         queryParams =
    //             Uri
    //                 .parse(linkUri)
    //                 .queryParametersAll
    //                 .entries
    //                 .toList();
    //         if (queryParams != null) {
    //           for (final item in queryParams) {
    //             if (item.key != null) {
    //               if (item.key.toString().toLowerCase() == "target") {
    //                 if (item.value != null) {
    //                   target = item.value[0].toString().toLowerCase();
    //                 }
    //               } else if (item.key.toString().toLowerCase() == "content") {
    //                 if (item.value != null) {
    //                   content = item.value[0].toString().toLowerCase();
    //                 }
    //               }
    //             }
    //           }
    //         }
    //       }
    //
    //       if (target != null) {
    //         if (headerToken != null || headerToken != "") {
    //           if (target == "home") {
    UserModel user = await AppSharedPreference.getUser();
    if (F.appFlavor == Flavor.DEVELOPMENT) {

      if (user.id != null && user.id != "") {
        dev.aliceDev.getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(
          RouteName.navBar,
          (Route<dynamic> route) => false,
          arguments: {'role': StringConstant.patient, 'initial_index': 0, 'is_from_notif': true},
        );
      } else {
        dev.aliceDev.getNavigatorKey()?.currentState?.pushReplacementNamed(
            RouteName.login,
            arguments: {'token_expired': false, 'is_from_register': false});
      }
    } else if (F.appFlavor == Flavor.PRODUCTION) {
      if (user.id != null || user.id != "") {
        prod.aliceProd.getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(
          RouteName.navBar,
              (Route<dynamic> route) => false,
          arguments: {'role': StringConstant.patient, 'initial_index': 0, 'is_from_notif': true},
        );
      } else {
        prod.aliceProd.getNavigatorKey()?.currentState?.pushReplacementNamed(
            RouteName.login,
            arguments: {'token_expired': false, 'is_from_register': false});
      }
    } else {
      if (user.id != null || user.id != "") {
        main.aliceMain.getNavigatorKey()?.currentState?.pushNamedAndRemoveUntil(
          RouteName.navBar,
              (Route<dynamic> route) => false,
          arguments: {'role': StringConstant.patient, 'initial_index': 0, 'is_from_notif': true},
        );
      } else {
        main.aliceMain.getNavigatorKey()?.currentState?.pushReplacementNamed(
            RouteName.login,
            arguments: {'token_expired': false, 'is_from_register': false});
      }
    }

    //           } else if (target == "store") {
    //             Navigator.push(
    //                 navigatorKey.currentState.context,
    //                 MaterialPageRoute(
    //                     settings: RouteSettings(name: MainPage.routeName),
    //                     builder: (context) =>
    //                         MainPage(
    //                             menuIndex: Menu.store,
    //                             nextMenu: content ?? "")));
    //           } else if (target == "rewards") {
    //             Navigator.push(
    //                 navigatorKey.currentState.context,
    //                 MaterialPageRoute(
    //                     settings: RouteSettings(name: MainPage.routeName),
    //                     builder: (context) =>
    //                         MainPage(
    //                             menuIndex: Menu.reward,
    //                             nextMenu: content ?? "")));
    //           } else if (target == "account") {
    //             Navigator.push(
    //                 navigatorKey.currentState.context,
    //                 MaterialPageRoute(
    //                     settings: RouteSettings(name: MainPage.routeName),
    //                     builder: (context) =>
    //                         MainPage(
    //                             menuIndex: Menu.account,
    //                             nextMenu: content ?? "")));
    //           } else {
    //             Navigator.push(
    //                 navigatorKey.currentState.context,
    //                 MaterialPageRoute(
    //                     settings: RouteSettings(name: MainPage.routeName),
    //                     builder: (context) =>
    //                         MainPage(
    //                             menuIndex: Menu.home,
    //                             fromNotif: true,
    //                             nextMenu: target ?? "",
    //                             content: content ?? "")));
    //           }
    //         }
    //       }
    //     }
    //   }
    // }
  }

  Future<void> handleMessageFromTerminatedState(BuildContext context) async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    var payload = initialMessage?.data;
    if (payload != null) {
      debugPrint('notification payload: ' + payload.toString());
      // here set and put condition for property id
      var response = payload;
      print("response : $response");

      if (response.length > 0) {
        if (response["NOTIF_TYPE"].toString().toLowerCase() == "deeplink") {
          var linkUri = response["CONTENT"].toString().toLowerCase();
          if (canLaunch(linkUri) != null) {
            launch(linkUri);
          }
        }
      }
    }
  }
}
