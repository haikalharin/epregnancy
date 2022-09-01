import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/epragnancy_color.dart';

class PoinPlaceHolder extends StatelessWidget {
  const PoinPlaceHolder({Key? key, this.height, this.width, required this.point}) : super(key: key);
  final double? height;
  final double? width;
  final int point;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PoinIconWidget(height: height, width: width,),
        SizedBox(width: 5,),
        Text(
          point.toString(),
          style: TextStyle(
              color: EpregnancyColors.blackBack,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
