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
    this.backgroundColor = const Color(0xFF111111),
    this.textColor = Colors.white,
    this.links = const [],
    this.padding = const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Subtitle
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor.withOpacity(0.7),
            ),
          ),

          if (links.isNotEmpty) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: links
                  .map(
                    (link) => InkWell(
                      onTap: link.onTap,
                      child: Text(
                        link.label,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: textColor.withOpacity(0.85),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],

          const SizedBox(height: 16),
          Divider(color: textColor.withOpacity(0.2), height: 1),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} Union Shop. All rights reserved.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: textColor.withOpacity(0.6),
            ),
          ),
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
