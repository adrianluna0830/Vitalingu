import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';

@injectable
class TargetLanguageSelectableTextController {
  final Language language;

  TargetLanguageSelectableTextController({
    required this.language,
  });

  bool isEmptyOrPunctuation(String text) {
    if (text.trim().isEmpty) return true;
    final punctuationRegex = RegExp(r'^[\s\p{P}\p{S}]+$', unicode: true);
    return punctuationRegex.hasMatch(text);
  }

  (String, int, int) getExpandedToNearestWord(int startIndex, int endIndex, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    int newStart = startIndex;
    int newEnd = endIndex;

    while (newStart > 0 && !_isWordBoundary(fullText[newStart - 1])) {
      newStart--;
    }
    while (newEnd < fullText.length && !_isWordBoundary(fullText[newEnd])) {
      newEnd++;
    }
    while (newStart < newEnd && _isWordBoundary(fullText[newStart])) {
      newStart++;
    }
    while (newEnd > newStart && _isWordBoundary(fullText[newEnd - 1])) {
      newEnd--;
    }
    if (newStart >= newEnd) {
      return ('', 0, 0);
    }
    String expandedText = fullText.substring(newStart, newEnd);
    return (expandedText, newStart, newEnd);
  }

  (String, int, int) getExpandedToInvolvedWords(int startIndex, int endIndex, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    int adjustedStart = startIndex;
    int adjustedEnd = endIndex;

    while (adjustedStart < adjustedEnd && _isWordBoundary(fullText[adjustedStart])) {
      adjustedStart++;
    }
    while (adjustedEnd > adjustedStart && _isWordBoundary(fullText[adjustedEnd - 1])) {
      adjustedEnd--;
    }
    if (adjustedStart >= adjustedEnd) {
      return ('', 0, 0);
    }

    int newStart = adjustedStart;
    int newEnd = adjustedEnd;

    if (adjustedStart > 0 && !_isWordBoundary(fullText[adjustedStart - 1])) {
      while (newStart > 0 && !_isWordBoundary(fullText[newStart - 1])) {
        newStart--;
      }
    }
    if (adjustedEnd < fullText.length && !_isWordBoundary(fullText[adjustedEnd])) {
      while (newEnd < fullText.length && !_isWordBoundary(fullText[newEnd])) {
        newEnd++;
      }
    }

    String expandedText = fullText.substring(newStart, newEnd);
    return (expandedText, newStart, newEnd);
  }

  (String, int, int) getExpandedToNearestParagraph(int startIndex, int endIndex, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    int newStart = startIndex;
    int newEnd = endIndex;

    while (newStart > 0 && !_isWordBoundary(fullText[newStart - 1])) {
      newStart--;
    }
    while (newEnd < fullText.length && !_isWordBoundary(fullText[newEnd])) {
      newEnd++;
    }
    while (newStart > 0) {
      if (fullText[newStart - 1] == '\n') break;
      newStart--;
    }
    while (newEnd < fullText.length) {
      if (fullText[newEnd] == '\n') break;
      newEnd++;
    }
    while (newStart < fullText.length && _isWordBoundary(fullText[newStart])) {
      newStart++;
    }
    while (newEnd > newStart && _isWordBoundary(fullText[newEnd - 1])) {
      newEnd--;
    }
    if (newStart >= newEnd) {
      return ('', 0, 0);
    }
    String expandedText = fullText.substring(newStart, newEnd);
    return (expandedText, newStart, newEnd);
  }

  bool _isWordBoundary(String char) {
    return char == ' ' || char == '\n' || char == '\t' ||
        RegExp(r'[\p{P}\p{S}]', unicode: true).hasMatch(char);
  }

  bool isWord(int startIndex, int endIndex, String fullText) {
    if (startIndex == endIndex) return true;
    String selectedText = fullText.substring(startIndex, endIndex);
    String trimmedText = selectedText.trim();
    if (trimmedText.isEmpty) return false;
    List<String> words = trimmedText.split(RegExp(r'\s+'));
    words = words.where((word) => word.isNotEmpty).toList();
    return words.length <= 2;
  }

  String getLineContext(int startIndex, int endIndex, String fullText) {
    if (fullText.isEmpty) return '';
    int lineStart = startIndex;
    int lineEnd = endIndex;

    while (lineStart > 0 && fullText[lineStart - 1] != '\n') {
      lineStart--;
    }
    while (lineEnd < fullText.length && fullText[lineEnd] != '\n') {
      lineEnd++;
    }
    return fullText.substring(lineStart, lineEnd).trim();
  }
}

class TargetLanguageSelectableText extends StatefulWidget {
  final String fullText;
  final void Function(String expandedSelection) translateSelectedTextCallback;
  final void Function(String expandedSelection) explainSelectedTextDoubtCallback;
  final void Function(String expandedSelection) getSelectedWord;

  const TargetLanguageSelectableText({
    super.key,
    required this.translateSelectedTextCallback,
    required this.explainSelectedTextDoubtCallback,
    required this.getSelectedWord,
    required this.fullText,
  });

  @override
  State<TargetLanguageSelectableText> createState() => _TargetLanguageSelectableTextState();
}

