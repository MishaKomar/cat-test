import 'package:cattest/base/models/cat_fact_model.dart';

/// {@template history_state}
/// A simple state model for [HomeBloc].
/// {@endtemplate}

class HistoryState {
  final List<CatFactModel> list;

  /// {@macro history_state}
  const HistoryState({
    this.list = const [],
  });

  HistoryState copyWith({
    List<CatFactModel>? list,
  }) =>
      HistoryState(
        list: list ?? this.list,
      );
}
