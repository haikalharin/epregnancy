import 'package:PregnancyApp/utils/epragnancy_color.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class PoinActivityPage extends StatelessWidget {
  const PoinActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.poinActivity),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: EpregnancyColors.primer
                ),
                child: SvgPicture.asset('assets/icPoin.svg'),
              ),
              Text('993', style: TextStyle(color: EpregnancyColors.blackBack, fontWeight: FontWeight.bold),)
            ],)
          ],
        ),
      ),
    );
  }
}
