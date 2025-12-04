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
          imageUrl: 'assets/images/beanie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Black Friday',
          imageUrl: 'assets/images/bag_cover.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Clothing',
          imageUrl: 'assets/images/jumper.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Clothing - Original',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Elections Discounts',
          imageUrl: 'assets/images/zip_hoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Essential Range',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Graduation',
          imageUrl: 'assets/images/graduation_bear.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Limited Edition Essential Zip Hoodies',
          imageUrl: 'assets/images/zip_hoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Merchandise',
          imageUrl: 'assets/images/notebook.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Nike Final Chance',
          imageUrl: 'assets/images/s_tshirt.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Personalisation',
          imageUrl: 'assets/images/s_hoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Popular',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Portsmouth City Collection',
          imageUrl: 'assets/images/postcard.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Pride Collection',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Sale',
          imageUrl: 'assets/images/s_tshirt.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Signature & Essential Range',
          imageUrl: 'assets/images/essentalshoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Signiture Range',
          imageUrl: 'assets/images/s_tshirt.png1',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Sports Clubs',
          imageUrl: 'assets/images/s_hoodie.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Spring Favourites',
          imageUrl: 'assets/images/s_tshirt.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Student Essentials',
          imageUrl: 'assets/images/keep_cup.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Student Groups',
          imageUrl: 'assets/images/neutral_jumper.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Summer essentials',
          imageUrl: 'assets/images/s_tshirt.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Summer Favourites',
          imageUrl: 'assets/images/s_tshirt.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Univeristy Clothing',
          imageUrl: 'assets/images/jumper.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Univeristy Merchandise',
          imageUrl: 'assets/images/magnet.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'UPSU Bears',
          imageUrl: 'assets/images/graduation_bear.png',
          isNetworkImage: false,
        ),
        CollectionItem(
          title: 'Winter Favourites',
          imageUrl: 'assets/images/s_hoodie.png',
          isNetworkImage: false,
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
