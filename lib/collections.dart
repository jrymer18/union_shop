import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'Advert.dart';

// You can edit each item here:
class CollectionItem {
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.isNetworkImage = false, // <‑‑ default to asset if not specified
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
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Black Friday',
          imageUrl: 'https://via.placeholder.com/600x400?text=T-Shirts',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Clothing',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Clothing - Original',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Elections Discounts',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Essential Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Graduation',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Limited Edition Essential Zip Hoodies',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Merchandise',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Nike Final Chance',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Personalisation',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Popular',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Portsmouth City Collection',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Pride Collection',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Sale',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Signature & Essential Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Signiture Range',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Sports Clubs',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Spring Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Student Essentials',
          imageUrl: 'https://via.placeholder.com/600x400?text=Accessories',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Student Groups',
          imageUrl: 'https://via.placeholder.com/600x400?text=Stationery',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Summer essentials',
          imageUrl: 'https://via.placeholder.com/600x400?text=Gifts',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Summer Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Univeristy Clothing',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Univeristy Merchandise',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'UPSU Bears',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Winter Favourites',
          imageUrl: 'https://via.placeholder.com/600x400?text=Sale',
          isNetworkImage: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: AdvertBanner(),
          ),
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
                      return CollectionGridItem(
                        item: item,
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

class CollectionGridItem extends StatelessWidget {
  final CollectionItem item;

  const CollectionGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final imageWidget = item.isNetworkImage
        ? Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          )
        : Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          );

    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: imageWidget,
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
