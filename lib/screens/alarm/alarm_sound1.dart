import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';


 

class alarm2 extends StatefulWidget {
  final String selectedTone;

  const alarm2({Key? key, required this.selectedTone}) : super(key: key);

  @override
  State<alarm2> createState() => _alarm2State();
}

class _alarm2State extends State<alarm2> {
  final player = AudioPlayer();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _playAlarm();
    _startTimer();
  }

  void _playAlarm() async {
    await player.play(AssetSource(widget.selectedTone));
    player.setReleaseMode(ReleaseMode.loop); // Set release mode to loop
  }

  void _stopAlarm() {
    player.stop(); // Stop the alarm sound
    _timer?.cancel(); // Cancel the timer
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 30), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) =>
                // MyApp()), // Navigate to FooPage after 30 seconds
      // );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animation - 1710809578107 (1).json',
                height: 150,
                width: 200,
              ),
              SizedBox(
                  height:
                      20), // Add some space between the animation and the button
              ElevatedButton(
                onPressed: () {
                  _stopAlarm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellow, // Set button background color to yellow
                ),
                child: Text('Stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
