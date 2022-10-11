import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CountDownCheckIn extends StatefulWidget {
  @override
  _CountDownCheckInState createState() => _CountDownCheckInState();
}

class _CountDownCheckInState extends State<CountDownCheckIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildItem("countdown", CountdownPage()),
          buildItem("countdown page", CountdownTimerPage()),
        ],
      ),
    );
  }

  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(title, style: TextStyle(fontSize: 36),),
      ),
    );
  }
}

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  CountdownController countdownController =
  CountdownController(duration: Duration(seconds: 30), onEnd: () {
    print('onEnd');
  });
  bool isRunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Countdown(
            countdownController: countdownController,
            builder: (_, Duration time) {
              return Text(
                'hours: ${time.inHours} minutes: ${time.inMinutes % 60} seconds: ${time.inSeconds % 60}',
                style: TextStyle(fontSize: 20),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child:
        Icon(isRunning ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if (!countdownController.isRunning) {
            countdownController.start();
            setState(() {
              isRunning = true;
            });
          } else {
            countdownController.stop();
            setState(() {
              isRunning = false;
            });
          }
        },
      ),
    );
  }
}

class CountdownTimerPage extends StatefulWidget {
  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch +
      Duration(seconds: 30).inMilliseconds;

  @override
  void initState() {
    super.initState();
    controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountdownTimer(
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
            onEnd: onEnd,
            endTime: endTime,
          ),
          CountdownTimer(
            controller: controller,
            widgetBuilder: (_, CurrentRemainingTime? time) {
              if (time == null) {
                return Text('Game over');
              }
              return Text(
                  'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
            },
          ),
          CountdownTimer(
            controller: controller,
            widgetBuilder: (BuildContext context, CurrentRemainingTime? time) {
              if (time == null) {
                return Text('Game over');
              }
              List<Widget> list = [];
              if (time.days != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_dissatisfied),
                    Text(time.days.toString()),
                  ],
                ));
              }
              if (time.hours != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_satisfied),
                    Text(time.hours.toString()),
                  ],
                ));
              }
              if (time.min != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_dissatisfied),
                    Text(time.min.toString()),
                  ],
                ));
              }
              if (time.sec != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied),
                    Text(time.sec.toString()),
                  ],
                ));
              }
              if (time.milliseconds != null) {
                list.add(Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied),
                    AnimatedBuilder(
                      animation: time.milliseconds!,
                      builder: (context, child) {
                        return Text("${(time.milliseconds!.value * 1000).toInt()}");
                      },
                    )
                  ],
                ));
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: () {
          onEnd();
          if (controller.isRunning) {
            controller.disposeTimer();
          } else {
            controller.start();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}