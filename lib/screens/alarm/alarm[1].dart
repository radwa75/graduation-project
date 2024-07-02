import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


import 'alarm_sound1.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache(prefix: 'assets/');
  String? currentPlaying;
  bool isCustomTone = false;
  String? selectedTone;

  final List<String> tones = [
    'music-1.mp3',
    'music-2.mp3',
    'music-3.mp3',
    'music-4.mp3',
    'music-5.mp3',
    'music-6.mp3',
    'music-7.mp3',
  ];

  void _playAudio(String audioFile) async {
    if (currentPlaying == audioFile) {
      await _audioPlayer.stop();
      setState(() {
        currentPlaying = null;
      });
    } else {
      await _audioPlayer.stop();
      final filePath = await _audioCache.load(audioFile);
      await _audioPlayer.play(DeviceFileSource(filePath.path));
      setState(() {
        currentPlaying = audioFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(192, 255, 153, 0),
        title: Row(
          children: [
            SizedBox(
              width: 90,
            ),
            Text(
              'Select Tone',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 23),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CheckboxListTile(
                title: Text(
                  'Use Custom Tone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                value: isCustomTone,
                onChanged: (bool? value) {
                  setState(() {
                    isCustomTone = value ?? false;
                    if (!isCustomTone) {
                      selectedTone = null;
                    }
                  });
                },
              ),
              if (isCustomTone) ...[
                DropdownButton<String>(
                  hint: Text(
                    'Select a tone',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  value: selectedTone,
                  items: tones.map((String tone) {
                    return DropdownMenuItem<String>(
                      value: tone,
                      child: Text(
                        'Tone ${tone.split('-').last.split('.').first}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTone = newValue;
                      //print
                      if (selectedTone != null) {
                        print(selectedTone);
                      }
                    });
                  },
                ),
                ElevatedButton.icon(
                  onPressed: selectedTone != null
                      ? () => _playAudio(selectedTone!)
                      : null,
                  icon: Icon(
                    currentPlaying == selectedTone
                        ? Icons.stop
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: Text(
                    currentPlaying == selectedTone ? 'Stop' : 'Play',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 247, 192, 239),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                alarm2(selectedTone: selectedTone!)));
                  },
                  child: Text(
                    'Try Sound ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
