import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  bool _isRunning = false;

  Timer? _timer;

  // This function will be called when the user presses the start button
  // Start the timer
  // The timer will run every second
  // The timer will stop when the hours, minutes and seconds are all 0
  void _startCountDown() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            if (_hours > 0) {
              _hours--;
              _minutes = 59;
              _seconds = 59;
            } else {
              _isRunning = false;
              _timer?.cancel();
            }
          }
        }
      });
    });
  }

  void _cancelCountDown() {
    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _pauseCountDown(){
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void dispose(){
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hours: $_hours', style: TextStyle(fontSize: 25)),
                Slider(
                  value: _hours.toDouble(),
                  min: 0,
                  max: 24,
                  onChanged: (value){
                    if (!_isRunning){
                      setState(() {
                        _hours = value.toInt();
                      });
                    }
                  },
                  divisions: 100,
                  label: "Hours: $_hours",
                ),
                Text('Minutes: $_minutes', style: TextStyle(fontSize: 25)),
                Slider(
                  value: _minutes.toDouble(),
                  min: 0,
                  max: 59,
                  onChanged: (value){
                    if (!_isRunning){
                      setState(() {
                        _minutes = value.toInt();
                      });
                    }
                  },
                  divisions: 100,
                  label: "Minutes: $_minutes",
                ),
                Text('Seconds: $_seconds', style: TextStyle(fontSize: 25)),
                Slider(
                  value: _seconds.toDouble(),
                  min: 0,
                  max: 59,
                  onChanged: (value){
                    if (!_isRunning){
                      setState(() {
                        _seconds = value.toInt();
                      });
                    }
                  },
                  divisions: 100,
                  label: "Seconds: $_seconds",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_isRunning){
                        _pauseCountDown();
                      } else {
                        _startCountDown();
                      }
                    },
                    style:
                    ElevatedButton.styleFrom(fixedSize: Size(130, 20)),
                    child: _isRunning ? const Text('Pause') : const Text("Start")
                ),
                ElevatedButton(
                    onPressed: _cancelCountDown,
                    style:
                    ElevatedButton.styleFrom(
                        fixedSize: Size(130, 20),
                        backgroundColor: Colors.amber),
                    child: const Text("Cancel"))
              ],
            )
            // MaterialButton(onPressed: _startCountDown,
            // child: Text('S T A R T'), color: Colors.blueAccent,
            // ),
          ],
        ),
      ),
    );
  }
}
