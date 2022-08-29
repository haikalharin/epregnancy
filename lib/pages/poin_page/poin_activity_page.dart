import 'package:PregnancyApp/pages/poin_page/widget/poin_icon_widget.dart';
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
        title: const Text(StringConstant.poinActivity, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: EpregnancyColors.blackBack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(
                  children: [
                    PoinIconWidget(height: 10, width: 10),
                    SizedBox(width: 10,),
                    Text('Total Poin: 993', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: EpregnancyColors.blueDark),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: EpregnancyColors.borderGrey, width: 1)
                ),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: PoinIconWidget(height: 20, width: 20,),
                        title: Text('Check-in', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        subtitle: Text('24 Sep 2022 . 08:20', style: TextStyle(color: EpregnancyColors.greyText),),
                        trailing: Text('+750', style: TextStyle(color: EpregnancyColors.blueDark),),
                      );
                    },
                  separatorBuilder: (context, index) {
                      return Divider(height: 1, color: EpregnancyColors.borderGrey,);
                }, itemCount: 4),
              )
            ],
          ),
        )
      ),
    );
  }
}
