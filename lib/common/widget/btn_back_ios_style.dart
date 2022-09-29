import 'package:flutter/material.dart';

class BtnBackIosStyle extends StatelessWidget {
  const BtnBackIosStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
      onPressed: (){
        Navigator.pop(context, 'back');
      },
    );
  }
}
