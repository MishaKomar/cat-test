import 'package:flutter/material.dart';

class CatFactTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const CatFactTile({
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
