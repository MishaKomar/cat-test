import 'package:cattest/base/models/bussines/fact_model.dart';

/// {@template home_state}
/// A simple state model for [HomeBloc].
/// {@endtemplate}

class HomeState {
  /// {@macro home_state}
  final FactModel? fact;
  final String? error;
  final bool loading;
  final int? number;

  bool get hasFact => fact != null;
  bool get hasNumber => fact != null;
  bool get hasError => error != null;

  const HomeState({
    this.fact,
    this.error,
    this.loading = true,
    this.number,
  });

  HomeState copyWith({
    FactModel? fact,
    String? error,
    bool? loading,
    int? number,
  }) =>
      HomeState(
        fact: fact ?? this.fact,
        error: error ?? this.error,
        loading: loading ?? this.loading,
        number: number ?? this.number,
      );
}
