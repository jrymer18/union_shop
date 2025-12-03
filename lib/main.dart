import 'package:flutter/material.dart';
import 'package:union_shop/collections.dart';
import 'navbar.dart';
import 'about.dart';
import 'product_page.dart';
import 'footer.dart';
import 'Authenication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Union Shop',
      home: CollectionsPage(),
    );
  }
}

void placeholderCallbackForButtons() {}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/about': (context) => const AboutPage(),
        '/main': (context) => const UnionShopApp(),
        '/product': (context) => const ProductPage(),
        '/log': (context) => const AuthenticationPage(),
        '/collections': (context) => const CollectionsPage()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(
              onPlaceholderPressed: placeholderCallbackForButtons,
            ),
            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(
                              0xB3000000), // Equivalent to black with 70% opacity
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Placeholder Hero Title',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is placeholder text for the hero section.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Essentials Range',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Limited Edition Essential Zip Hoodies',
                          price: '£20.00',
                          imageUrl:
                              'https://lh3.googleusercontent.com/gg-dl/ABS2GSlsTFkq-ne8gM0odRMb7YfNIvWdWRNYMECQPGSWqRwfna8Byxdzk5RRAYn8ZbVJPHf5LdD1WFRiHplRHsHlU7gwsOY_E7d_IBuA8T9qdwiSw2viutcP-gnhm11R_BIe0aHw2bqkhl1IbgbUK8ziWG7wUFSHFaiGF564BmaQmu6tKQ9I=s1024-rj',
                        ),
                        ProductCard(
                          title: 'Essential T-Shirt',
                          price: '£10.00',
                          imageUrl:
                              'https://lh3.googleusercontent.com/gg-dl/ABS2GSnol4tZ0DFEzI0umn_dIwAgeYQXrTh-r8rYsiXFVi05pVlrEzo8YRD98gJOhREttu_qS4c3lA6TQsZRYIs9xWGOcxwDwfkqgNU8RaUUXbH-ajDYjBwQsZDDyzIa0v8hjZJHagNQRlIze-vM7fVo0AVhP48A25aKD-2IKMgcgxPu7bc_bg=s1024-rj',
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Signiture Range',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl: '',
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£14.99',
                          imageUrl: '',
                        ),
                        Text(
                          'Portsmouth City Collection',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                        ProductCard(
                          title: 'Portsmouth City Postcard',
                          price: '£1.00',
                          imageUrl: '',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£4.50',
                          imageUrl: '',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Bookmark',
                          price: '£3.00',
                          imageUrl: '',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Notebook',
                          price: '£7.50',
                          imageUrl: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const AppFooter(
              title: 'Union Shop',
              subtitle: 'Built for the community.',
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const _CollectionCard({
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1) Image at the very back
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),

            // 2) Optional dark gradient overlay for readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.15),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // 3) Text ON TOP of image
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black54,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
