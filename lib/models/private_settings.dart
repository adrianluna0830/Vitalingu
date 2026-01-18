import 'package:signals/signals.dart';
import 'package:vitalingu/models/shared_preferences_store.dart';


class DIPersistedSignal<T> extends PersistedSignal<T>
{
  final SharedPreferencesStore sharedPreferencesStore;

  DIPersistedSignal(super.internalValue, {required super.key, required super.store, required this.sharedPreferencesStore});

  

}