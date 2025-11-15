import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';

@injectable
class CustomSelectableTextController {


  CustomSelectableTextController();

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

  (String text, int start, int end) expandToWords(int start, int end, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    final (adjustedStart, adjustedEnd) = _skipBoundaries(start, end, fullText);
    if (adjustedStart >= adjustedEnd) return ('', 0, 0);
    
    int expandedStart = adjustedStart;
    int expandedEnd = adjustedEnd;
    
    if (adjustedStart > 0 && !_isWordBoundary(fullText[adjustedStart - 1])) {
      expandedStart = _findWordStart(adjustedStart, fullText);
    }
    if (adjustedEnd < fullText.length && !_isWordBoundary(fullText[adjustedEnd])) {
      expandedEnd = _findWordEnd(adjustedEnd, fullText);
    }
    
    return (fullText.substring(expandedStart, expandedEnd), expandedStart, expandedEnd);
  }

  (String text, int start, int end) expandToParagraph(int start, int end, String fullText) {
    if (fullText.isEmpty) return ('', 0, 0);
    
    int expandedStart = _findWordStart(start, fullText);
    int expandedEnd = _findWordEnd(end, fullText);
    
    while (expandedStart > 0 && fullText[expandedStart - 1] != '\n') {
      expandedStart--;
    }
    while (expandedEnd < fullText.length && fullText[expandedEnd] != '\n') {
      expandedEnd++;
    }
    
    final (cleanStart, cleanEnd) = _trimBoundaries(expandedStart, expandedEnd, fullText);
    if (cleanStart >= cleanEnd) return ('', 0, 0);
    
    return (fullText.substring(cleanStart, cleanEnd), cleanStart, cleanEnd);
  }

  String getSentenceWithMarkedSelection(
    int originalStart,
    int originalEnd,
    String fullText,
    int expandedStart,
    int expandedEnd,
  ) {
    if (expandedStart < 0 || expandedEnd > fullText.length || expandedStart >= expandedEnd) {
      return fullText;
    }
    
    int sentenceStart = expandedStart;
    while (sentenceStart > 0) {
      final char = fullText[sentenceStart - 1];
      if (char == '.' || char == '!' || char == '?' || char == '\n') {
        break;
      }
      sentenceStart--;
    }
    
    while (sentenceStart < fullText.length && 
           (fullText[sentenceStart] == ' ' || 
            fullText[sentenceStart] == '\t' || 
            fullText[sentenceStart] == '\n')) {
      sentenceStart++;
    }
    
    int sentenceEnd = expandedEnd;
    while (sentenceEnd < fullText.length) {
      final char = fullText[sentenceEnd];
      if (char == '.' || char == '!' || char == '?' || char == '\n') {
        sentenceEnd++;
        break;
      }
      sentenceEnd++;
    }
    
    final selectionStartInSentence = expandedStart - sentenceStart;
    final selectionEndInSentence = expandedEnd - sentenceStart;
    
    final sentence = fullText.substring(sentenceStart, sentenceEnd);
    final before = sentence.substring(0, selectionStartInSentence);
    final selected = sentence.substring(selectionStartInSentence, selectionEndInSentence);
    final after = sentence.substring(selectionEndInSentence);
    
    return '$before<$selected>$after';
  }

  bool _isWordBoundary(String char) {
    return char == ' ' ||
        char == '\n' ||
        char == '\t' ||
        RegExp(r'[\p{P}\p{S}]', unicode: true).hasMatch(char);
  }

  int _findWordStart(int index, String text) {
    int position = index;
    while (position > 0 && !_isWordBoundary(text[position - 1])) {
      position--;
    }
    return position;
  }

  int _findWordEnd(int index, String text) {
    int position = index;
    while (position < text.length && !_isWordBoundary(text[position])) {
      position++;
    }
    return position;
  }

  (int start, int end) _skipBoundaries(int start, int end, String text) {
    int adjustedStart = start;
    int adjustedEnd = end;
    
    while (adjustedStart < adjustedEnd && _isWordBoundary(text[adjustedStart])) {
      adjustedStart++;
    }
    while (adjustedEnd > adjustedStart && _isWordBoundary(text[adjustedEnd - 1])) {
      adjustedEnd--;
    }
    
    return (adjustedStart, adjustedEnd);
  }

