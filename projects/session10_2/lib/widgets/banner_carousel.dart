import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({Key? key}) : super(key: key);

  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  final List<String> images = [
    'https://via.placeholder.com/400x150.png?text=Promo+1',
    'https://via.placeholder.com/400x150.png?text=Promo+2',
    'https://via.placeholder.com/400x150.png?text=Promo+3',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // slightly more height to avoid clipping corners
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error_outline));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
