import 'package:PregnancyApp/main_development.dart'as dev;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

import '../flavors.dart';
import '../main_production.dart' as prod;

class FirebaseAnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);


  Future<void> setCurrentScreen(String pageName) async {
    if (F.appFlavor == Flavor.PRODUCTION) {
       await analytics.setCurrentScreen(
        screenName: pageName,
        screenClassOverride: pageName,
      );
      if (kDebugMode) {
        print('setCurrentScreen $pageName succeeded');
      }
    } else{
      await analytics.setCurrentScreen(
        screenName: "${pageName}_dev",
        screenClassOverride: "${pageName}_dev",
      );
      if (kDebugMode) {
        print('setCurrentScreen ${pageName}_dev succeeded');
      }
    }

  }

  Future<void> sendAnalyticsEvent(String eventName, {Map<String,dynamic> data = const{}}) async {
    if (F.appFlavor == Flavor.PRODUCTION) {
      await analytics.logEvent(
          name: eventName,
          parameters: data
      );

      if (kDebugMode) {
        print('logEvent succeeded');
      }
    } else{
      await analytics.logEvent(
          name:  "${eventName}_dev",
          parameters: data
      );

      if (kDebugMode) {
        print('logEvent succeeded');
      }
    }
  }
}