class _TargetLanguageSelectableTextState extends State<TargetLanguageSelectableText> {
  final TargetLanguageSelectableTextController _controller = getIt<TargetLanguageSelectableTextController>();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSelectionChange(TextSelection selection) {
    if (!selection.isCollapsed) {
      final selectedText = widget.fullText.substring(selection.start, selection.end);
      if (_controller.isEmptyOrPunctuation(selectedText)) {
        _focusNode.unfocus();
        return;
      }
      final bool isSingleWord = _controller.isWord(selection.start, selection.end, widget.fullText);
      if (isSingleWord) {
        final (expandedWord, _, _) = _controller.getExpandedToInvolvedWords(
          selection.start,
          selection.end,
          widget.fullText,
        );
        if (expandedWord.isEmpty) {
          _focusNode.unfocus();
        }
      } else {
        final (expandedParagraph, _, _) = _controller.getExpandedToNearestParagraph(
          selection.start,
          selection.end,
          widget.fullText,
        );
        if (expandedParagraph.isEmpty) {
          _focusNode.unfocus();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      widget.fullText,
      focusNode: _focusNode,
      selectionControls: _CustomTextSelectionControls(
        controller: _controller,
        fullText: widget.fullText,
        translateCallback: widget.translateSelectedTextCallback,
        doubtCallback: widget.explainSelectedTextDoubtCallback,
        wordLemaCallback: widget.getSelectedWord,
        focusNode: _focusNode,
      ),
      onSelectionChanged: (selection, cause) {
        if (selection != null) {
          _handleSelectionChange(selection);
        }
      },
      showCursor: false,
      style: const TextStyle(fontSize: 16),
    );
  }
}

class _CustomTextSelectionControls extends TextSelectionControls {
  final TargetLanguageSelectableTextController controller;
  final String fullText;
  final void Function(String) translateCallback;
  final void Function(String) doubtCallback;
  final void Function(String) wordLemaCallback;
  final FocusNode focusNode;

  _CustomTextSelectionControls({
    required this.controller,
    required this.fullText,
    required this.translateCallback,
    required this.doubtCallback,
    required this.wordLemaCallback,
    required this.focusNode,
  });

  @override
  Widget buildHandle(BuildContext context, TextSelectionHandleType type, double textLineHeight, [VoidCallback? onTap]) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ValueListenable<ClipboardStatus>? clipboardStatus,
    Offset? lastSecondaryTapDownPosition,
  ) {
    final TextSelection selection = delegate.textEditingValue.selection;
    if (selection.isCollapsed) return const SizedBox.shrink();
    final String selectedText = fullText.substring(selection.start, selection.end);
    if (controller.isEmptyOrPunctuation(selectedText)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.unfocus();
      });
      return const SizedBox.shrink();
    }
    final bool isSingleWord = controller.isWord(selection.start, selection.end, fullText);

    return _CustomToolbar(
      globalEditableRegion: globalEditableRegion,
      selectionMidpoint: selectionMidpoint,
      isSingleWord: isSingleWord,
      onWordInfo: () {
        final (word, _, _) = controller.getExpandedToInvolvedWords(
          selection.start,
          selection.end,
          fullText,
        );
        if (word.isEmpty) {
          focusNode.unfocus();
          return;
        }
        wordLemaCallback(word);
        focusNode.unfocus();
      },
      onTranslate: () {
        final bool isShortSelection = controller.isWord(selection.start, selection.end, fullText);
        final (expandedText, _, _) = isShortSelection
            ? controller.getExpandedToInvolvedWords(selection.start, selection.end, fullText)
            : controller.getExpandedToNearestParagraph(selection.start, selection.end, fullText);
        if (expandedText.isEmpty) {
          focusNode.unfocus();
          return;
        }
        translateCallback(expandedText);
        focusNode.unfocus();
      },
      onDoubt: () {
        final bool isShortSelection = controller.isWord(selection.start, selection.end, fullText);
        final (expandedText, _, _) = isShortSelection
            ? controller.getExpandedToInvolvedWords(selection.start, selection.end, fullText)
            : controller.getExpandedToNearestParagraph(selection.start, selection.end, fullText);
        if (expandedText.isEmpty) {
          focusNode.unfocus();
          return;
        }
        doubtCallback(expandedText);
        focusNode.unfocus();
      },
    );
  }

  @override
  Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight, [Size? handleSize]) {
    return Offset.zero;
  }

  @override
  Size getHandleSize(double textLineHeight) {
    return Size.zero;
  }
}

class _CustomToolbar extends StatelessWidget {
  final Rect globalEditableRegion;
  final Offset selectionMidpoint;
  final bool isSingleWord;
  final VoidCallback onWordInfo;
  final VoidCallback onTranslate;
  final VoidCallback onDoubt;

  const _CustomToolbar({
    required this.globalEditableRegion,
    required this.selectionMidpoint,
    required this.isSingleWord,
    required this.onWordInfo,
    required this.onTranslate,
    required this.onDoubt,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final toolbarWidth = isSingleWord ? 100.0 : 220.0;
    double leftPosition = globalEditableRegion.left + selectionMidpoint.dx - (toolbarWidth / 2);

    if (leftPosition < 16) {
      leftPosition = 16;
    }
    if (leftPosition + toolbarWidth > screenWidth - 16) {
      leftPosition = screenWidth - toolbarWidth - 16;
    }
    final topPosition = globalEditableRegion.top + selectionMidpoint.dy - 70;

    return Stack(
      children: [
        Positioned(
          top: topPosition,
          left: leftPosition,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: isSingleWord
                      ? [
                          _ToolbarButton(
                            icon: Icons.info_outline,
                            label: 'Info',
                            onPressed: onWordInfo,
                          ),
                        ]
                      : [
                          _ToolbarButton(
                            icon: Icons.translate,
                            label: 'Translate',
                            onPressed: onTranslate,
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.white.withOpacity(0.2),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                          _ToolbarButton(
                            icon: Icons.help_outline,
                            label: 'Doubt',
                            onPressed: onDoubt,
                          ),
                        ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
