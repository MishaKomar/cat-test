import 'package:cattest/base/navigation/base_navigation.dart';
import 'package:flutter/material.dart';

/// {@template app}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// {@endtemplate}
class CatFactTestApp extends StatelessWidget {
  /// {@macro app}
  const CatFactTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: CatAppRouter.routes,
    );
  }
}
