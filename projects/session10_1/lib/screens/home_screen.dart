import 'package:flutter/material.dart';
import 'package:session10_1/widgets/header.dart';
import 'package:session10_1/widgets/category_item.dart';
import 'package:session10_1/widgets/product_card.dart';
import 'package:session10_1/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Product> _products = [
  Product(
    id: '1',
    name: 'Wireless Headphones',
    price: 299000,
    rating: 4.8,
    imageUrl: 'assets/products/headphones.jpg',
    description: 'Noise-cancelling Bluetooth headphones with 30hr battery',
  ),
  Product(
    id: '2',
    name: 'iPhone 15 Pro',
    price: 19990000,
    rating: 4.9,
    imageUrl: 'assets/products/iphone.jpg',
    description: 'Latest Apple smartphone with A17 Pro chip',
  ),
  Product(
    id: '3',
    name: 'White Sneakers',
    price: 450000,
    rating: 4.5,
    imageUrl: 'assets/products/sneakers.jpg',
    description: 'Comfortable unisex sneakers - size 36-44',
  ),
  Product(
    id: '4',
    name: 'Fresh Avocados',
    price: 25000,
    rating: 4.2,
    imageUrl: 'assets/products/avocado.jpg',
    description: 'Organic Hass avocados (1kg pack)',
  ),
  Product(
    id: '5',
    name: 'Modern Chair',
    price: 1200000,
    rating: 4.7,
    imageUrl: 'assets/products/chair.jpg',
    description: 'Scandinavian design wooden chair',
  ),
  Product(
    id: '6',
    name: 'Floral Perfume',
    price: 350000,
    rating: 4.3,
    imageUrl: 'assets/products/perfume.jpg',
    description: 'Eau de toilette 100ml - long lasting',
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: Header(),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: _buildCategoryRow(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(product: _products[index]),
                childCount: _products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCategoryRow() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryItem(icon: Icons.phone_android, label: 'Electronics'),
          CategoryItem(icon: Icons.fastfood, label: 'Food'),
          CategoryItem(icon: Icons.local_offer, label: 'Deals'),
          CategoryItem(icon: Icons.shopping_bag, label: 'Fashion'),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFF3FAB3A),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}