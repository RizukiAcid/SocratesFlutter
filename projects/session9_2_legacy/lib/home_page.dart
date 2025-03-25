// lib/home_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Function to add a note to Firestore
  Future<void> _addNote() async {
    final String noteText = _textController.text.trim();
    if (noteText.isNotEmpty) {
      await _notesCollection.add({
        'text': noteText,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _textController.clear();
    }
  }

  // Function to delete a note
  Future<void> _deleteNote(String docId) async {
    await _notesCollection.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text field to input a note
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter a note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addNote,
              child: const Text('Add Note'),
            ),
            const SizedBox(height: 20),
            // Display list of notes using StreamBuilder
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _notesCollection.orderBy('timestamp', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching notes'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.data;
                  if (data == null || data.docs.isEmpty) {
                    return const Center(child: Text('No notes available'));
                  }
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      final doc = data.docs[index];
                      final note = doc.get('text') ?? 'No text';
                      return ListTile(
                        title: Text(note),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteNote(doc.id),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
