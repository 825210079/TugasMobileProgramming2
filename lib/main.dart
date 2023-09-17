import 'package:flutter/material.dart';
import 'package:tugas2/countdown_timer.dart';
import 'package:tugas2/mainscreen.dart';
import 'about.dart';
import 'package:tugas2/stopwatch.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget{
  Widget build (BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      //CountdownTimer(),
      //StopWatch(),
      //About(),
    );
  }
}