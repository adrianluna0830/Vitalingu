import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/core/services/ai_wrappers/word_generation_service.dart';
import 'package:vitalingu/features/word_overlay/presentation/controller/overlay_controller.dart';
import 'package:vitalingu/shared/widgets/selectable_text/word_definition_display_container.dart';
import 'package:vitalingu/shared/widgets/word_widget.dart';

@injectable
class WordOverlayController {
  final OverlayController _overlayManager = getIt<OverlayController>();
  final WordGenerationService _wordGenerationService = getIt<WordGenerationService>();

  Widget? _currentContent;

  void _updateOverlay(BuildContext context) {
    _overlayManager.hideOverlay();
    _overlayManager.showOverlay(
      context,
      WordDefinitionDisplayContainer(
        content: _currentContent,
        onNavigateBack: _overlayManager.hideOverlay,
        onCloseAllWindows: _overlayManager.hideAllOverlays,
      ),
    );
  }

  void showWordDefinition(BuildContext context, String word, String fullContext) async {
    _currentContent = null;
    _updateOverlay(context);

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
        _currentContent = wordWidget;
        _updateOverlay(context);
      },
    );
  }

  void showWordDefinitionByUserPrompt(BuildContext context, String userPrompt) async {
    _currentContent = null;
    _updateOverlay(context);

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
        _currentContent = wordWidget;
        _updateOverlay(context);
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

