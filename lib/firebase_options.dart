import 'package:firebase_database/firebase_database.dart';

final DatabaseReference productsRef = FirebaseDatabase.instance.ref("products");

Future<void> addClassicTShirt() async {
  final newProduct = {
    "name": "Classic T-Shirts",
    "price": 11,
    "description":
        "Bringing to you, our best selling Classic T-Shirts. Available in 5 different colours. Light wearing, loose fitting and 100% cotton.",
    "colors": ["Red", "Blue", "Green", "Black", "White"],
    "image":
        "https://lh3.googleusercontent.com/gg-dl/ABS2GSkGrnVHj3Yz4N0RO1J2r_ZO5hpnlXJ6E-SQs4dBrTS_7SH1mo7jXicw40AFHLmAYd096vrjQIC3eqLK3c3u2n06j-Is_eDw43AJFDbt9rqcuZUZHwLZotHS3gMxRwaYj6KqLjv5UyJmH0aPQt1v2tJJ0dUk106eiMcIYQRh4i2JdlIB0g=s1024-rj", // replace with your actual image URL
  };

  await productsRef.push().set(newProduct);
}
