import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        toolbarHeight: 100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ABOUT US',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Text(
            'We’re dedicated to giving you the very best University branded products, '
            'with a range of clothing and merchandise available to shop all year round! '
            'We even offer an exclusive personalisation service!',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 12),
          Text(
            'All online purchases are available for delivery or instore collection!',
          ),
          SizedBox(height: 12),
          Text(
            'We hope you enjoy our products as much as we enjoy offering them to you. '
            'If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.',
          ),
          SizedBox(height: 12),
          Text(
            'Happy shopping!\n\nThe Union Shop & Reception Team',
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
