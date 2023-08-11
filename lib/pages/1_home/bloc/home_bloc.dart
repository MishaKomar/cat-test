import 'dart:async';
import 'dart:math';

import 'package:cattest/base/repositories/facts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

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
      final fact = await _repository.randomFact();
      emit(
        HomeState(
          loading: false,
          fact: fact,
          number: Random().nextInt(100),
        ),
      );
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
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
