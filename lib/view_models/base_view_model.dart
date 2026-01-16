import 'package:signals/signals.dart';

abstract class BaseViewModel<T> {
  late final Signal<T> _state;

  Signal<T> get state => _state;

  BaseViewModel(T initialState) {
    _state = signal(initialState);
  }

  void updateState(T newState) {
    _state.value = newState;
  }
}
