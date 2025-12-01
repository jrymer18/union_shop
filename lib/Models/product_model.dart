class Product {
  final String name;
  final double price;
  final String image; // just the filename, e.g. 'product1.png'

  Product({
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
    );
  }
}
