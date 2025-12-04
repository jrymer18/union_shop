import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "The ",
                  style: GoogleFonts.pacifico(
                    fontSize: 48,
                    color: const Color(0xFF3B2364),
                  ),
                ),
                Text(
                  "UNION",
                  style: GoogleFonts.archivoBlack(
                    fontSize: 52,
                    letterSpacing: 2,
                    color: const Color(0xFF3B2364),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                        icon: const Icon(Icons.search, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                        icon: const Icon(Icons.menu, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          height: 72,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Row(
            children: [
              const Text(
                'THE UNION',
                style: TextStyle(
                  color: Color(0xFF4d2963),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
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
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 32, minHeight: 32),
                    icon: const Icon(Icons.search, size: 22),
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 32, minHeight: 32),
                    icon: const Icon(Icons.person_outline, size: 22),
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 32, minHeight: 32),
                    icon: const Icon(Icons.shopping_bag_outlined, size: 22),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
