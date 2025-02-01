import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? _cameraController;
  String? _location;
  html.VideoElement? _videoElement;

  Future<void> _aksesKamera() async {
    if (kIsWeb) {
      // Akses kamera untuk web (gunakan API browser)
      // Implementasi spesifik untuk web
      _videoElement = html.VideoElement();
      html.window.navigator.mediaDevices?.getUserMedia({'video': true}).then((stream) {
        _videoElement!.srcObject = stream;
        _videoElement!.autoplay = true;
        _videoElement!.style.width = '100%';
        _videoElement!.style.height = '100%';

        // Register the video element
        ui.platformViewRegistry.registerViewFactory(
          'videoElement',
          (int viewId) => _videoElement!,
        );

        setState(() {});
      }).catchError((e) {
        print('Error: $e');
      });
    } else {
      // Akses kamera untuk mobile (gunakan package camera)
      try {
        final cameras = await availableCameras();
        final firstCamera = cameras.first;
        _cameraController = CameraController(
          firstCamera,
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        setState(() {});
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  Future<void> _aksesLokasi() async {
    if (kIsWeb) {
      // Akses lokasi untuk web (gunakan API browser)
      // Implementasi spesifik untuk web
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _location = 'Lokasi: ${position.latitude}, ${position.longitude}';
        });
      } catch (e) {
        print('Error: $e');
      }
    } else {
      // Akses lokasi untuk mobile (gunakan package geolocator)
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _location = 'Lokasi: ${position.latitude}, ${position.longitude}';
        });
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi dengan Akses Fitur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _aksesKamera,
              child: Text('Akses Kamera'),
            ),
            ElevatedButton(
              onPressed: _aksesLokasi,
              child: Text('Akses Lokasi'),
            ),
            if (_cameraController != null && _cameraController!.value.isInitialized)
              Container(
                width: 300,
                height: 300,
                child: CameraPreview(_cameraController!),
              ),
            if (_videoElement != null)
              Container(
                width: 300,
                height: 300,
                child: HtmlElementView(viewType: 'videoElement'),
              ),
            if (_location != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_location!),
              ),
          ],
        ),
      ),
    );
  }
}