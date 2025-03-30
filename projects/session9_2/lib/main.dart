import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirestoreDemo());
}

class FirestoreDemo extends StatelessWidget {
  const FirestoreDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Firestore Demo')),
        body: const FirestoreInteraction(),
      ),
    );
  }
}

class FirestoreInteraction extends StatefulWidget {
  const FirestoreInteraction({super.key});

  @override
  State<FirestoreInteraction> createState() => _FirestoreInteractionState();
}

class _FirestoreInteractionState extends State<FirestoreInteraction> {
  final _firestore = FirebaseFirestore.instance;

  Future<void> _addData() async {
    await _firestore.collection('test').add({
      'message': 'Hello Firestore',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addData,
          child: const Text('Add Test Data'),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('test').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return ListTile(
                    title: Text(doc['message']),
                    subtitle: Text(doc['timestamp'].toString()),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
