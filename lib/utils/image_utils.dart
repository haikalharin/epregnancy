import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:flutter/cupertino.dart';

import '../env.dart';
import '../flavors.dart';

class ImageUtils {

  static imageNetwork(String filePath) {
    var imageUrl = "${Configurations.host}${Configurations.sub_host}$filePath";

    return imageUrl;
  }
}
