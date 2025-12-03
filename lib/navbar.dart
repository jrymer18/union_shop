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

  // Example placeholders for other buttons:
  void navigateToShop(BuildContext context) {
    Navigator.of(context).pushNamed('/shop');
  }

  void navigateToPrintShack(BuildContext context) {
    Navigator.of(context).pushNamed('/print-shack');
  }

  void navigateToSale(BuildContext context) {
    Navigator.of(context).pushNamed('/sale');
  }

  void navigateToAbout(BuildContext context) {
    Navigator.of(context).pushNamed('/about');
  }

  void navigateToUpsu(BuildContext context) {
    Navigator.of(context).pushNamed('/upsu');
  }

  static const double _mobileBreakpoint = 600; // px

  @override
  Widget build(BuildContext context) {
    // Get current route name
    final currentRoute = ModalRoute.of(context)?.settings.name;

    // Helper to check if a route is the current page
    bool isCurrent(String routeName) => currentRoute == routeName;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        if (isMobile) {
          // MOBILE NAVBAR (collapsed into sandwich menu)
          return Container(
            height: 56,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Builder(
                  builder: (ctx) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(ctx).openDrawer(),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        }

        // DESKTOP / TABLET NAVBAR (show all items except current route)
        return Container(
          height: 72,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              if (!isCurrent('/home')) ...[
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
              if (!isCurrent('/shop')) ...[
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
                  child: const Text(
                    'SALE!',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
              if (!isCurrent('/about')) ...[
                GestureDetector(
                  onTap: () => navigateToAbout(context),
                  child: const Text('About'),
                ),
                const SizedBox(width: 24),
              ],
              if (!isCurrent('/upsu')) ...[
                GestureDetector(
                  onTap: () => navigateToUpsu(context),
                  child: const Text('UPSU.net'),
                ),
              ],
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
