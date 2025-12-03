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
      body: CustomScrollView(
        slivers: [
          // HEADER (NavBar)
          SliverToBoxAdapter(
            child: NavBar(onPlaceholderPressed: _onPlaceholderPressed),
          ),

          // PAGE CONTENT (your existing grid)
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.crossAxisExtent >= 900
                    ? 3
                    : constraints.crossAxisExtent >= 600
                        ? 2
                        : 1;

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 4 / 3,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _CollectionCard(
                        title: 'Collection ${index + 1}',
                        imageUrl:
                            'https://via.placeholder.com/600x400?text=Collection+${index + 1}',
                      );
                    },
                    childCount: 6,
                  ),
                );
              },
            ),
          ),

          // FOOTER (now part of scroll view)
          const SliverToBoxAdapter(
            child: AppFooter(),
          ),
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