  (int start, int end) _trimBoundaries(int start, int end, String text) {
    int trimmedStart = start;
    int trimmedEnd = end;
    
    while (trimmedStart < text.length && _isWordBoundary(text[trimmedStart])) {
      trimmedStart++;
    }
    while (trimmedEnd > trimmedStart && _isWordBoundary(text[trimmedEnd - 1])) {
      trimmedEnd--;
    }
    
    return (trimmedStart, trimmedEnd);
  }
}

class CustomSelectableText extends StatefulWidget {
  final String fullText;
  final Future<void> Function(String selection, String selectionContext) onTranslate;
  final Future<void> Function(String selection, String selectionContext) onExplainDoubt;
  final Future<void> Function(String selection, String selectionContext) onWordInfo;

  const CustomSelectableText({
    super.key,
    required this.onTranslate,
    required this.onExplainDoubt,
    required this.onWordInfo,
    required this.fullText,
  });

  @override
  State<CustomSelectableText> createState() => _CustomSelectableTextState();
}

class _CustomSelectableTextState extends State<CustomSelectableText> {
  final _controller = getIt<CustomSelectableTextController>();
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
        ? _controller.expandToWords(selection.start, selection.end, widget.fullText)
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
        onTranslate: widget.onTranslate,
        onExplainDoubt: widget.onExplainDoubt,
        onWordInfo: widget.onWordInfo,
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
  final CustomSelectableTextController controller;
  final String fullText;
  final Future<void> Function(String, String) onTranslate;
  final Future<void> Function(String, String) onExplainDoubt;
  final Future<void> Function(String, String) onWordInfo;
  final FocusNode focusNode;

  _CustomTextSelectionControls({
    required this.controller,
    required this.fullText,
    required this.onTranslate,
    required this.onExplainDoubt,
    required this.onWordInfo,
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
    final (expandedText, expandedStart, expandedEnd) = isShort
        ? controller.expandToWords(selection.start, selection.end, fullText)
        : controller.expandToParagraph(selection.start, selection.end, fullText);
        
    if (expandedText.isEmpty) {
      _unfocusAfterFrame();
      return const SizedBox.shrink();
    }
    
    final sentenceContext = controller.getSentenceWithMarkedSelection(
      selection.start, 
      selection.end, 
      fullText,
      expandedStart,
      expandedEnd,
    );
    final isSingleWord = controller.isSingleWord(expandedText);
    
    return _CustomToolbar(
      globalEditableRegion: globalEditableRegion,
      selectionMidpoint: selectionMidpoint,
      isSingleWord: isSingleWord,
      onWordInfo: () => _handleAction(() => onWordInfo(expandedText, sentenceContext)),
      onTranslate: () => _handleAction(() => onTranslate(expandedText, sentenceContext)),
      onDoubt: () => _handleAction(() => onExplainDoubt(expandedText, sentenceContext)),
    );
  }

  void _unfocusAfterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) => focusNode.unfocus());
  }

  void _handleAction(Future<void> Function() action) {
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
    final toolbarWidth = isSingleWord ? 320.0 : 220.0;
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
              decoration: _buildToolbarDecoration(),
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
    
    if (left < padding) return padding;
    if (left + toolbarWidth > screenWidth - padding) {
      return screenWidth - toolbarWidth - padding;
    }
    return left;
  }

  BoxDecoration _buildToolbarDecoration() {
    return BoxDecoration(
      color: const Color(0xFF2C2C2E),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  List<Widget> _buildButtons() {
    final buttons = <Widget>[];
    
    if (isSingleWord) {
      buttons.add(_ToolbarButton(
        icon: Icons.info_outline,
        label: 'Info',
        onPressed: onWordInfo,
      ));
      buttons.add(_buildDivider());
    }
    
    buttons.add(_ToolbarButton(
      icon: Icons.translate,
      label: 'Translate',
      onPressed: onTranslate,
    ));
    
    buttons.add(_buildDivider());
    
    buttons.add(_ToolbarButton(
      icon: Icons.help_outline,
      label: 'Doubt',
      onPressed: onDoubt,
    ));
    
    return buttons;
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 30,
      color: Colors.white.withValues(alpha: 0.2),
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