import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/models/shared_preferences_store.dart';

@singleton
class HasLoadedDataSignal extends PersistedSignal<bool>
{
  HasLoadedDataSignal({required SharedPreferencesStore sharedPreferencesStore})
      : super(
          false, 
          key: 'hasLoadedData',
          store: sharedPreferencesStore, 
          autoInit: false
        );

  @FactoryMethod(preResolve: true)
  static Future<HasLoadedDataSignal> create({required SharedPreferencesStore sharedPreferencesStore}) async
  {
    final signal = HasLoadedDataSignal(sharedPreferencesStore: sharedPreferencesStore);
    await signal.init();
    return signal;
  }
}

@singleton
class IsStartupCompletedSignal extends PersistedSignal<bool>
{
  IsStartupCompletedSignal({required SharedPreferencesStore sharedPreferencesStore})
      : super(
          false, 
          key: 'isStartupCompleted',
          store: sharedPreferencesStore, 
          autoInit: false
        );

  @FactoryMethod(preResolve: true)
  static Future<IsStartupCompletedSignal> create({required SharedPreferencesStore sharedPreferencesStore}) async
  {
    final signal = IsStartupCompletedSignal(sharedPreferencesStore: sharedPreferencesStore);
    await signal.init();
    return signal;
  }


}