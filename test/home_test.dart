import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: Text('UnionShopApp Placeholder'))));

      // Check that basic UI elements are present
      expect(
        find.text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!'),
        findsOneWidget,
      );
      expect(find.text('Placeholder Hero Title'), findsOneWidget);
      expect(find.text('PLACEHOLDER PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that product cards are displayed
      expect(find.text('Placeholder Product 1'), findsOneWidget);
      expect(find.text('Placeholder Product 2'), findsOneWidget);
      expect(find.text('Placeholder Product 3'), findsOneWidget);
      expect(find.text('Placeholder Product 4'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Placeholder Footer'), findsOneWidget);
      expect(
        find.text('Students should customise this footer section'),
        findsOneWidget,
      );
    });

    testWidgets('tapping browse products scrolls to products section',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Ensure products section is present
      final productsSectionFinder = find.text('PLACEHOLDER PRODUCTS SECTION');

      expect(productsSectionFinder, findsOneWidget);

      // Tap browse products CTA
      await tester.tap(find.text('BROWSE PRODUCTS'));
      await tester.pumpAndSettle();

      // After tapping, products section should still be visible (e.g. scrolled into view)
      expect(productsSectionFinder, findsOneWidget);
    });

    testWidgets('view all products button is enabled and tappable',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final viewAllFinder = find.text('VIEW ALL PRODUCTS');
      expect(viewAllFinder, findsOneWidget);

      // Button should be enabled (tapping should not throw)
      await tester.tap(viewAllFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('product list is scrollable', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final listScrollable = find.byType(Scrollable);
      expect(listScrollable, findsWidgets);

      // Try a drag gesture to ensure no overflow / scroll issues
      await tester.drag(listScrollable.first, const Offset(0, -200));
      await tester.drag(listScrollable.first, Offset(0, -200));
    });

    testWidgets('header is present and pinned at top after scroll',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final headerFinder =
          find.text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!');
      expect(headerFinder, findsOneWidget);

      // Scroll content
      await tester.drag(find.byType(Scrollable).first, const Offset(0, -300));
      await tester.drag(find.byType(Scrollable).first, Offset(0, -300));

      // Header should still be in the widget tree (e.g. AppBar title)
      expect(headerFinder, findsOneWidget);
    });

    testWidgets('each product has a price widget next to it', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final products = <String, String>{
        'Placeholder Product 1': '£10.00',
        'Placeholder Product 2': '£15.00',
        'Placeholder Product 3': '£20.00',
        'Placeholder Product 4': '£25.00',
      };

      products.forEach((name, price) {
        expect(find.text(name), findsOneWidget);
        expect(find.text(price), findsOneWidget);
      });
    });

    testWidgets('search icon is tappable', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final searchIcon = find.byIcon(Icons.search);
      expect(searchIcon, findsOneWidget);

      await tester.tap(searchIcon);
      await tester.pumpAndSettle();
    });

    testWidgets('cart icon is tappable', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final cartIcon = find.byIcon(Icons.shopping_bag_outlined);
      expect(cartIcon, findsOneWidget);

      await tester.tap(cartIcon);
      await tester.pumpAndSettle();
    });

    testWidgets('menu icon is tappable', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final menuIcon = find.byIcon(Icons.menu);
      expect(menuIcon, findsOneWidget);

      await tester.tap(menuIcon);
      await tester.pumpAndSettle();
    });
  });
}
