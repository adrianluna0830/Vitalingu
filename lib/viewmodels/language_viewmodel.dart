import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class LanguageViewModel  extends ViewModelBase {
  final Language language;
  LanguageViewModel({required this.language, required super.navigationService});

}
