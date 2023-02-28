import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math'as math;

import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:countly_flutter/countly_config.dart';
import 'package:countly_flutter/countly_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class CountlyAnalyticsService {
  CountlyAnalyticsService(this.context);
  BuildContext context;
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  final bool _enableManualSession = false;
  final ratingIdController = TextEditingController();
  // final bool isManualSession = true;


  Future<void> setInitCountly() async {
    Countly.isInitialized().then((bool isInitialized) async {
      if (!isInitialized) {
        Countly.pushTokenType(Countly.messagingMode[
            'TEST']!); // Set messaging mode for push notifications

        var crashSegment = {'Key': 'Value'};
        var userProperties = {
          'customProperty': 'custom Value',
          'username': 'USER_NAME',
          'email': 'USER_EMAIL'
        };

        Map<String, String> attributionValues = {};
        if (Platform.isIOS) {
          attributionValues[AttributionKey.IDFA] = 'IDFA';
        } else {
          attributionValues[AttributionKey.AdvertisingID] = 'AdvertisingID';
        }

        String campaignData =
            '{cid:"[PROVIDED_CAMPAIGN_ID]", cuid:"[PROVIDED_CAMPAIGN_USER_ID]"}';
        var SERVER_URL = Configurations.countlyServerUrl;
        var APP_KEY = Configurations.countlyAppKey;
        CountlyConfig config = CountlyConfig(SERVER_URL, APP_KEY)
          ..enableCrashReporting() // Enable crash reporting to report unhandled crashes to Countly
          ..setRequiresConsent(
              true) // Set that consent should be required for features to work.
          ..setConsentEnabled([
            CountlyConsent.sessions,
            CountlyConsent.events,
            CountlyConsent.views,
            CountlyConsent.location,
            CountlyConsent.crashes,
            CountlyConsent.attribution,
            CountlyConsent.users,
            CountlyConsent.push,
            CountlyConsent.starRating,
            CountlyConsent.apm,
            CountlyConsent.feedback,
            CountlyConsent.remoteConfig
          ])
          ..setLocation(
              country_code: 'TR',
              city: 'Istanbul',
              ipAddress: '41.0082,28.9784',
              gpsCoordinates: '10.2.33.12') // Set user  location.
          ..setCustomCrashSegment(crashSegment)
          ..setUserProperties(userProperties)
          ..recordIndirectAttribution(attributionValues)
          ..recordDirectAttribution('countly', campaignData)
          ..setRemoteConfigAutomaticDownload(true, (error) {
            if (error != null) {
              print(error);
            }
          }) // Set Automatic value download happens when the SDK is initiated or when the device ID is changed.
          ..setRecordAppStartTime(
              true) // Enable APM features, which includes the recording of app start time.
          ..setStarRatingTextMessage('Message for start rating dialog')
          ..setLoggingEnabled(true) // Enable countly internal debugging logs
          ..setParameterTamperingProtectionSalt(
              'salt') // Set the optional salt to be used for calculating the checksum of requested data which will be sent with each request
          ..setHttpPostForced(
              false);

        Map<String, dynamic> _deviceData = <String, dynamic>{};
        final deviceInfoPlugin = DeviceInfoPlugin();
        _deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        config.setDeviceId(_deviceData['id']);

        // Set to 'true' if you want HTTP POST to be used for all requests
        if (_enableManualSession) {
          config.enableManualSessionHandling();
        }
        Countly.initWithConfig(config).then((value) {
          Countly.appLoadingFinished();
          Countly.start();

          /// Push notifications settings
          /// Should be call after init
          Countly.onNotification((String notification) {
            print('The notification');
            print(notification);
          }); // Set callback to receive push notifications
          Countly
              .askForNotificationPermission(); // This method will ask for permission, enables push notification and send push token to countly server.;

          Countly
              .giveAllConsent(); // give consent for all features, should be call after init
//        Countly.giveConsent(['events', 'views']); // give consent for some specific features, should be call after init.
        }); // Initialize the countly SDK.
      } else {
        print('Countly: Already initialized.');
      }
    });



  }
   isManualSession() {
    //
    if (!_enableManualSession) {
    }
    return _enableManualSession;
  }

  void beginSession() {
    if (isManualSession()) {
      Countly.beginSession();
    }
  }

  void updateSession() {
    if (isManualSession()) {
      Countly.updateSession();
    }
  }

  void endSession() {
    if (isManualSession()) {
      Countly.endSession();
    }
  }

  void basicEvent(Map<String,Object> data) {
    // example for basic event
    var event = data;
    Countly.recordEvent(event);
    log("#########countly success########");
  }

  void eventWithSum() {
    // example for event with sum
    var event = {
      'key': 'Event With Sum',
      'count': 1,
      'sum': '0.99',
    };
    Countly.recordEvent(event);
  }

  void eventWithSegment() {
    // example for event with segment
    var event = {'key': 'Event With Segment', 'count': 1};
    event['segmentation'] = {'Country': 'Turkey', 'Age': '28'};
    Countly.recordEvent(event);
  }

  void eventWithSumSegment() {
    // example for event with segment and sum
    var event = {'key': 'Event With Sum And Segment', 'count': 1, 'sum': '0.99'};
    event['segmentation'] = {'Country': 'Turkey', 'Age': '28'};
    Countly.recordEvent(event);
  }

  void endEventBasic() {
    Countly.startEvent('Timed Event');
    Timer(const Duration(seconds: 5), () {
      Countly.endEvent({'key': 'Timed Event'});
    });
  }

  void endEventWithSum() {
    Countly.startEvent('Timed Event With Sum');
    Timer(const Duration(seconds: 5), () {
      Countly.endEvent({'key': 'Timed Event With Sum', 'sum': '0.99'});
    });
  }

  void endEventWithSegment() {
    Countly.startEvent('Timed Event With Segment');
    Timer(const Duration(seconds: 5), () {
      var event = {
        'key': 'Timed Event With Segment',
        'count': 1,
      };
      event['segmentation'] = {'Country': 'Turkey', 'Age': '28'};
      Countly.endEvent(event);
    });
  }

  void endEventWithSumSegment() {
    Countly.startEvent('Timed Event With Segment, Sum and Count');
    Timer(const Duration(seconds: 5), () {
      var event = {'key': 'Timed Event With Segment, Sum and Count', 'count': 1, 'sum': '0.99'};
      event['segmentation'] = {'Country': 'Turkey', 'Age': '28'};
      Countly.endEvent(event);
    });
  }

  void recordViewHome() {
    Map<String, Object> segments = {'Cats': 123, 'Moons': 9.98, 'Moose': 'Deer'};
    Countly.recordView('HomePage', segments);
  }

  void recordViewDashboard() {
    Countly.recordView('Dashboard');
  }

  void recordDirectAttribution() {
    String campaignData = '{cid:"[PROVIDED_CAMPAIGN_ID]", cuid:"[PROVIDED_CAMPAIGN_USER_ID]"}';
    Countly.recordDirectAttribution('countly', campaignData);
  }

  void recordIndirectAttribution() {
    Map<String, String> attributionValues = {};
    if (Platform.isIOS) {
      attributionValues[AttributionKey.IDFA] = 'IDFA';
    } else {
      attributionValues[AttributionKey.AdvertisingID] = 'AdvertisingID';
    }
    Countly.recordIndirectAttribution(attributionValues);
  }

  String makeid() {
    int code = math.Random().nextInt(999999);
    String random = code.toString();
    print(random);
    return random;
  }

  void setUserData() {
    Map<String, Object> options = {
      'name': 'Name of User',
      'username': 'Username',
      'email': 'User Email',
      'organization': 'User Organization',
      'phone': 'User Contact number',
      'picture': 'https://count.ly/images/logos/countly-logo.png',
      'picturePath': '',
      'gender': 'User Gender',
      'byear': '1989',
    };
    Countly.setUserData(options);
  }

  void setProperty() {
    Countly.setProperty('setProperty', 'My Property');
  }

  void increment() {
    Countly.increment('increment');
  }

  void incrementBy() {
    Countly.incrementBy('incrementBy', 10);
  }

  void multiply() {
    Countly.multiply('multiply', 20);
  }

  void saveMax() {
    Countly.saveMax('saveMax', 100);
  }

  void saveMin() {
    Countly.saveMin('saveMin', 50);
  }

  void setOnce() {
    Countly.setOnce('setOnce', '200');
  }

  void pushUniqueValue() {
    Countly.pushUniqueValue('pushUniqueValue', 'morning');
  }

  void pushValue() {
    Countly.pushValue('pushValue', 'morning');
  }

  void pullValue() {
    Countly.pullValue('pushValue', 'morning');
  }

  //
  void giveMultipleConsent() {
    Countly.giveConsent(['events', 'views', 'star-rating', 'crashes']);
  }

  void removeMultipleConsent() {
    Countly.removeConsent(['events', 'views', 'star-rating', 'crashes']);
  }

  void giveAllConsent() {
    Countly.giveAllConsent();
  }

  void removeAllConsent() {
    Countly.removeAllConsent();
  }

  void giveConsentSessions() {
    Countly.giveConsent(['sessions']);
  }

  void giveConsentEvents() {
    Countly.giveConsent(['events']);
  }

  void giveConsentViews() {
    Countly.giveConsent(['views']);
  }

  void giveConsentLocation() {
    Countly.giveConsent(['location']);
  }

  void giveConsentCrashes() {
    Countly.giveConsent(['crashes']);
  }

  void giveConsentAttribution() {
    Countly.giveConsent(['attribution']);
  }

  void giveConsentUsers() {
    Countly.giveConsent(['users']);
  }

  void giveConsentPush() {
    Countly.giveConsent(['push']);
  }

  void giveConsentStarRating() {
    Countly.giveConsent(['star-rating']);
  }

  void giveConsentAPM() {
    Countly.giveConsent(['apm']);
  }

  void removeConsentsessions() {
    Countly.removeConsent(['sessions']);
  }

  void removeConsentEvents() {
    Countly.removeConsent(['events']);
  }

  void removeConsentViews() {
    Countly.removeConsent(['views']);
  }

  void removeConsentlocation() {
    Countly.removeConsent(['location']);
  }

  void removeConsentcrashes() {
    Countly.removeConsent(['crashes']);
  }

  void removeConsentattribution() {
    Countly.removeConsent(['attribution']);
  }

  void removeConsentusers() {
    Countly.removeConsent(['users']);
  }

  void removeConsentpush() {
    Countly.removeConsent(['push']);
  }

  void removeConsentstarRating() {
    Countly.removeConsent(['star-rating']);
  }

  void removeConsentAPM() {
    Countly.removeConsent(['apm']);
  }

  void askForNotificationPermission() {
    Countly.askForNotificationPermission();
  }

  void getABTestingValues() {
    Countly.remoteConfigUpdate((result) {
      Countly.getRemoteConfigValueForKey('baloon', (result) {
        String alertText = "Value for 'baloon' is : ${result.toString()}";
        _showDialog(alertText);
        print(alertText);
      });
    });
  }

  void eventForGoal_1() {
    var event = {'key': 'eventForGoal_1', 'count': 1};
    Countly.recordEvent(event);
  }

  void eventForGoal_2() {
    var event = {'key': 'eventForGoal_2', 'count': 1};
    Countly.recordEvent(event);
  }

  void remoteConfigUpdate() {
    Countly.remoteConfigUpdate((result) {
      print(result);
    });
  }

  void updateRemoteConfigForKeysOnly() {
    Countly.updateRemoteConfigForKeysOnly(['name'], (result) {
      print(result);
    });
  }

  void getRemoteConfigValueForKeyString() {
    Countly.getRemoteConfigValueForKey('stringValue', (result) {
      print(result);
    });
  }

  void getRemoteConfigValueForKeyBoolean() {
    Countly.getRemoteConfigValueForKey('booleanValue', (result) {
      print(result);
    });
  }

  void getRemoteConfigValueForKeyFloat() {
    Countly.getRemoteConfigValueForKey('floatValue', (result) {
      print(result);
    });
  }

  void getRemoteConfigValueForKeyInteger() {
    Countly.getRemoteConfigValueForKey('integerValue', (result) {
      print(result);
    });
  }

  void updateRemoteConfigExceptKeys() {
    Countly.updateRemoteConfigExceptKeys(['url'], (result) {
      print(result);
    });
  }

  void remoteConfigClearValues() {
    Countly.remoteConfigClearValues((result) {
      print(result);
    });
  }

  void getRemoteConfigValueForKey() {
    Countly.getRemoteConfigValueForKey('name', (result) {
      print(result);
    });
  }

  Future<void> getDeviceIDType() async {
    DeviceIdType? deviceIdType = await Countly.getDeviceIDType();

    log('######$deviceIdType#######');

  }

  void changeDeviceIdWithMerge() {
    Countly.changeDeviceId('123456', true);
  }

  void changeDeviceIdWithoutMerge() {
    Countly.changeDeviceId(makeid(), false);
  }

  void addCrashLog() {
    Countly.addCrashLog('User Performed Step A');
    Timer(const Duration(seconds: 5), () {
      Countly.logException('one.js \n two.js \n three.js', true, {'_facebook_version': '0.0.1'});
    });
  }

  void causeException() {
    Map<String, Object> options = json.decode('This is a on purpose error.');
    print(options.length);
  }

  void throwException() {
    throw StateError('This is an thrown Dart exception.');
  }

  void throwNativeException() {
    Countly.throwNativeException();
  }

  Future<void> throwExceptionAsync() async {
    Future<void> foo() async {
      throw StateError('This is an async Dart exception.');
    }

    Future<void> bar() async {
      await foo();
    }

    await bar();
  }

  void recordExceptionManually() {
    Countly.logException('This is a manually created exception', true, null);
  }

  void dividedByZero() {
    try {
      int firstInput = 20;
      int secondInput = 0;
      int result = firstInput ~/ secondInput;
      print('The result of $firstInput divided by $secondInput is $result');
    } catch (e, s) {
      print('Exception occurs: $e');
      print('STACK TRACE\n: $s');
      Countly.logExceptionEx(e as Exception, true, stacktrace: s);
    }
  }

  void askForStarRating() {
    Countly.askForStarRating();
  }

  void presentRatingWidget() {
    // Trying to show a rating widget with a previously know ID.
    // You should replace the given ID with your own, it would be retrieved from your Countly Dashboard.
    Countly.presentRatingWidgetWithID('61eaaf37c935575c7b932b97', closeButtonText: 'close', ratingWidgetCallback: (error) {
      if (error != null) {
        print(error);
      }
    });
  }

  void presentRatingWidgetUsingEditBox() {
    // Trying to show a rating widget with the ID give in the App.
    // In the EditBox you would write the ID that you retrieved from your Countly Dashboard.
    Countly.presentRatingWidgetWithID(ratingIdController.text, closeButtonText: 'close', ratingWidgetCallback: (error) {
      if (error != null) {
        print(error);
      }
    });
  }

  Future<void> showFeedbackWidget() async {
    FeedbackWidgetsResponse feedbackWidgetsResponse = await Countly.getAvailableFeedbackWidgets();
    List<CountlyPresentableFeedback> widgets = feedbackWidgetsResponse.presentableFeedback;
    String? error = feedbackWidgetsResponse.error;

    if (error != null) {
      return;
    }

    if (widgets.isNotEmpty) {
      await Countly.presentFeedbackWidget(widgets.first, 'Close', widgetShown: () {
        print('showFeedbackWidget widget shown');
      }, widgetClosed: () {
        print('showFeedbackWidget widget closed');
      });
    }
  }

  Future<void> showSurvey() async {
    FeedbackWidgetsResponse feedbackWidgetsResponse = await Countly.getAvailableFeedbackWidgets();
    List<CountlyPresentableFeedback> widgets = feedbackWidgetsResponse.presentableFeedback;
    String? error = feedbackWidgetsResponse.error;

    if (error != null) {
      return;
    }

    for (CountlyPresentableFeedback widget in widgets) {
      if (widget.type == 'survey') {
        await Countly.presentFeedbackWidget(widget, 'Cancel');
        break;
      }
    }
  }
  void _showDialog(String alertText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!!'),
          content: Text(alertText),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showNPS() async {
    FeedbackWidgetsResponse feedbackWidgetsResponse = await Countly.getAvailableFeedbackWidgets();
    List<CountlyPresentableFeedback> widgets = feedbackWidgetsResponse.presentableFeedback;
    String? error = feedbackWidgetsResponse.error;

    if (error != null) {
      return;
    }

    for (CountlyPresentableFeedback widget in widgets) {
      if (widget.type == 'nps') {
        await Countly.presentFeedbackWidget(widget, 'Close', widgetShown: () {
          print('NPS widget shown');
        }, widgetClosed: () {
          print('NPS widget closed');
        });
        break;
      }
    }
  }

  Future<void> reportSurveyManually() async {
    FeedbackWidgetsResponse feedbackWidgetsResponse = await Countly.getAvailableFeedbackWidgets();
    List<CountlyPresentableFeedback> widgets = feedbackWidgetsResponse.presentableFeedback;
    String? error = feedbackWidgetsResponse.error;

    if (error != null) {
      return;
    }
    CountlyPresentableFeedback? chosenWidget;
    for (CountlyPresentableFeedback widget in widgets) {
      if (widget.type == 'survey') {
        chosenWidget = widget;
        break;
      }
    }
    if (chosenWidget != null) {
      unawaited(reportSurvey(chosenWidget));
    }
  }

  Future<void> reportSurvey(CountlyPresentableFeedback chosenWidget) async {
    List result = await Countly.getFeedbackWidgetData(chosenWidget);
    String? error = result[1];
    if (error == null) {
      Map<String, dynamic>? retrievedWidgetData = result[0];
      Map<String, Object> segments = {};
      if (retrievedWidgetData != null && retrievedWidgetData.isNotEmpty) {
        List<dynamic>? questions = retrievedWidgetData['questions'];

        if (questions != null) {
          math.Random rnd = math.Random();
          //iterate over all questions and set random answers
          for (int a = 0; a < questions.length; a++) {
            Map<dynamic, dynamic> question = questions[a];
            String wType = question['type'];
            String questionId = question['id'];
            String answerKey = 'answ-$questionId';
            switch (wType) {
            //multiple answer question
              case 'multi':
                List<dynamic> choices = question['choices'];
                String str = '';
                for (int b = 0; b < choices.length; b++) {
                  if (b % 2 == 0) {
                    if (b != 0) {
                      str += ',';
                    }
                    str += choices[b]['key'];
                  }
                }
                segments[answerKey] = str;
                break;
              case 'radio':
              //dropdown value selector
              case 'dropdown':
                List<dynamic> choices = question['choices'];
                int pick = rnd.nextInt(choices.length);
                segments[answerKey] = choices[pick]['key']; //pick the key of random choice
                break;
            //text input field
              case 'text':
                segments[answerKey] = 'Some random text';
                break;
            //rating picker
              case 'rating':
                segments[answerKey] = rnd.nextInt(11);
                break;
            }
          }
        }
      }
      await Countly.reportFeedbackWidgetManually(chosenWidget, retrievedWidgetData ?? {}, segments);
    }
  }

  Future<void> reportNPSManually() async {
    FeedbackWidgetsResponse feedbackWidgetsResponse = await Countly.getAvailableFeedbackWidgets();
    List<CountlyPresentableFeedback> widgets = feedbackWidgetsResponse.presentableFeedback;
    String? error = feedbackWidgetsResponse.error;

    if (error != null) {
      return;
    }

    CountlyPresentableFeedback? chosenWidget;
    for (CountlyPresentableFeedback widget in widgets) {
      if (widget.type == 'nps') {
        chosenWidget = widget;
        break;
      }
    }
    if (chosenWidget != null) {
      reportNPS(chosenWidget);
    }
  }

  void reportNPS(CountlyPresentableFeedback chosenWidget) {
    Countly.getFeedbackWidgetData(chosenWidget, onFinished: (retrievedWidgetData, error) {
      if (error == null) {
        Map<String, Object> segments = {'rating': 3, 'comment': 'Filled out comment'};
        Countly.reportFeedbackWidgetManually(chosenWidget, retrievedWidgetData, segments);
      }
    });
  }

  void setLocation() {
    Countly.setUserLocation(countryCode: 'TR', city: 'Istanbul', gpsCoordinates: '41.0082,28.9784', ipAddress: '10.2.33.12');
  }

  // APM Examples
  void startTrace() {
    String traceKey = 'Trace Key';
    Countly.startTrace(traceKey);
  }

  void endTrace() {
    String traceKey = 'Trace Key';
    Map<String, int> customMetric = {'ABC': 1233, 'C44C': 1337};
    Countly.endTrace(traceKey, customMetric);
  }

  List<int> successCodes = [100, 101, 200, 201, 202, 205, 300, 301, 303, 305];
  List<int> failureCodes = [400, 402, 405, 408, 500, 501, 502, 505];

  void recordNetworkTraceSuccess() {
    String networkTraceKey = 'api/endpoint.1';
    var rnd = math.Random();
    int responseCode = successCodes[rnd.nextInt(successCodes.length)];
    int requestPayloadSize = rnd.nextInt(700) + 200;
    int responsePayloadSize = rnd.nextInt(700) + 200;
    int startTime = DateTime.now().millisecondsSinceEpoch;
    int endTime = startTime + 500;
    Countly.recordNetworkTrace(networkTraceKey, responseCode, requestPayloadSize, responsePayloadSize, startTime, endTime);
  }

  void recordNetworkTraceFailure() {
    String networkTraceKey = 'api/endpoint.1';
    var rnd = math.Random();
    int responseCode = failureCodes[rnd.nextInt(failureCodes.length)];
    int requestPayloadSize = rnd.nextInt(700) + 250;
    int responsePayloadSize = rnd.nextInt(700) + 250;
    int startTime = DateTime.now().millisecondsSinceEpoch;
    int endTime = startTime + 500;
    Countly.recordNetworkTrace(networkTraceKey, responseCode, requestPayloadSize, responsePayloadSize, startTime, endTime);
  }
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'systemFeatures': build.systemFeatures,
  };
}


