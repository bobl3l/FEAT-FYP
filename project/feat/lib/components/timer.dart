import 'package:feat/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({super.key});

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  bool timer = false;
  bool paused = false;
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String seconds = ((milli ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the minute

    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          // this is the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timer == true
                ? Text(
                    returnFormattedText(),
                    style: GoogleFonts.lalezar(fontSize: 50),
                  )
                : SizedBox(
                    height: 40,
                  ),
            timer == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      paused != true
                          ? FilledButton.tonal(
                              onPressed: () {
                                setState(() {
                                  paused = true;
                                  stopwatch.stop();
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor)),
                              child: Text('PAUSE'))
                          : FilledButton.tonal(
                              onPressed: () {
                                setState(() {
                                  paused = false;
                                  stopwatch.start();
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor)),
                              child: Text('CONTINUE')),
                      FilledButton(
                          onPressed: () {
                            setState(() {
                              timer = false;
                              stopwatch.reset();
                              paused = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor)),
                          child: Text(
                            'FINISH',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )
                : FilledButton.tonal(
                    onPressed: () {
                      setState(() {
                        timer = true;
                        stopwatch.start();
                        paused = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    child: Text('START')),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
