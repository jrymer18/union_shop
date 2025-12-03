import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';

// You can edit each item here:
class CollectionItem {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.onTap,
  });
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  void _onPlaceholderPressed() {}

  // EDIT THESE TO CONTROL EACH GRID ITEM
  List<CollectionItem> get _items => const [
        CollectionItem(
          title: 'Autum Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Hoodies',
        ),
        CollectionItem(
          title: 'Black Friday',
          imageUrl: 'https://via.placeholder.com/600x400?text=T-Shirts',
        ),
        CollectionItem(
          title: 'Clothing',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
        ),
        CollectionItem(
          title: 'Clothing - Original',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
        ),
        CollectionItem(
          title: 'Elections Discounts',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
        ),
        CollectionItem(
          title: 'Essential Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Graduation',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Limited Edition Essential Zip Hoodies',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Merchandise',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Nike Final Chance',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Personalisation',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
        ),
        CollectionItem(
          title: 'Popular',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
        ),
        CollectionItem(
          title: 'Portsmouth City Collection',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
        ),
        CollectionItem(
          title: 'Pride Collection',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Sale',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Signature & Essential Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Signiture Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Sports Clubs',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Spring Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Student Essentials',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
        ),
        CollectionItem(
          title: 'Student Groups',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
        ),
        CollectionItem(
          title: 'Summer essentials',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
        ),
        CollectionItem(
          title: 'Summer Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Univeristy Clothing',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Univeristy Merchandise',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'UPSU Bears',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
        CollectionItem(
          title: 'Winter Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: NavBar(onPlaceholderPressed: _onPlaceholderPressed),
          ),
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
                      final item = _items[index];
                      return _CollectionCard(
                        title: item.title,
                        imageUrl: item.imageUrl,
                        onTap: item.onTap,
                      );
                    },
                    childCount: _items.length,
                  ),
                );
              },
            ),
          ),
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
  final VoidCallback? onTap;

  const _CollectionCard({
    required this.title,
    required this.imageUrl,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
