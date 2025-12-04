import 'package:flutter/material.dart';
import 'package:union_shop/WinterFavourites.dart';
import 'package:union_shop/collections.dart';
import 'navbar.dart';
import 'about.dart';
import 'product_page.dart';
import 'footer.dart';
import 'Authenication.dart';
import 'Advert.dart';

void main() {
  runApp(const UnionShopApp());
}

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
      routes: {
        '/about': (context) => const AboutPage(),
        '/main': (context) => const HomeScreen(),
        '/product': (context) => const ProductPage(),
        '/log': (context) => const AuthenticationPage(),
        '/collections': (context) => const CollectionsPage(),
        '/winter': (context) => const WinterPage(),
      },
    );
  }
}

void placeholderCallbackForButtons() {}

final List<_HeroSlideData> _heroSlides = [
  _HeroSlideData(
    title: 'Hungry',
    subtitle: 'We got this',
    image: 'https://example.com/hero_hungry.jpg',
  ),
  _HeroSlideData(
    title: 'Essentials range - Over 20% OFF!',
    subtitle:
        'Over 20% off our essentals range. Come and grab yours while stock lasts!',
    image: 'https://example.com/hero_essentials.jpg',
  ),
  _HeroSlideData(
    title: 'The Print Shack',
    subtitle:
        'Lets make something uniquely you with our personalisation service - From £3 for one line of text!',
    image: 'https://example.com/hero_print_shack.jpg',
  ),
];

class _HeroSlideData {
  final String title;
  final String subtitle;
  final String image;

  _HeroSlideData({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildHeroCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 260, // adjust to your hero height
          child: PageView.builder(
            controller: _pageController,
            itemCount: _heroSlides.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final slide = _heroSlides[index];
              return _HeroSlide(
                title: slide.title,
                subtitle: slide.subtitle,
                image: slide.image,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_heroSlides.length, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 20 : 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // FIXED BANNER (does not scroll)
          const AdvertBanner(),

          // SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NavBar(
                    onPlaceholderPressed: placeholderCallbackForButtons,
                  ),
                  // Hero Section
                  _buildHeroCarousel(), // use this instead of the old hero

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
          ),
        ],
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
      onTap: () {},
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

class _HeroSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const _HeroSlide({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey.shade300,
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(color: Colors.grey.shade300);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withAlpha((0.35 * 255).toInt()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // <‑ center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // <‑ center horizontally
            children: [
              Text(
                title,
                textAlign: TextAlign.center, // <‑ center text
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center, // <‑ center text
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
