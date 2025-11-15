import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/services/selectable_text_service.dart';
import 'package:vitalingu/services/word_generation_service.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';
import 'package:vitalingu/word/word.dart';

@injectable
class AISelectableTextController {
  final SelectableTextService _selectableTextService;
  final WordGenerationService _wordGenerationService;

  AISelectableTextController(
    this._selectableTextService,
    this._wordGenerationService,
  );

  Widget buildSelectableText({
    required String fullText,
    required Future<void> Function(String translationResponse) onTranslationResponse,
    required Future<void> Function(String doubtResponse) onDoubtResponse,
    required Future<void> Function(Word wordResponse) onWordResponse,
  }) {
    return CustomSelectableText(
      fullText: fullText,
      onTranslate: (expandedSelection, textContext) async {
        final response = await _selectableTextService.getTranslation(
          textContext,
        );
        await onTranslationResponse(response);
      },
      onExplainDoubt: (expandedSelection, textContext) async {
        final response = await _selectableTextService.explainDoubt(
          textContext,
          "Student's doubt",
        );
        await onDoubtResponse(response);
      },
      onWordInfo: (expandedSelection, textContext) async {
        final word = await _wordGenerationService.getWord(expandedSelection);
        await onWordResponse(word);
      },
    );
  }
}