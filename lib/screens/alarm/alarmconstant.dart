import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'package:sasa/screens/child_home_page.dart';




class AlarmCon extends StatefulWidget {
  const AlarmCon({super.key});

  @override
  State<AlarmCon> createState() => _AlarmConState();
}

class _AlarmConState extends State<AlarmCon> {
  final player = AudioPlayer();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _playAlarm();

  }

  void _playAlarm() async {
    await player.play(AssetSource("music-1.mp3"));
    player.setReleaseMode(ReleaseMode.loop); // Set release mode to loop
  }

  void _stopAlarm() {
    player.stop(); // Stop the alarm sound
    _timer?.cancel(); // Cancel the timer
    _showDialog(); // Show dialog when the alarm is stopped
  }



  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: Text(
            'Great you are Awake!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'If you are tired, please get some rest',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                 Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  HomeScreen()));
              },
            ),
          ],
        );
      },
    );
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
                'assets/warningsign.json',
                height: 150,
                width: 200,
              ),
              SizedBox(height: 20), // Add some space between the animation and the buttons
              ElevatedButton(
                onPressed: () {
                  _stopAlarm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Set button background color to yellow
                ),
                child: Text('Stop'),
              ),
              // Add some space between the buttons

            ],
          ),
        ),
      ),
    );
  }
}
