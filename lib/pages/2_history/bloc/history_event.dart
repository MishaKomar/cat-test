/// Event being processed by [HistoryBloc].
abstract class HistoryEvent {
  const HistoryEvent();
}

class LoadHistoryInput extends HistoryEvent {
  const LoadHistoryInput();
}

class ClearHistoryInput extends HistoryEvent {
  const ClearHistoryInput();
}
