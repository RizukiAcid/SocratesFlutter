import 'package:flutter/material.dart';
import 'api_service.dart';
import 'item.dart';
import 'item_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter App',
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  late Future<List<Item>> futureItems;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureItems = apiService.getItems();
  }

  // Refresh the list by re-fetching data
  void refreshItems() {
    setState(() {
      futureItems = apiService.getItems();
    });
  }

  // Delete an item and refresh the list
  void deleteItem(int id) async {
    await apiService.deleteItem(id);
    refreshItems();
  }

  // Navigate to the form for creating/updating an item
  void showItemForm({Item? item}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemFormPage(item: item)),
    ).then((value) => refreshItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Items'),
      ),
      body: FutureBuilder<List<Item>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Item> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Item item = items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ItemFormPage(item: item)),
                          ).then((value) => refreshItems());
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteItem(item.id!);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ItemFormPage()),
          ).then((value) => refreshItems());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
