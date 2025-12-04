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

          const SizedBox(height: 24),

          // --- Fake email subscribe shop ---
          _EmailSubscribeSection(textColor: textColor),
        ],
      ),
    );
  }
}

class _EmailSubscribeSection extends StatefulWidget {
  final Color textColor;

  const _EmailSubscribeSection({required this.textColor});

  @override
  State<_EmailSubscribeSection> createState() => _EmailSubscribeSectionState();
}

class _EmailSubscribeSectionState extends State<_EmailSubscribeSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fakeSubscribe() {
    final email = _controller.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an email address.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Subscribed with $email (demo only, no real emails).'),
      ),
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.textColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Offers',
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _fakeSubscribe,
              child: const Text('Subscribe'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'This is a demo form – no real emails will be sent.',
          style: TextStyle(
            color: textColor.withOpacity(0.6),
            fontSize: 11,
          ),
        ),
      ],
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
