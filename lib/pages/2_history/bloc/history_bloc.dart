import 'dart:async';

import 'package:cattest/base/models/cat_fact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_event.dart';
import 'history_state.dart';

/// {@template history_bloc}
/// A simple [Bloc] that manages an [HistoryState] as its state.
/// {@endtemplate}
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  /// {@macro history_bloc}
  HistoryBloc() : super(const HistoryState()) {
    on<LoadHistoryInput>(_onLoadHistoryInput);
    on<ClearHistoryInput>(_onClearHistoryInput);

    add(const LoadHistoryInput());
  }

  FutureOr _onLoadHistoryInput(
      LoadHistoryInput event, Emitter<HistoryState> emit) {
    emit(
      state.copyWith(
        list: List.generate(10, (index) => CatFactModel.mock()),
      ),
    );
  }

  FutureOr _onClearHistoryInput(
      ClearHistoryInput event, Emitter<HistoryState> emit) {
    emit(state.copyWith(list: []));
  }
}
