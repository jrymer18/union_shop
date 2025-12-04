import 'package:flutter/material.dart';

class AdvertBanner extends StatelessWidget {
  const AdvertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      color: const Color(0xFF4d2963),
      child: const Text(
        'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
        textAlign: TextAlign.center,
        softWrap: true,
        overflow: TextOverflow.visible,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
