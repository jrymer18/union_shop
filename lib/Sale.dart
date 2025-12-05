import 'package:flutter/material.dart';
import 'package:union_shop/navbar.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/Advert.dart';

class CollectionItem {
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final String price;
  final String? originalPrice;
  final VoidCallback? onTap;

  const CollectionItem({
    required this.title,
    required this.imageUrl,
    this.isNetworkImage = false,
    required this.price,
    this.originalPrice,
    this.onTap,
  });
}

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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        title: 'UPSU Winter Hoodie',
        imageUrl: 'assets/images/upsu_winter_hoodie.png',
        isNetworkImage: false,
        price: '£29.99',
      ),
      CollectionItem(
        title: 'Beanie',
        imageUrl: 'assets/images/beanie.png',
        isNetworkImage: false,
        price: '£14.99',
      ),
      CollectionItem(
        title: 'Jumper',
        imageUrl: 'assets/images/jumper.png',
        isNetworkImage: false,
        price: '£12.50',
      ),
      CollectionItem(
        title: 'Zip Hoodie',
        imageUrl: 'assets/images/zip_hoodie.png',
        isNetworkImage: false,
        price: '£39.99',
      ),
      CollectionItem(
        title: 'Bag Cover',
        imageUrl: 'assets/images/bag_cover.png',
        isNetworkImage: false,
        price: '£59.99',
      ),
    ];

class SalePage extends StatelessWidget {
  const SalePage({super.key});

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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sale,',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Don’t miss out! Get yours before they’re all gone!',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'All prices shown are inclusive of the discount 🛒',
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                        final item = _saleItems[index];
                        return CollectionGridItem(item: item);
                      },
                      childCount: _saleItems.length,
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

  List<CollectionItem> get _saleItems => const [
        CollectionItem(
          title: 'UPSU Winter Hoodie',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
          price: '£29.99',
        ),
        CollectionItem(
          title: 'Beanie',
          imageUrl: 'assets/images/beanie.png',
          isNetworkImage: false,
          price: '£14.99',
        ),
        CollectionItem(
          title: 'Jumper',
          imageUrl: 'assets/images/jumper.png',
          isNetworkImage: false,
          price: '£12.50',
        ),
        CollectionItem(
          title: 'Zip Hoodie',
          imageUrl: 'assets/images/zip_hoodie.png',
          isNetworkImage: false,
          price: '£39.99',
        ),
        CollectionItem(
          title: 'Bag Cover',
          imageUrl: 'assets/images/bag_cover.png',
          isNetworkImage: false,
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
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (item.originalPrice != null) ...[
                Text(
                  item.originalPrice!,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Text(
                item.price,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
