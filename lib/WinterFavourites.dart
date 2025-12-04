import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'Advert.dart';

// You can edit each item here:
class CollectionItem {
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final String price; // <-- added
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.isNetworkImage = false, // <‑‑ default to asset if not specified
    required this.price, // <-- added
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
          // 0. Advert banner fixed at the very top (outside scroll)
          const AdvertBanner(),

          const SizedBox(height: 16),

          // Scrollable content below
          Expanded(
            child: CustomScrollView(
              slivers: [
                // 1. NavBar first
                SliverToBoxAdapter(
                  child: NavBar(
                    onPlaceholderPressed: () {
                      print('Placeholder pressed');
                    },
                  ),
                ),

                // 2. Mock Filter / Sort row just below the NavBar
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Mock Filter By
                        OutlinedButton.icon(
                          onPressed: () {
                            // TODO: open filter sheet
                            print('Filter by pressed');
                          },
                          icon: const Icon(Icons.filter_list, size: 18),
                          label: const Text('Filter by'),
                        ),
                        // Mock Sort By
                        OutlinedButton.icon(
                          onPressed: () {
                            // TODO: open sort options
                            print('Sort by pressed');
                          },
                          icon: const Icon(Icons.sort, size: 18),
                          label: const Text('Sort by'),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Title
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

                // 4. Products grid
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

                // 5. Footer as part of scroll
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

  // WINTER COLLECTION ITEMS
  List<CollectionItem> get _items => const [
        CollectionItem(
          title: 'UPSU Winter Hoodie',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£29.99',
        ),
        CollectionItem(
          title: 'UPSU Pom-Pom Beanie',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£14.99',
        ),
        CollectionItem(
          title: 'UPSU Winter Scarf',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£12.50',
        ),
        CollectionItem(
          title: 'UPSU Fleece Jacket',
          imageUrl:
              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
          isNetworkImage: true,
          price: '£39.99',
        ),
        CollectionItem(
          title: 'UPSU Winter Bundle',
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
            item.title, // product name
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.price, // product price
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
