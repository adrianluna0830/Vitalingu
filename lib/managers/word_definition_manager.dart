import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/word_generation_service.dart';
import 'package:vitalingu/widgets/custom_overlay_manager.dart';
import 'package:vitalingu/widgets/word_definition_display_container.dart';
import 'package:vitalingu/widgets/word_widget.dart';
import 'package:signals/signals_flutter.dart';

class WordDefinitionManager {
  final CustomOverlayManager _overlayManager = getIt<CustomOverlayManager>();
  final WordGenerationService _wordGenerationService = getIt<WordGenerationService>();

  void showWordDefinition(BuildContext context, String word, String fullContext) async {
    final responseWidgetSignal = Signal<Widget?>(null);

    _overlayManager.showOverlay(
      context,
      WordDefinitionDisplayContainer(
        wordContentSignal: responseWidgetSignal,
        onNavigateBack: _overlayManager.hideOverlay,
        onCloseAllWindows: _overlayManager.hideAllOverlays,
      ),
    );

    final val = WordGenerationInput.create(word: word, fullContext: fullContext);

    final input = val.getOrElse(
        (error) => throw StateError('Invalid WordGenerationInput: $error'));

    final generatedWordEither = await _wordGenerationService.getWord(input);

    generatedWordEither.fold(
      (exception) {
        _overlayManager.hideOverlay();
        _showError(context, exception);
      },
      (wordOutput) {
        final wordWidget = WordWidget(
          key: ValueKey(wordOutput.wordLema),
          wordData: wordOutput,
        );
        responseWidgetSignal.value = wordWidget;
      },
    );
  }

  void showWordDefinitionByUserPrompt(BuildContext context, String userPrompt) async {
    final responseWidgetSignal = Signal<Widget?>(null);

    _overlayManager.showOverlay(
      context,
      WordDefinitionDisplayContainer(
        wordContentSignal: responseWidgetSignal,
        onNavigateBack: _overlayManager.hideOverlay,
        onCloseAllWindows: _overlayManager.hideAllOverlays,
      ),
    );

    final generatedWordEither = await _wordGenerationService.getWordByUserPrompt(userPrompt);

    generatedWordEither.fold(
      (exception) {
        _overlayManager.hideOverlay();
        _showError(context, exception);
      },
      (wordOutput) {
        final wordWidget = WordWidget(
          key: ValueKey(wordOutput.wordLema),
          wordData: wordOutput,
        );
        responseWidgetSignal.value = wordWidget;
      },
    );
  }

  void _showError(BuildContext context, Exception exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: ${exception.toString()}'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
