import 'dart:async';
import 'dart:math';

import 'package:cattest/base/models/cat_fact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

/// {@template home_bloc}
/// A simple [Bloc] that manages an [HomeState] as its state.
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro home_bloc}
  HomeBloc() : super(const HomeState()) {
    on<NextFactInput>(_onNextFactInput);

    add(const NextFactInput());
  }

  FutureOr<void> _onNextFactInput(
      NextFactInput event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    final mockCatFact = CatFactModel.mock();
    emit(
      state.copyWith(
        loading: false,
        fact: mockCatFact,
        number: Random().nextInt(100),
      ),
    );
  }
}
