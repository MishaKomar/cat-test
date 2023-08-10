import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/history_bloc.dart';
import 'bloc/history_event.dart';
import 'bloc/history_state.dart';

/// {@template history_page}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [HistoryBloc].
/// {@endtemplate}
class HistoryPage extends StatelessWidget {
  /// {@macro history_page}
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts history'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: () {
              context.read<HistoryBloc>().add(const ClearHistoryInput());

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Clear history success'),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (BuildContext context, HistoryState state) {
            return ListView.separated(
              itemCount: state.list.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(state.list[i].text),
                subtitle: Text(
                  state.list[i].updatedAt.toIso8601String(),
                ),
              ),
              separatorBuilder: (context, i) => const SizedBox(
                height: 4,
              ),
            );
          },
        ),
      ),
    );
  }
}
