import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      'https://via.placeholder.com/400x150.png?text=Flight+Deals',
      'https://via.placeholder.com/400x150.png?text=Hotel+Promos',
      'https://via.placeholder.com/400x150.png?text=Train+Tickets'
    ];

    return SizedBox(
      height: 160, // gives a little breathing room
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                banners[index],
                fit: BoxFit.cover,
                // show a spinner while loading
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                // show an error icon if it fails
                errorBuilder: (context, error, stack) {
                  return const Center(child: Icon(Icons.error_outline, size: 40));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
