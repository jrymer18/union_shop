import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  final List<FooterLink> links;
  final EdgeInsetsGeometry padding;

  const AppFooter({
    super.key,
    this.title = 'Union Shop',
    this.subtitle = 'Quality goods. Fair prices.',
    this.backgroundColor = const Color.fromARGB(255, 242, 242, 242),
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
    this.links = const [],
    this.padding = const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    TextStyle lineStyle(double size, {FontWeight weight = FontWeight.normal}) =>
        theme.textTheme.bodyMedium!.copyWith(
          color: textColor,
          fontSize: size,
          fontWeight: weight,
        );

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // left aligned
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Opening Hours', style: lineStyle(18, weight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text('❄️ Winter Break Closure Dates ❄️',
              style: lineStyle(16, weight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Closing 4pm 19/12/2025', style: lineStyle(14)),
          Text('Reopening 10am 05/01/2026', style: lineStyle(14)),
          Text('Last post date: 12pm on 18/12/2025', style: lineStyle(14)),
          const SizedBox(height: 12),
          Text('------------------------', style: lineStyle(14)),
          const SizedBox(height: 12),
          Text('(Term Time)', style: lineStyle(14, weight: FontWeight.bold)),
          Text('Monday - Friday 10am - 4pm', style: lineStyle(14)),
          const SizedBox(height: 8),
          Text('(Outside of Term Time / Consolidation Weeks)',
              style: lineStyle(14, weight: FontWeight.bold)),
          Text('Monday - Friday 10am - 3pm', style: lineStyle(14)),
          const SizedBox(height: 8),
          Text('Purchase online 24/7', style: lineStyle(14)),
          const SizedBox(height: 8),
          Text('Help and Information',
              style: lineStyle(14, weight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class FooterLink {
  final String label;
  final VoidCallback? onTap;

  const FooterLink({
    required this.label,
    this.onTap,
  });
}
