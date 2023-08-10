import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class BaseBlocObserver extends BlocObserver {
  final logger = Logger();

  /// {@macro app_bloc_observer}
  BaseBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) logger.i(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    logger.i(transition);
  }
}
