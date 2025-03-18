import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDcoQSAxlpsp-OXYDha6P09x25qsdz5vg0',
      appId: '1:684848913773:android:e31437beeda9a327c38e64',
      messagingSenderId: '684848913773',
      projectId: 'sokratesflutter-3',
      databaseURL: 'https://sokratesflutter-3-default-rtdb.asia-southeast1.firebasedatabase.app',
    ),
  );
  runApp(MyApp());
}

final databaseReference = FirebaseDatabase.instance.ref();

void writeData() {
  databaseReference.child('messages').push().set({
    'text': 'Hello, Firebase!',
    'timestamp': DateTime.now().toString(),
  });
}

void updateData(String key) {
  databaseReference.child('messages/$key').update({
    'text': 'Updated message',
  });
}

void deleteData(String key) {
  databaseReference.child('messages/$key').remove();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Realtime Database')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: writeData,
              child: Text('Add Message'),
            ),
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: databaseReference.child('messages').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.snapshot.value;
                    if (data != null) {
                      final messages = (data as Map).entries.toList();
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final key = messages[index].key;
                          final message = messages[index].value;
                          return ListTile(
                            title: Text(message['text']),
                            subtitle: Text(message['timestamp']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => updateData(key),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteData(key),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text('No messages yet.'));
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
