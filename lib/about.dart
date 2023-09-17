import 'package:flutter/material.dart';
import 'package:tugas2/countdown_timer.dart';
import 'package:tugas2/stopwatch.dart';

class About extends StatefulWidget {

  @override
  State<About> createState() => _AboutState();
}


class _AboutState extends State<About> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    About(),
    StopWatchApp(),
    CountdownTimer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
          SizedBox(
              width: 150,
              height: 100,
              child: Image.asset('images/logo.png',)
          ),
          SizedBox(width: 50, height: 50,),
          SizedBox(
              width: 150,
              height: 100,
              child: Image.asset('images/fti.png')
          ),
          Text(
            'Vincentius Randy Putra', style: TextStyle(fontSize: 24),
          ),
          Text('825210079', style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}
