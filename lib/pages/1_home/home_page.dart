import 'package:cattest/base/navigation/base_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

import 'widgets/error_baner.dart';
import 'widgets/fact_card.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) => Scaffold(
        appBar: AppBar(
          title: const Text('Cat Facts'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () =>
                  Navigator.of(context).pushNamed(FactsAppRouter.historyPath),
            ),
          ],
        ),
        body: ListView(
          children: [
            if (state.hasError)
              ErrorBanner(
                text: state.error!,
                onPressed: () =>
                    context.read<HomeBloc>().add(const NextFactInput()),
              ),
            if (state.hasFact)
              FactCard(
                imageUrl: state.fact!.imageUrl,
                title: 'Cat fact #${state.number}',
                subtitle: state.fact!.updatedAtShort,
                body: state.fact!.text,
                actionDisabled: state.loading,
                primaryActionText: 'ANOTHER FACT',
                secondaryActionText: 'FACT HISTORY',
                onPrimaryPressed: () =>
                    context.read<HomeBloc>().add(const NextFactInput()),
                onSecondaryPressed: () =>
                    Navigator.of(context).pushNamed(FactsAppRouter.historyPath),
              ),
          ],
        ),
      ),
    );
  }
}
