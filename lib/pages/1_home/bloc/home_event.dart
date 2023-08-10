/// Event being processed by [HomeBloc].
abstract class HomeEvent {
  const HomeEvent();
}

class NextFactInput extends HomeEvent {
  const NextFactInput();
}
