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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // 3 per row on wide, fewer on small
                  final crossAxisCount = constraints.maxWidth >= 900
                      ? 3
                      : constraints.maxWidth >= 600
                          ? 2
                          : 1;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 4 / 3,
                    ),
                    itemCount: 6, // number of boxes
                    itemBuilder: (context, index) {
                      return _CollectionCard(
                        title: 'Collection ${index + 1}',
                        imageUrl:
                            'https://via.placeholder.com/600x400?text=Collection+${index + 1}',
                      );
                    },
                  );
                },
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

class _CollectionCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const _CollectionCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),

          // Dark overlay for text readability
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          // Text over the top
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
