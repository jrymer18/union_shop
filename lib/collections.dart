import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  void _onPlaceholderPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // HEADER
      body: Column(
        children: [
          NavBar(onPlaceholderPressed: _onPlaceholderPressed),

          // PAGE CONTENT
          Expanded(
            child: Center(
              child: Text(
                'Collections content goes here',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          // FOOTER
          const AppFooter(),
        ],
      ),
    );
  }
}
