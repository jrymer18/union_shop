import 'package:flutter/material.dart';
import 'navbar.dart';



  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            NavBar(onPlaceholderPressed: _placeholderCallback),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'About us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Welcome to the Union Shop!\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'We’re dedicated to giving you the very best University branded products, '
                      'with a range of clothing and merchandise available to shop all year round! '
                      'We even offer an exclusive personalisation service!\n\n'
                      'All online purchases are available for delivery or instore collection!\n\n'
                      'We hope you enjoy our products as much as we enjoy offering them to you. '
                      'If you have any questions or comments, please don’t hesitate to contact us '
                      'at hello@upsu.net.\n\n'
                      'Happy shopping!\n\n'
                      'The Union Shop & Reception Team​​​​​​​​​',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
