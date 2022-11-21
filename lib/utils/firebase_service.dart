
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';

import '../flavors.dart';

class FirebaseService {

  late RemoteConfig remoteConfig;

  Future<void> initializeFlutterFirebase(BuildContext context) async {
    await Firebase.initializeApp();
    // if (F.appFlavor == Flavor.PRODUCTION) await crashlytics.initializeFlutterFire();
    remoteConfig = RemoteConfig.instance;
    remoteConfig.setDefaults(<String, dynamic>{
      'cornerscard_force_update_version': 0,
      'cornerscard_force_update_version_dev': 0,
      'cornerscard_force_update_text': '',
      'cornerscard_force_update_text_dev': '',
      'cornerscard_flexible_update_version': 0,
      'cornerscard_flexible_update_version_dev': 0,
      'maximum_home_benefit': 5,
      'maximum_home_benefit_dev': 5,
    });

    if (F.appFlavor == Flavor.DEVELOPMENT) {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(seconds: 30),
      ));
    } else {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(minutes: 10),
        minimumFetchInterval: Duration(minutes: 30),
      ));
    }
    try {
      await remoteConfig.fetchAndActivate();
    } catch (exception) {
      debugPrint('Unable to fetch remote config. Cached or default values will '
          'be');
    }

    // await messaging.handleMessageFromTerminatedState(context);
    // await messaging.setup(context);
  }
}
