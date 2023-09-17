import 'package:flutter/material.dart';
import 'package:tugas2/stopwatch.dart';

import 'about.dart';
import 'countdown_timer.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _State();
}

class _State extends State<MainScreen> {

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Timer',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
