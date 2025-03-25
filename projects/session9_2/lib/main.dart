import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/* 
class MyApp extends StatelessWidget {
  // ...existing code...
}
class MyHomePage extends StatefulWidget {
  // ...existing code...
}
class _MyHomePageState extends State<MyHomePage> {
  // ...existing code...
}
*/

final firestore = FirebaseFirestore.instance;

void addData() {
  firestore.collection('users').add({
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'timestamp': DateTime.now(),
  });
}

void updateData(String documentId) {
  firestore.collection('users').doc(documentId).update({
    'name': 'Updated Name',
  });
}

void deleteData(String documentId) {
  firestore.collection('users').doc(documentId).delete();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firestore Flutter App')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: addData,
              child: Text('Add User'),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index].data() as Map<String, dynamic>;
                        final documentId = users[index].id;
                        return ListTile(
                          title: Text(user['name']),
                          subtitle: Text(user['email']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => updateData(documentId),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => deleteData(documentId),
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
