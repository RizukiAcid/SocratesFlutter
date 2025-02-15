import 'package:universal_html/html.dart' as html;
import 'dart:html' as dart_html;
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as flutter_webrtc;
import 'package:webrtc_interface/webrtc_interface.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioRecorderScreen(),
    );
  }
}

class AudioRecorderScreen extends StatefulWidget {
  @override
  _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  flutter_webrtc.MediaRecorder? _mediaRecorder;
  List<dynamic> _recordedChunks = [];
  bool _isRecording = false;
  String? _audioUrl;

  // Initialize the recorder
  void _initRecorder() async {
    try {
      final stream = await dart_html.window.navigator.mediaDevices!.getUserMedia({'audio': true});
      _mediaRecorder = flutter_webrtc.MediaRecorder(stream);
      
      await _mediaRecorder!.start('audio/webm');
    } catch (e) {
      print('Error initializing recorder: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRecording ? null : () => _startRecording(),
              child: Text('Start Recording'),
            ),
            ElevatedButton(
              onPressed: !_isRecording ? null : () => _stopRecording(),
              child: Text('Stop Recording'),
            ),
            if (_audioUrl != null)
              ElevatedButton(
                onPressed: () => _playRecording(),
                child: Text('Play Recording'),
              ),
          ],
        ),
      ),
    );
  }

  void _startRecording() async {
    setState(() => _isRecording = true);
  }

  void _stopRecording() async {
    try {
      await _mediaRecorder?.stop();
      if (_recordedChunks.isNotEmpty) {
        // Use universal_html's Blob
        final blob = html.Blob(_recordedChunks, 'audio/webm');
        _audioUrl = html.Url.createObjectUrl(blob);
        setState(() {});
      }
    } finally {
      _recordedChunks.clear();
      setState(() => _isRecording = false);
    }
  }

  @override
  void dispose() {
    _mediaRecorder?.stop(); // Stop instead of dispose
    if (_audioUrl != null) {
      html.Url.revokeObjectUrl(_audioUrl!);
    }
    super.dispose();
  }

  void _playRecording() {
    final audio = html.AudioElement(_audioUrl);
    audio.play();
  }
}