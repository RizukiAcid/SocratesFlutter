// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'rotating_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _noteController = TextEditingController();
  final Box _notesBox = Hive.box('notes');

  // Save note to Hive
  void _saveNote() {
    final note = _noteController.text;
    if (note.isNotEmpty) {
      _notesBox.add(note);
      _noteController.clear();
      setState(() {}); // Trigger UI update
    }
  }

  // Build list of saved notes from Hive box
  Widget _buildNotesList() {
    return ValueListenableBuilder(
      valueListenable: _notesBox.listenable(),
      builder: (context, Box box, _) {
        if (box.isEmpty) {
          return const Text('No notes yet.');
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: box.length,
          itemBuilder: (context, index) {
            final note = box.getAt(index);
            return ListTile(
              title: Text(note),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive & Animation Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Custom rotating widget displaying an icon.
            RotatingWidget(
              duration: const Duration(seconds: 5),
              child: Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Enter a note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Save Note'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Saved Notes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNotesList(),
          ],
        ),
      ),
    );
  }
}
