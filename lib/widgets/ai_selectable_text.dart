import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/custom_overlay.dart';
import 'package:vitalingu/services/selectable_text_service.dart';
import 'package:vitalingu/services/word_generation_service.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';
import 'package:vitalingu/widgets/doubt_input.dart';
import 'package:vitalingu/widgets/response_output_widget.dart';

class AiSelectableText extends StatefulWidget {
  const AiSelectableText(
      {super.key, required this.bodyKey, required this.text});
  final GlobalKey bodyKey;
  final String text;
  @override
  State<AiSelectableText> createState() => _AiSelectableTextState();
}
class _AiSelectableTextState extends State<AiSelectableText> with SignalsMixin {
  late final customOverlay = createSignal<CustomOverlay?>(null);
  late final responseSignal = createSignal<String?>(null);
  
  final SelectableTextService _selectableTextService =
      getIt<SelectableTextService>();
  final WordGenerationService _wordGenerationService =
      getIt<WordGenerationService>();

  void _showOverlay(Widget myWidget) {
    final current = customOverlay.peek();
    if (current != null) {
      current.removeOverlay();
    }

    final overlay = CustomOverlay(bodyKey: widget.bodyKey, myWidget: myWidget);
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

  void _showTranslation(String selection, String selectionBracketedInSentence) async {
    responseSignal.value = null;
    _showOverlay(TextResponseOutputWidget(
      onClose: _hideOverlay, 
      responseSignal: responseSignal
    ));
    final response = await _selectableTextService.getTranslationResponse(
      selection, 
      selectionBracketedInSentence
    );
    responseSignal.value = response;
  }

  void _showDoubtInput(String selection, String selectionBracketedInSentence) async {
    _showOverlay(
      DoubtInput(
        onSubmit: (doubt) async {
          responseSignal.value = null;
          _showOverlay(TextResponseOutputWidget(
            onClose: _hideOverlay, 
            responseSignal: responseSignal
          ));
          final response = await _selectableTextService.getDoubtResponse(
            doubt, 
            selection, 
            selectionBracketedInSentence
          );
          responseSignal.value = response;
        },
        onClose: _hideOverlay,
      ),
    );
  }

  void _showWordInfo(String selection, String selectionBracketedInSentence) async {
    responseSignal.value = null;

  }

  @override
  Widget build(BuildContext context) {
    return CustomSelectableText(
      text: widget.text,
      leftBracket: "<",
      rightBracket: ">",
      doubtCallback: _showDoubtInput,
      translationCallback: _showTranslation,
      wordInfoCallback: _showWordInfo
    );
  }
}