import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ErrorBanner({
    required this.text,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: Text(text),
      leading: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('TRY AGAIN'),
        ),
      ],
    );
  }
}
