import 'package:flutter/material.dart';
import 'main.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onPlaceholderPressed;

  const NavBar({
    super.key,
    required this.onPlaceholderPressed,
  });

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home');
  }

  static const double _mobileBreakpoint = 600; // px

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        if (isMobile) {
          // MOBILE NAVBAR (collapsed)
          return Container(
            height: 56,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: onPlaceholderPressed, // e.g. open Drawer / menu
                ),
                GestureDetector(
                  onTap: () => navigateToHome(context),
                  child: const Text(
                    'Union Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    // TODO: navigate to cart
                  },
                ),
              ],
            ),
          );
        }

        // DESKTOP / TABLET NAVBAR (full)
        return Container(
          height: 100,
          color: Colors.white,
          child: Column(
            children: [
              // Header
              Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    // Top banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFF4d2963),
                      child: const Text(
                        'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    // Main header
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                navigateToHome(context);
                              },
                              child: Image.network(
                                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                height: 18,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    width: 18,
                                    height: 18,
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported,
                                          color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Spacer(),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 600),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    constraints: BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.person_outline,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    constraints: BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    constraints: BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    constraints: BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
