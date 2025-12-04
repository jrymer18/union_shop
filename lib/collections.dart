import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'Advert.dart';

class CollectionItem {
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.onTap,
  });
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  List<CollectionItem> get _items => const [
        CollectionItem(
          title: 'Autum Favourites',
          imageUrl:
              'https://lh3.googleusercontent.com/gg-dl/ABS2GSlsTFkq-ne8gM0odRMb7YfNIvWdWRNYMECQPGSWqRwfna8Byxdzk5RRAYn8ZbVJPHf5LdD1WFRiHplRHsHlU7gwsOY_E7d_IBuA8T9qdwiSw2viutcP-gnhm11R_BIe0aHw2bqkhl1IbgbUK8ziWG7wUFSHFaiGF564BmaQmu6tKQ9I=s1024-rj',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Black Friday',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Clothing',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Clothing - Original',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Elections Discounts',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Essential Range',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Graduation',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Limited Edition Essential Zip Hoodies',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Merchandise',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Nike Final Chance',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Personalisation',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Popular',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Portsmouth City Collection',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Pride Collection',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Sale',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Signature & Essential Range',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Signiture Range',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Sports Clubs',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Spring Favourites',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Student Essentials',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Student Groups',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Summer essentials',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Summer Favourites',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Univeristy Clothing',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Univeristy Merchandise',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'UPSU Bears',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
        CollectionItem(
          title: 'Winter Favourites',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final items = _items;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: AdvertBanner(),
                ),
                SliverToBoxAdapter(
                  child: NavBar(
                    onPlaceholderPressed: () {
                      print('Placeholder pressed');
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Center(
                      child: Text(
                        'Collections',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          CollectionGridItem(item: items[index]),
                      childCount: items.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width < 600 ? 2 : 4,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppFooter(),
                ),
              ],
            ),
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
