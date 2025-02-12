// lib/item.dart
class Item {
  final int id;
  final String title;
  final String description;

  Item({required this.id, required this.title, required this.description});

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
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
