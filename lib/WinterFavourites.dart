import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'Advert.dart';

class CollectionItem {
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final String price;
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.isNetworkImage = false,
    required this.price,
    this.onTap,
  });
}

class WinterPage extends StatelessWidget {
  const WinterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdvertBanner(),
          const SizedBox(height: 16),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: NavBar(
                    onPlaceholderPressed: () {
                      print('Placeholder pressed');
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            print('Filter by pressed');
                          },
                          icon: const Icon(Icons.filter_list, size: 18),
                          label: const Text('Filter by'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            print('Sort by pressed');
                          },
                          icon: const Icon(Icons.sort, size: 18),
                          label: const Text('Sort by'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Center(
                      child: Text(
                        'Winter Collection',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = _items[index];
                        return CollectionGridItem(item: item);
                      },
                      childCount: _items.length,
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

  List<CollectionItem> get _items => const [
        CollectionItem(
          title: 'Classic Hoodies',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£25.00',
        ),
        CollectionItem(
          title: 'Keep Cups',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£14.99',
        ),
        CollectionItem(
          title: 'Classic Sweatshirts',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£12.50',
        ),
        CollectionItem(
          title: 'Classic Beanie Hat',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£39.99',
        ),
        CollectionItem(
          title: 'Reflective Bag Cover',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£59.99',
        ),
        CollectionItem(
          title: 'Classic Rainbow Hoodies',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£59.99',
        ),
        CollectionItem(
          title: 'Classic Sweatshirts Neutral',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£59.99',
        ),
        CollectionItem(
          title: 'Limited Edition UoP Beanies',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£59.99',
        ),
      ];
}

class CollectionGridItem extends StatelessWidget {
  final CollectionItem item;

  const CollectionGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.isNetworkImage
                  ? Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.price,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
