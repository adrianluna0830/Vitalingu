import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/selectable_text_service.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';
import 'package:vitalingu/widgets/doubt_input.dart';
import 'package:vitalingu/widgets/text_response_output_widget.dart';
import 'package:vitalingu/widgets/custom_overlay_manager.dart';
import 'package:vitalingu/managers/word_definition_manager.dart';

class AiSelectableText extends StatefulWidget {
  const AiSelectableText({
    super.key,
    required this.text,
    this.onError,
    this.textStyle,
  });
  
  final String text;
  final void Function(Exception)? onError;
  final TextStyle? textStyle;
  
  @override
  State<AiSelectableText> createState() => _AiSelectableTextState();
}

class _AiSelectableTextState extends State<AiSelectableText> with SignalsMixin {
  final CustomOverlayManager _overlayManager = getIt<CustomOverlayManager>();
  final WordDefinitionManager _wordDefinitionManager = WordDefinitionManager();
  late final responseSignal = createSignal<String?>(null);
  late final responseWidgetSignal = createSignal<Widget?>(null);

  final SelectableTextService _selectableTextService =
      getIt<SelectableTextService>();


  void _handleError(Exception exception) {
    if (widget.onError != null) {
      widget.onError!(exception);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${exception.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showTranslation(
      String selection, String selectionBracketedInSentence) async {
    responseSignal.value = null;
    _overlayManager.showOverlay(
      context,
      TextResponseOutputWidget(
        onClose: _overlayManager.hideOverlay,
        responseSignal: responseSignal,
      ),
      alwaysFill: true,
    );
    final responseEither = await _selectableTextService.getTranslationResponse(
        selection, selectionBracketedInSentence);

    responseEither.fold(
      (exception) {
        _overlayManager.hideOverlay();
        _handleError(exception);
      },
      (response) {
        responseSignal.value = response;
      },
    );
  }

  void _showDoubtInput(
      String selection, String selectionBracketedInSentence) async {
    _overlayManager.showOverlay(
      context,
      DoubtInput(
        onSubmit: (doubt) async {
          responseSignal.value = null;
          _overlayManager.hideOverlay();
          _overlayManager.showOverlay(
            context,
            TextResponseOutputWidget(
              onClose: _overlayManager.hideOverlay,
              responseSignal: responseSignal,
            ),
            alwaysFill: true,
          );
          final responseEither = await _selectableTextService.getDoubtResponse(
              doubt, selection, selectionBracketedInSentence);

          responseEither.fold(
            (exception) {
              _overlayManager.hideOverlay();
              _handleError(exception);
            },
            (response) {
              responseSignal.value = response;
            },
          );
        },
        onClose: _overlayManager.hideOverlay,
      ),
    );
  }

  void _showWordInfo(String selection, String selectionBracketedInSentence) {
    _wordDefinitionManager.showWordDefinition(context, selection, selectionBracketedInSentence);
  }

  @override
  Widget build(BuildContext context) {
    return CustomSelectableText(
      text: widget.text,
      leftBracket: "<",
      rightBracket: ">",
      doubtCallback: _showDoubtInput,
      translationCallback: _showTranslation,
      wordInfoCallback: _showWordInfo,
      textStyle: widget.textStyle,
    );
  }
}