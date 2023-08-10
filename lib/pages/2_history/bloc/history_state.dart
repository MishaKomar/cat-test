import 'package:cattest/base/models/bussines/fact_model.dart';

/// {@template history_state}
/// A simple state model for [HomeBloc].
/// {@endtemplate}

class HistoryState {
  final List<FactModel> list;

  /// {@macro history_state}
  const HistoryState({
    this.list = const [],
  });

  HistoryState copyWith({
    List<FactModel>? list,
  }) =>
      HistoryState(
        list: list ?? this.list,
      );
}
