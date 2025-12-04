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
                Row(
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
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu),
                      onSelected: (value) {
                        switch (value) {
                          case 'home':
                            if (!isCurrent('/main')) navigateToHome(context);
                            break;
                          case 'shop':
                            if (!isCurrent('/collections')) {
                              navigateToShop(context);
                            }
                            break;
                          case 'print-shack':
                            navigateToPrintShack(context);
                            break;
                          case 'sale':
                            navigateToSale(context);
                            break;
                          case 'about':
                            if (!isCurrent('/about')) navigateToAbout(context);
                            break;
                          case 'upsu':
                            navigateToUpsu(context);
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<String>(
                          value: 'home',
                          child: Text('Home'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'shop',
                          child: Text('Shop'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'print-shack',
                          child: Text('The Print Shack'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'sale',
                          child: Text('Sale'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'about',
                          child: Text('About'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'upsu',
                          child: Text('UPSU'),
                        ),
                      ],
                    ),
                  ],
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
                'The Union',
                style: TextStyle(
                  color: Colors.purple,
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 600;

                        if (isMobile) {
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
