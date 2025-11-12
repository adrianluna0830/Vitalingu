import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/language_viewmodel.dart';
import 'package:vitalingu/widgets/target_language_selectable_text.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
    final Language language;

   const LanguageView({super.key, required this.language});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late final LanguageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<LanguageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TargetLanguageSelectableText(
          fullText: """
La inteligencia artificial ha revolucionado el mundo moderno de maneras inimaginables. Desde asistentes virtuales hasta vehículos autónomos, la tecnología continúa avanzando a pasos agigantados. Los científicos trabajan incansablemente para mejorar estos sistemas.

En el campo de la medicina, los algoritmos de aprendizaje automático pueden detectar enfermedades con una precisión sorprendente. Esto ha salvado innumerables vidas en todo el mundo. Los médicos ahora tienen herramientas más poderosas que nunca.

¿Qué nos depara el futuro? Nadie lo sabe con certeza. Sin embargo, una cosa es clara: la tecnología seguirá transformando nuestras vidas. Debemos adaptarnos y aprender continuamente para mantenernos relevantes en este mundo cambiante.

La educación también está experimentando una revolución digital. Las plataformas de aprendizaje en línea permiten a estudiantes de todo el mundo acceder a conocimientos de alta calidad. ¡Es una época emocionante para estar vivo! La democratización del conocimiento es fundamental.

Por último, la sostenibilidad se ha convertido en una prioridad global. Las energías renovables están reemplazando gradualmente a los combustibles fósiles. Empresas innovadoras desarrollan soluciones creativas para combatir el cambio climático. Nuestro planeta merece ser protegido para las futuras generaciones.
""",
          onTranslate: (String expandedSelection, String additionalParam) { print('$expandedSelection, $additionalParam'); },
          onExplainDoubt: (String expandedSelection, String additionalParam) { print('$expandedSelection, $additionalParam'); },
          onWordInfo: (String expandedSelection, String additionalParam) { print('$expandedSelection, $additionalParam'); },
        ),
      ),
    );
  }
}
