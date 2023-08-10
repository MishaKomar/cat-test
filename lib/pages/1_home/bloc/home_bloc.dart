import 'dart:async';
import 'dart:math';

import 'package:cattest/base/repositories/fact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

/// {@template home_bloc}
/// A simple [Bloc] that manages an [HomeState] as its state.
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FactsRepository _repository;

  /// {@macro home_bloc}
  HomeBloc({
    required FactsRepository repository,
  })  : _repository = repository,
        super(const HomeState()) {
    on<NextFactInput>(_onNextFactInput);

    add(const NextFactInput());
  }

  FutureOr<void> _onNextFactInput(
      NextFactInput event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final mockCatFact = await _repository.randomFact();
      emit(
        state.copyWith(
          loading: false,
          fact: mockCatFact,
          number: Random().nextInt(100),
        ),
      );
    } catch (e) {
      emit(
        HomeState(
          error: e.toString(),
          loading: false,
          fact: state.fact,
          number: state.number,
        ),
      );
    }
  }
}
