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
                const Text(
                  'The Union',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Icons closer to the sandwich menu
                Padding(
                  padding: const EdgeInsets.only(right: 4), // pulls them right
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
                        icon: const Icon(Icons.person_outline, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                        icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
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

                    // Mobile: dropdown, Desktop: separate items
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 600;

                        if (isMobile) {
                          // DROPDOWN FOR MOBILE
                          return Row(
                            children: [
                              PopupMenuButton<String>(
                                child: const Row(
                                  children: [
                                    Text(
                                      'Shop',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                onSelected: (value) {
                                  switch (value) {
                                    case 'shop':
                                      if (!isCurrent('/collections')) {
                                        navigateToShop(context);
                                      }
                                      break;
                                    case 'print-shack':
                                      if (!isCurrent('/print-shack')) {
                                        navigateToPrintShack(context);
                                      }
                                      break;
                                    case 'sale':
                                      if (!isCurrent('/sale')) {
                                        navigateToSale(context);
                                      }
                                      break;
                                  }
                                },
                                itemBuilder: (context) => [
                                  if (!isCurrent('/collections'))
                                    const PopupMenuItem<String>(
                                      value: 'shop',
                                      child: Text('Shop'),
                                    ),
                                  if (!isCurrent('/print-shack'))
                                    const PopupMenuItem<String>(
                                      value: 'print-shack',
                                      child: Text('The Print Shack'),
                                    ),
                                  if (!isCurrent('/sale'))
                                    const PopupMenuItem<String>(
                                      value: 'sale',
                                      child: Text('Sale'),
                                    ),
                                ],
                              ),
                              const SizedBox(width: 24),
                            ],
                          );
                        }

                        // DESKTOP / LARGE: original separate items
                        return Row(
                          children: [
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
                        );
                      },
                    ),

                    // ...existing code for About, UPSU, etc.
                  ],
                ),
              ),

              // RIGHT: icons (search, account, bag)
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
