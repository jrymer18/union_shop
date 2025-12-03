import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onPlaceholderPressed;

  const NavBar({
    super.key,
    required this.onPlaceholderPressed,
  });

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/main');
  }

  void navigateToShop(BuildContext context) {
    Navigator.pushNamed(context, '/collections');
  }

  void navigateToPrintShack(BuildContext context) {
    onPlaceholderPressed();
  }

  void navigateToSale(BuildContext context) {
    onPlaceholderPressed();
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void navigateToUpsu(BuildContext context) {
    onPlaceholderPressed();
  }

  static const double _mobileBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    bool isCurrent(String routeName) => currentRoute == routeName;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        if (isMobile) {
          return Container(
            height: 56,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "The Union" brand for mobile
                const Text(
                  'The Union',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // e.g. your menu / hamburger icon or actions:
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // open drawer or show bottom sheet, etc.
                  },
                ),
              ],
            ),
          );
        }

        // DESKTOP / TABLET NAVBAR (show all items except current route)
        return Container(
          height: 72,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Row(
            children: [
              // Left: "The Union" in purple
              const Text(
                'The Union',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              // Center: nav items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isCurrent('/main')) ...[
                      GestureDetector(
                        onTap: () => navigateToHome(context),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                    if (!isCurrent('/collections')) ...[
                      GestureDetector(
                        onTap: () => navigateToShop(context),
                        child: const Text('Shop'),
                      ),
                      const SizedBox(width: 24),
                    ],
                    if (!isCurrent('/print-shack')) ...[
                      GestureDetector(
                        onTap: () => navigateToPrintShack(context),
                        child: const Text('The Print Shack'),
                      ),
                      const SizedBox(width: 24),
                    ],
                    if (!isCurrent('/sale')) ...[
                      GestureDetector(
                        onTap: () => navigateToSale(context),
                        child: const Text('Sale'),
                      ),
                      const SizedBox(width: 24),
                    ],
                    // ...existing code for About, UPSU, etc.
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
