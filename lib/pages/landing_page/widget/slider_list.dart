import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderList extends StatelessWidget {
  String image;
  String title;
  String description;

  // Slider({Key? key, required this.image, required this.title, required this.desc}) :super(key: key);
  SliderList({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            const SizedBox(height: 25),
            Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text(description,
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
                textAlign: TextAlign.center),
          ],
        ));
  }
}