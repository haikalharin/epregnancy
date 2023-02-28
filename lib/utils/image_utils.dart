import 'package:flutter/cupertino.dart';

import '../env.dart';
import '../flavors.dart';

class ImageUtils {

  static imageNetwork(String filePath) {
    var imageUrl = '';
    if (F.appFlavor == Flavor.PRODUCTION) {
      imageUrl = "${environment['host']}${environment['sub_host']}$filePath";
    } else {
      imageUrl =
          "${devEnvironment['host']}${devEnvironment['sub_host']}$filePath";
    }

    return imageUrl;
  }
}
