import 'dart:async';

import 'package:cattest/base/repositories/fact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_event.dart';
import 'history_state.dart';

/// {@template history_bloc}
/// A simple [Bloc] that manages an [HistoryState] as its state.
/// {@endtemplate}
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final FactsRepository _repository;

  /// {@macro history_bloc}
  HistoryBloc({
    required FactsRepository repository,
  })  : _repository = repository,
        super(const HistoryState()) {
    on<LoadHistoryInput>(_onLoadHistoryInput);
    on<ClearHistoryInput>(_onClearHistoryInput);

    add(const LoadHistoryInput());
  }

  FutureOr _onLoadHistoryInput(
      LoadHistoryInput event, Emitter<HistoryState> emit) {
    final list = _repository.factHistory();
    emit(state.copyWith(list: list));
  }

  FutureOr _onClearHistoryInput(
      ClearHistoryInput event, Emitter<HistoryState> emit) {
    final list = _repository.clearHistory();
    emit(state.copyWith(list: list));
  }
}
