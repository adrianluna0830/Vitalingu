import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/custom_overlay.dart';
import 'package:vitalingu/services/selectable_text_service.dart';
import 'package:vitalingu/services/word_generation_service.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';
import 'package:vitalingu/widgets/doubt_input.dart';
import 'package:vitalingu/widgets/text_response_output_widget.dart';
import 'package:vitalingu/widgets/word_response_output.dart';
import 'package:vitalingu/widgets/word_widget.dart';

class AiSelectableText extends StatefulWidget {
  const AiSelectableText(
      {super.key, required this.text});
  final String text;
  @override
  State<AiSelectableText> createState() => _AiSelectableTextState();
}

class _AiSelectableTextState extends State<AiSelectableText> with SignalsMixin {
  late final customOverlay = createSignal<CustomOverlay?>(null);
  late final responseSignal = createSignal<String?>(null);
  late final responseWidgetSignal = createSignal<Widget?>(null);

  final SelectableTextService _selectableTextService =
      getIt<SelectableTextService>();
  final WordGenerationService _wordGenerationService =
      getIt<WordGenerationService>();

  void _showOverlay(Widget myWidget) {
    final current = customOverlay.peek();
    if (current != null) {
      current.removeOverlay();
    }

    final overlay = CustomOverlay(myWidget: myWidget);
    overlay.showOverlay(context);
    customOverlay.value = overlay;
  }

  void _hideOverlay() {
    final current = customOverlay.peek();
    if (current != null) {
      current.removeOverlay();
      customOverlay.value = null;
    }
  }

  void _showTranslation(
      String selection, String selectionBracketedInSentence) async {
    responseSignal.value = null;
    _showOverlay(TextResponseOutputWidget(
        onClose: _hideOverlay, responseSignal: responseSignal));
    final response = await _selectableTextService.getTranslationResponse(
        selection, selectionBracketedInSentence);
    responseSignal.value = response;
  }

  void _showDoubtInput(
      String selection, String selectionBracketedInSentence) async {
    _showOverlay(
      DoubtInput(
        onSubmit: (doubt) async {
          responseSignal.value = null;
          _showOverlay(TextResponseOutputWidget(
              onClose: _hideOverlay, responseSignal: responseSignal));
          final response = await _selectableTextService.getDoubtResponse(
              doubt, selection, selectionBracketedInSentence);
          responseSignal.value = response;
        },
        onClose: _hideOverlay,
      ),
    );
  }

  void _showWordInfo(
      String selection, String selectionBracketedInSentence) async {
    responseWidgetSignal.value = null;
    _showOverlay(WordResponseOutput(
        responseSignal: responseWidgetSignal, onClose: _hideOverlay));

    final val = WordGenerationInput.create(
        word: selection, fullContext: selectionBracketedInSentence);

    final input = val.getOrElse(
        (error) => throw StateError('Invalid WordGenerationInput: $error'));

    final generatedWordEither = await _wordGenerationService.getWord(input);
    print("Generated word Either: $generatedWordEither");
    final wordOutput = generatedWordEither.getOrElse(
        (exception) => throw StateError('Error generating word: $exception'));

    print("Generated word: ${wordOutput.toJson()}");

    final wordWidget = WordWidget(
      key: ValueKey(wordOutput.wordLema),
      word: wordOutput,
    );

    if (mounted) {
      try {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            responseWidgetSignal.value = wordWidget;
          }
        });
      } catch (e, stackTrace) {
        print("Error updating responseWidgetSignal: $e");
        print(stackTrace);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSelectableText(
        text: widget.text,
        leftBracket: "<",
        rightBracket: ">",
        doubtCallback: _showDoubtInput,
        translationCallback: _showTranslation,
        wordInfoCallback: _showWordInfo);
  }
}

