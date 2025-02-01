import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _nama = '';

  @override
  void initState() {
    super.initState();
    _loadNama();
  }

  void _loadNama() {
    String? nama = html.window.localStorage['nama'];
    if (nama != null) {
      setState(() {
        _nama = nama;
      });
    }
  }

  void _simpanNama() {
    html.window.localStorage['nama'] = _nama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyimpanan Lokal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _simpanNama,
              child: Text('Simpan Nama'),
            ),
            Text('Nama: $_nama'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}