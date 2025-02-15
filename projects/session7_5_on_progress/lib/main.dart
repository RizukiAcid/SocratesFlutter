// lib/main.dart
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Recorder & Player',
      home: AudioRecorderPage(),
    );
  }
}

class AudioRecorderPage extends StatefulWidget {
  const AudioRecorderPage({super.key});

  @override
  _AudioRecorderPageState createState() => _AudioRecorderPageState();
}

class _AudioRecorderPageState extends State<AudioRecorderPage> {
  final Record _record = Record();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _recordedFilePath;
  bool _isRecording = false;

  // Function to get temporary file path
  Future<String> getFilePath() async {
    Directory tempDir = await getTemporaryDirectory();
    String path = '${tempDir.path}/recording.m4a';
    return path;
  }

  // Start recording
  Future<void> _startRecording() async {
    if (await _record.hasPermission()) {
      String path = await getFilePath();
      await _record.start(
        path: path, // optional, if not provided, a temporary file will be used
        encoder: AudioEncoder.AAC, // You can use other encoders as needed
        bitRate: 128000,
        samplingRate: 44100,
      );
      setState(() {
        _isRecording = true;
        _recordedFilePath = path;
      });
    } else {
      // Handle permission denial gracefully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission not granted')),
      );
    }
  }

  // Stop recording
  Future<void> _stopRecording() async {
    String? path = await _record.stop();
    setState(() {
      _isRecording = false;
      _recordedFilePath = path;
    });
  }

  // Play the recorded audio
  Future<void> _playRecording() async {
    if (_recordedFilePath != null && File(_recordedFilePath!).existsSync()) {
      await _audioPlayer.play(DeviceFileSource(_recordedFilePath!));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No recording found')),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _record.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Recorder & Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playRecording,
              child: const Text('Play Recording'),
            ),
            const SizedBox(height: 20),
            Text(
              _recordedFilePath == null
                  ? 'No recording yet'
                  : 'Recorded File Path:\n$_recordedFilePath',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
