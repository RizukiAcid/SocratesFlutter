// lib/item.dart
class Item {
  final int? id; // Make id nullable
  final String title;
  final String description;

  Item({this.id, required this.title, required this.description});

  // Create an Item from a JSON map
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  // Convert an Item to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'description': description,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
