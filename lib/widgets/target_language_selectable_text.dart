import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';

@injectable
class TargetLanguageSelectableTextController {
  final Language language;

  TargetLanguageSelectableTextController({required this.language});

  bool isEmptyOrPunctuation(String text) {
    if (text.trim().isEmpty) return true;
    return RegExp(r'^[\s\p{P}\p{S}]+$', unicode: true).hasMatch(text);
  }

  bool isSingleWord(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return false;
    final words = trimmed.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    return words.length == 1;
  }

  bool isShortSelection(int start, int end, String fullText) {
    if (start == end) return true;
    final selected = fullText.substring(start, end).trim();
    if (selected.isEmpty) return false;
    final words = selected.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    return words.length <= 2;
  }

  (String text, int start, int end) expandToInvolvedWords(int start, int end, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    final (adjStart, adjEnd) = _skipBoundaries(start, end, fullText);
    if (adjStart >= adjEnd) return ('', 0, 0);
    int newStart = adjStart;
    int newEnd = adjEnd;
    if (adjStart > 0 && !_isWordBoundary(fullText[adjStart - 1])) {
      newStart = _findWordStart(adjStart, fullText);
    }
    if (adjEnd < fullText.length && !_isWordBoundary(fullText[adjEnd])) {
      newEnd = _findWordEnd(adjEnd, fullText);
    }
    return (fullText.substring(newStart, newEnd), newStart, newEnd);
  }

  (String text, int start, int end) expandToParagraph(int start, int end, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    int newStart = _findWordStart(start, fullText);
    int newEnd = _findWordEnd(end, fullText);
    while (newStart > 0 && fullText[newStart - 1] != '\n') {
      newStart--;
    }
    while (newEnd < fullText.length && fullText[newEnd] != '\n') {
      newEnd++;
    }
    final (cleanStart, cleanEnd) = _trimBoundaries(newStart, newEnd, fullText);
    if (cleanStart >= cleanEnd) return ('', 0, 0);
    return (fullText.substring(cleanStart, cleanEnd), cleanStart, cleanEnd);
  }

  bool _isWordBoundary(String char) {
    return char == ' ' ||
        char == '\n' ||
        char == '\t' ||
        RegExp(r'[\p{P}\p{S}]', unicode: true).hasMatch(char);
  }

  int _findWordStart(int index, String text) {
    int pos = index;
    while (pos > 0 && !_isWordBoundary(text[pos - 1])) {
      pos--;
    }
    return pos;
  }

  int _findWordEnd(int index, String text) {
    int pos = index;
    while (pos < text.length && !_isWordBoundary(text[pos])) {
      pos++;
    }
    return pos;
  }

  (int start, int end) _skipBoundaries(int start, int end, String text) {
    int newStart = start;
    int newEnd = end;
    while (newStart < newEnd && _isWordBoundary(text[newStart])) {
      newStart++;
    }
    while (newEnd > newStart && _isWordBoundary(text[newEnd - 1])) {
      newEnd--;
    }
    return (newStart, newEnd);
  }

  (int start, int end) _trimBoundaries(int start, int end, String text) {
    int newStart = start;
    int newEnd = end;
    while (newStart < text.length && _isWordBoundary(text[newStart])) {
      newStart++;
    }
    while (newEnd > newStart && _isWordBoundary(text[newEnd - 1])) {
      newEnd--;
    }
    return (newStart, newEnd);
  }
}

class TargetLanguageSelectableText extends StatefulWidget {
  final String fullText;
  final void Function(String) translateSelectedTextCallback;
  final void Function(String) explainSelectedTextDoubtCallback;
  final void Function(String) getSelectedWord;

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
  final _controller = getIt<TargetLanguageSelectableTextController>();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSelectionChange(TextSelection selection) {
    if (selection.isCollapsed) return;
    final selectedText = widget.fullText.substring(selection.start, selection.end);
    if (_controller.isEmptyOrPunctuation(selectedText)) {
      _focusNode.unfocus();
      return;
    }
    final isShort = _controller.isShortSelection(selection.start, selection.end, widget.fullText);
    final (expandedText, _, _) = isShort
        ? _controller.expandToInvolvedWords(selection.start, selection.end, widget.fullText)
        : _controller.expandToParagraph(selection.start, selection.end, widget.fullText);
    if (expandedText.isEmpty) {
      _focusNode.unfocus();
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
          _handleSelectionChange(selection);
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
    final selection = delegate.textEditingValue.selection;
    if (selection.isCollapsed) return const SizedBox.shrink();
    final selectedText = fullText.substring(selection.start, selection.end);
    if (controller.isEmptyOrPunctuation(selectedText)) {
      _unfocusAfterFrame();
      return const SizedBox.shrink();
    }
    final isShort = controller.isShortSelection(selection.start, selection.end, fullText);
    final (expandedText, _, _) = isShort
        ? controller.expandToInvolvedWords(selection.start, selection.end, fullText)
        : controller.expandToParagraph(selection.start, selection.end, fullText);
    if (expandedText.isEmpty) {
      _unfocusAfterFrame();
      return const SizedBox.shrink();
    }
    final isSingleWord = controller.isSingleWord(expandedText);
    return _CustomToolbar(
      globalEditableRegion: globalEditableRegion,
      selectionMidpoint: selectionMidpoint,
      isSingleWord: isSingleWord,
      onWordInfo: () => _handleAction(() => wordLemaCallback(expandedText)),
      onTranslate: () => _handleAction(() => translateCallback(expandedText)),
      onDoubt: () => _handleAction(() => doubtCallback(expandedText)),
    );
  }

  void _unfocusAfterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) => focusNode.unfocus());
  }

  void _handleAction(VoidCallback action) {
    action();
    focusNode.unfocus();
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
    final leftPosition = _calculateLeftPosition(screenWidth, toolbarWidth);
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
              decoration: _toolbarDecoration(),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildButtons(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _calculateLeftPosition(double screenWidth, double toolbarWidth) {
    const padding = 16.0;
    double left = globalEditableRegion.left + selectionMidpoint.dx - (toolbarWidth / 2);
    if (left < padding) {
      return padding;
    }
    if (left + toolbarWidth > screenWidth - padding) {
      return screenWidth - toolbarWidth - padding;
    }
    return left;
  }

  BoxDecoration _toolbarDecoration() {
    return BoxDecoration(
      color: const Color(0xFF2C2C2E),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha:  0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  List<Widget> _buildButtons() {
    if (isSingleWord) {
      return [
        _ToolbarButton(
          icon: Icons.info_outline,
          label: 'Info',
          onPressed: onWordInfo,
        ),
      ];
    }
    return [
      _ToolbarButton(
        icon: Icons.translate,
        label: 'Translate',
        onPressed: onTranslate,
      ),
      _buildDivider(),
      _ToolbarButton(
        icon: Icons.help_outline,
        label: 'Doubt',
        onPressed: onDoubt,
      ),
    ];
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 30,
      color: Colors.white.withValues(alpha:  0.2),
      margin: const EdgeInsets.symmetric(horizontal: 4),
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
