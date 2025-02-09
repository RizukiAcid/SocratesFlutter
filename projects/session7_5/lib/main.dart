import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:isolate';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoiceRecorder(),
    );
  }
}

class VoiceRecorder extends StatefulWidget {
  @override
    _VoiceRecorderState createState() => _VoiceRecorderState();
  }

  class _VoiceRecorderState extends State<VoiceRecorder> {
    FlutterSoundRecorder? _recorder;
    FlutterSoundPlayer? _player;
    bool _isRecording = false;
    String? _filePath;

    @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    if (kIsWeb) {
      await _requestWebPermissions();
    }
    await _recorder!.openRecorder();
    await _player!.openPlayer();
  }

  Future<void> _requestWebPermissions() async {
    if (kIsWeb) {
      try {
        final status = await Permission.microphone.status;
        if (!status.isGranted) {
          final result = await Permission.microphone.request();
          if (!result.isGranted) {
            print('Microphone permission denied');
            return;
          }
        }
      } catch (e) {
        print('Error requesting microphone permission: $e');
      }
    }
  }

  Future<void> _startRecording() async {
    try {
      if (kIsWeb) {
        final blob = await _recorder!.startRecorder();
        if (blob != null) {
          print('Recording started successfully.');
        }
      } else {
        if (await Permission.microphone.request().isGranted) {
          _filePath = 'recording.aac';
          await _recorder!.startRecorder(
            toFile: _filePath,
            codec: Codec.aacADTS,
          );
        }
      }
      setState(() => _isRecording = true);
    } catch (e) {
      print('Error starting recorder: $e');
    }
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() => _isRecording = false);
  }

  Future<void> _playRecording() async {
    if (_filePath != null) {
      await _player!.startPlayer(
        fromURI: _filePath,
        codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
      );
    }
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    _player?.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Voice Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playRecording,
              child: Text('Play Recording'),
            ),
          ],
        ),
      ),
    );
  }
}