import 'package:cattest/base/navigation/base_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

/// {@template home_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HomeBloc].
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return ListView(
              children: [
                if (state.hasError)
                  Center(
                    child: Text(state.error!),
                  ),
                if (state.hasFact)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.hasFact)
                            CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              fit: BoxFit.cover,
                              imageUrl: state.fact!.imageUrl,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ListTile(
                            title: Text(
                              'Cat fact #${state.number}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            subtitle: Text(
                              state.fact!.updatedAt.toIso8601String(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              state.fact!.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: state.loading
                                    ? null
                                    : () => context
                                        .read<HomeBloc>()
                                        .add(const NextFactInput()),
                                child: const Text('NEXT'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(CatAppRouter.historyPath);
                                },
                                child: const Text('ALL FACTS'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
