import 'package:cattest/base/navigation/base_navigation.dart';
import 'package:flutter/material.dart';

/// {@template FactsApp}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// {@endtemplate}
class FactsApp extends StatelessWidget {
  /// {@macro FactsApp}
  const FactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: FactsAppRouter.routes,
    );
  }
}
