// lib/item_form_page.dart

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'item.dart';

class ItemFormPage extends StatefulWidget {
  final Item? item; // Null when creating a new item; non-null when editing

  const ItemFormPage({Key? key, this.item}) : super(key: key);

  @override
  _ItemFormPageState createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.item?.title ?? '');
    descriptionController = TextEditingController(text: widget.item?.description ?? '');
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      String title = titleController.text;
      String description = descriptionController.text;
      // Create a new item. Notice that if widget.item is null, we do not include an id.
      Item newItem = Item(
        id: widget.item?.id, // This will be null for new items.
        title: title,
        description: description,
      );
      try {
        if (widget.item == null) {
          await apiService.createItem(newItem);
        } else {
          // For update, ensure that the id is not null.
          await apiService.updateItem(widget.item!.id!, newItem);
        }
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Create Item' : 'Update Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: Text(widget.item == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
