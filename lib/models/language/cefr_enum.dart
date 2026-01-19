import 'package:isar_plus/isar_plus.dart';

@enumValue
enum CEFR {
  A1("A1"),
  A2("A2"),
  B1("B1"),
  B2("B2"),
  C1("C1"),
  C2("C2");

  final String level;
  const CEFR(this.level);
}
