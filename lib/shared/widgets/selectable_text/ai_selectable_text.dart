import 'package:flutter/material.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/core/services/ai_wrappers/selectable_text_service.dart';
import 'package:vitalingu/shared/widgets/selectable_text/custom_selectable_text.dart';
import 'package:vitalingu/shared/widgets/selectable_text/doubt_input.dart';
import 'package:vitalingu/features/word_overlay/presentation/controller/overlay_controller.dart';
import 'package:vitalingu/features/word_overlay/presentation/controller/word_overlay_controller.dart';
import 'package:vitalingu/shared/widgets/selectable_text/response_output_panel.dart';

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

class _AiSelectableTextState extends State<AiSelectableText> {
  final OverlayController _overlayManager = getIt<OverlayController>();
  final WordOverlayController _wordOverlayController = getIt<WordOverlayController>();
  final SelectableTextService _selectableTextService = getIt<SelectableTextService>();

  String? _currentResponse;

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

  void _updateOverlayContent() {
    _overlayManager.hideOverlay();
    _overlayManager.showOverlay(
      context,
      Align(
        alignment: Alignment.bottomCenter,
        child: ResponseOutputPanel(
          onClose: _overlayManager.hideOverlay,
          content: _currentResponse,
        ),
      ),
      alwaysFill: true,
    );
  }

  void _showTranslation(String selection, String selectionBracketedInSentence) async {
    setState(() => _currentResponse = null);
    _updateOverlayContent();

    final responseEither = await _selectableTextService.getTranslationResponse(
        selection, selectionBracketedInSentence);

    responseEither.fold(
      (exception) {
        _overlayManager.hideOverlay();
        _handleError(exception);
      },
      (response) {
        if (mounted) {
          setState(() => _currentResponse = response);
          _updateOverlayContent();
        }
      },
    );
  }

  void _showDoubtInput(String selection, String selectionBracketedInSentence) async {
    _overlayManager.showOverlay(
      context,
      DoubtInput(
        onSubmit: (doubt) async {
          setState(() => _currentResponse = null);
          _overlayManager.hideOverlay();
          _updateOverlayContent();

          final responseEither = await _selectableTextService.getDoubtResponse(
              doubt, selection, selectionBracketedInSentence);

          responseEither.fold(
            (exception) {
              _overlayManager.hideOverlay();
              _handleError(exception);
            },
            (response) {
              if (mounted) {
                setState(() => _currentResponse = response);
                _updateOverlayContent();
              }
            },
          );
        },
        onClose: _overlayManager.hideOverlay,
      ),
    );
  }

  void _showWordInfo(String selection, String selectionBracketedInSentence) {
    _wordOverlayController.showWordDefinition(context, selection, selectionBracketedInSentence);
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
