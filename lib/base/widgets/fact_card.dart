import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FactCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String body;
  final bool actionDisabled;
  final VoidCallback? onPressed;

  const FactCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.body,
    this.actionDisabled = false,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.black54,
                child: Container(
                  color: Colors.grey.shade300,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            ListTile(
              title: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              subtitle: Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black.withOpacity(0.6),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.8),
                    ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: actionDisabled ? null : onPressed,
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
