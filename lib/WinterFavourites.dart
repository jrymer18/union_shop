import 'package:flutter/material.dart';
import 'Advert.dart';
import 'navbar.dart';
import 'footer.dart';

class WinterFavouritesPage extends StatelessWidget {
  const WinterFavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winter Favourites'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Menu')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdvertBanner(),
            NavBar(
              onPlaceholderPressed: () {
                // handle placeholder routes
              },
            ),
            const SizedBox(height: 24),
            const Center(
              child: Column(
                children: [
                  Text(
                    'Winter Favourites',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Shop all of this seasons must haves in one place!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 600;
                  final int crossAxisCount = isMobile ? 2 : 3;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 0.75,
                            children: const [
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Winter Hoodie',
                                price: '£29.99',
                              ),
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Beanie Hat',
                                price: '£9.99',
                              ),
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Scarf',
                                price: '£14.99',
                              ),
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Gloves',
                                price: '£7.99',
                              ),
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Fleece Jacket',
                                price: '£39.99',
                              ),
                              _WinterProductCard(
                                imageUrl: 'https://via.placeholder.com/300x300',
                                name: 'Thermal Mug',
                                price: '£12.99',
                              ),
                            ],
                          ),
                        ),
                        const AppFooter(), // footer now scrolls with content
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WinterProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const _WinterProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class WinterFavourites extends StatelessWidget {
  const WinterFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winter Favourites'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New header below navbar
            Text(
              'Winter Favourites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Shop all of this seasons must haves in one place!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),

            // ...existing code...
            // e.g. Expanded(child: GridView.builder(...))
          ],
        ),
      ),
    );
  }
}
