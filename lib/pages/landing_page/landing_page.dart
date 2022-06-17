import 'package:PregnancyApp/pages/landing_page/slider_modal.dart';
import 'package:flutter/material.dart';

import '../example_dashboard_chat_page/login_page/login_example_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  List<SliderModal> slides = [];
  // List<SliderModal> slides = new List<SliderModal>();
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = SliderModal().getAllSliders();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PageView.builder(scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            setState(() {
                          currentIndex = value;
                        });
            
          },
            itemCount: slides.length,
            // itemBuilder: (BuildContext context, int index) { 
              itemBuilder: (context, index) { 
              return Slider(
                image: slides[index].getImage(),
                title: slides[index].getTitle(),
                description: slides[index].getDescription(),

              );
             }, 
          ),),
           Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            // height: 60,
            // margin: EdgeInsets.all(40),
            // width: double.infinity,
            // color: Color.fromRGBO(255, 127, 144, 1),
            // child: TextButton(onPressed: () {
            //   if(currentIndex == slides.length - 1) {
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginExamplePage()));
            //   }
            // },
            // child: Text(
            //   currentIndex == slides.length - 1 ? "Selanjutnya": "Mulai Sekarang", style: TextStyle(color: Colors.white)
            // ),
            // ),
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            color: Color.fromRGBO(255, 127, 144, 1),
   
           // Button
           child: FlatButton(
             child: Text(
                 currentIndex == slides.length ? "Mulai Sekarang": "Selanjutnya"),
             onPressed: (){
               if(currentIndex == slides.length){
                 // Navigate to next screen
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginExamplePage()),
                 );
               }
               _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
             },
             textColor: Colors.white,
 
             // Border radius to button
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(25),
             ),
           ),
 
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(255, 235, 237, 1),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(255, 132, 148, 1),
      ),
    );
  
  }
}


class Slider extends StatelessWidget {

  String image;
  String title;
  String description;

  // Slider({Key? key, required this.image, required this.title, required this.desc}) :super(key: key);
  Slider({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
    child: Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image(image: AssetImage(image)),
      const SizedBox(height: 25),
      Text(title, style: const TextStyle(color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text(description, style: const TextStyle(color: Colors.black, fontSize: 18.0), textAlign: TextAlign.center),
    ],
    )  
    ));
  } 
}