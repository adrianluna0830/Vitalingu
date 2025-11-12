import 'package:flutter/cupertino.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/word/word.dart';

class WordInfoViewModel extends ViewModelBase {
  final Word word;
  final Signal<List<Widget>?> wordContent = Signal<List<Widget>>([]);
  WordInfoViewModel({required super.navigationService, required this.word});

  

}