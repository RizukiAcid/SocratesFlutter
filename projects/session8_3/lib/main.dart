// lib/main.dart
import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLite Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  // Refresh the list of items from the database
  void _refreshItems() async {
    final data = await _dbHelper.queryAllItems();
    setState(() {
      _items = data;
    });
  }

  // Insert a new item into the database
  Future<void> _addItem() async {
    await _dbHelper.insertItem({
      'name': _nameController.text,
      'description': _descController.text,
    });
    _nameController.clear();
    _descController.clear();
    _refreshItems();
  }

  // Update an existing item
  Future<void> _updateItem(int id) async {
    await _dbHelper.updateItem({
      'id': id,
      'name': _nameController.text,
      'description': _descController.text,
    });
    _nameController.clear();
    _descController.clear();
    _refreshItems();
  }

  // Delete an item
  Future<void> _deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    _refreshItems();
  }

  // Show a dialog for adding/updating an item
  void _showForm([Map<String, dynamic>? item]) {
    if (item != null) {
      _nameController.text = item['name'];
      _descController.text = item['description'] ?? '';
    }
    showModalBottomSheet(
      context: context,
      elevation: 5,
      builder: (_) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(item == null ? 'Add Item' : 'Update Item'),
              onPressed: () {
                if (item == null) {
                  _addItem();
                } else {
                  _updateItem(item['id']);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFLite Demo'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          final item = _items[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text(item['description'] ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showForm(item),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteItem(item['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(),
      ),
    );
  }
}
