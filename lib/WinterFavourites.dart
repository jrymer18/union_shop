import 'package:flutter/material.dart';
import 'Advert.dart';
import 'navbar.dart';
import 'footer.dart';

class WinterFavouritesPage extends StatelessWidget {
  const WinterFavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // only if you use the mobile menu
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Menu')),
            // add items here
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AdvertBanner(), // from Advert.dart
          NavBar(
            onPlaceholderPressed: () {
              // handle placeholder routes
            },
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // existing winter favourites content goes here
                ],
              ),
            ),
          ),
          const AppFooter(), // from footer.dart
        ],
      ),
    );
  }
}
