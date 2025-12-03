import 'package:flutter/material.dart';
import 'navbar.dart';
import 'Advert.dart';
import 'footer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    // Go to your main/home route
    Navigator.pushNamed(context, '/main');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with advert + navbar
            const AdvertBanner(),
            NavBar(onPlaceholderPressed: placeholderCallbackForButtons),

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    height: 260,
                    width: double.infinity,
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Text(
                      'Product Image Placeholder',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name
                  const Text(
                    'Placeholder Product Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price
                  const Text(
                    '£00.00',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text(
                    'This is a placeholder product description. '
                    'Add details about materials, sizing, and any other '
                    'information your customers need.',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'You can expand this section with bullet points, care '
                    'instructions, or extra selling points.',
                  ),

                  const SizedBox(height: 24),

                  // Simple “Back to shop” button example
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () => navigateToHome(context),
                      child: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            const AppFooter(
              subtitle: 'Built for the community.',
            ),
          ],
        ),
      ),
    );
  }
}
