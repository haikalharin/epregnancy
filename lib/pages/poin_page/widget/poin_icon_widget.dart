import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/epragnancy_color.dart';

class PoinIconWidget extends StatelessWidget {
  PoinIconWidget({Key? key, this.height = 20, this.width = 20}) : super(key: key);
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: EpregnancyColors.primer),
      child: SvgPicture.asset(
        'assets/icPoin.svg',
        height: height,
        width: width,
      ),
    );
  }
}
