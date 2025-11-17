import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

class CustomSelectableText extends StatelessWidget {
  final String text;
  final String leftBracket;
  final String rightBracket;
  final Function(String selection, String selectionBracketedInSentence) doubtCallback;
  final Function(String selection, String selectionBracketedInSentence) translationCallback;
  final Function(String selection, String selectionBracketedInSentence) wordInfoCallback;
  
  const CustomSelectableText({
    super.key,
    required this.text,
    required this.leftBracket,
    required this.rightBracket,
    required this.doubtCallback,
    required this.translationCallback,
    required this.wordInfoCallback,
    this.textStyle, // Added textStyle parameter
  });

  final TextStyle? textStyle; // Added textStyle field


  String _getExpandedSelection(EditableTextState editableTextState) {
    final selection = editableTextState.textEditingValue.selection;
    final fullText = editableTextState.textEditingValue.text;
    final (adjStart, adjEnd) = _adjustToWordBoundaries(fullText, selection.start, selection.end);
    return fullText.substring(adjStart, adjEnd).trim();
  }

  (String text, int start, int end) _getExpandedSelectionWithIndices(
      EditableTextState editableTextState) {
    final selection = editableTextState.textEditingValue.selection;
    final fullText = editableTextState.textEditingValue.text;
    final (adjStart, adjEnd) = _adjustToWordBoundaries(fullText, selection.start, selection.end);
    final adjustedText = fullText.substring(adjStart, adjEnd).trim();
    return (adjustedText, adjStart, adjEnd);
  }
  String _getSentenceWithBracketedSelection(String fullText, int start, int end) {
    while (start < fullText.length && fullText[start] == ' ') {
      start++;
    }
    while (end > start && fullText[end - 1] == ' ') {
      end--;
    }
    
    int sentenceStart = start;
    while (sentenceStart > 0 && 
           fullText[sentenceStart - 1] != '.' && 
           fullText[sentenceStart - 1] != '\n') {
      sentenceStart--;
    }
    
    int sentenceEnd = end;
    while (sentenceEnd < fullText.length && 
           fullText[sentenceEnd] != '.' && 
           fullText[sentenceEnd] != '\n') {
      sentenceEnd++;
    }
    
    if (sentenceEnd < fullText.length && fullText[sentenceEnd] == '.') {
      sentenceEnd++;
    }
    
    String context = fullText.substring(sentenceStart, sentenceEnd).trim();
    
    int relativeStart = start - sentenceStart;
    int relativeEnd = end - sentenceStart;
    
    String beforeTrim = fullText.substring(sentenceStart, sentenceEnd);
    int trimmedStart = beforeTrim.length - beforeTrim.trimLeft().length;
    relativeStart -= trimmedStart;
    relativeEnd -= trimmedStart;
    
    if (relativeStart < 0) relativeStart = 0;
    if (relativeEnd > context.length) relativeEnd = context.length;
    
    String before = context.substring(0, relativeStart);
    String selected = context.substring(relativeStart, relativeEnd);
    String after = context.substring(relativeEnd);
    
    return before + leftBracket + selected + rightBracket + after;
  }
  (int start, int end) _adjustToWordBoundaries(String text, int start, int end) {
    if (start < 0 || end > text.length || start > end) {
      return (start, end);
    }
    
    int adjustedStart = start;
    int adjustedEnd = end;

    if (start > 0 && start < text.length && !_isWordBoundary(text[start])) {
      while (adjustedStart > 0 && !_isWordBoundary(text[adjustedStart - 1])) {
        adjustedStart--;
      }
    }
    
    if (end > 0 && end <= text.length && !_isWordBoundary(text[end - 1])) {
      while (adjustedEnd < text.length && !_isWordBoundary(text[adjustedEnd])) {
        adjustedEnd++;
      }
    }
    
    return (adjustedStart, adjustedEnd);
  }

  bool _isWordBoundary(String char) {
    return char == ' ' || 
           char == '\n' || 
           char == '\t' || 
           char == '.' || 
           char == ',' || 
           char == ';' || 
           char == ':' || 
           char == '!' || 
           char == '?' || 
           char == '-' || 
           char == '(' || 
           char == ')' || 
           char == '[' || 
           char == ']' || 
           char == '{' || 
           char == '}' ||
           char == '"' ||
           char == "'" ||
           char == '\r';
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: textStyle ?? const TextStyle(fontSize: 16, fontFamily: "Arial"), // Use textStyle if provided
      contextMenuBuilder: (context, editableTextState) {
        final selection = editableTextState.textEditingValue.selection;
        final fullText = editableTextState.textEditingValue.text;

        if (selection.end - selection.start == 1) {
          final char = fullText.substring(selection.start, selection.end);
          if (_isWordBoundary(char)) {
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: [],
            );
          }
        }

        final expandedText = _getExpandedSelection(editableTextState);
        final wordCount = expandedText.isEmpty ? 0 : expandedText.countWords();

        final List<ContextMenuButtonItem> buttons = [
          ContextMenuButtonItem(
            onPressed: () {
              final (txt, st, ed) = _getExpandedSelectionWithIndices(editableTextState);
              
              if (txt.isEmpty) {
                editableTextState.hideToolbar();
                return;
              }
              
              final bracketedSentence = _getSentenceWithBracketedSelection(
                fullText,
                st,
                ed,
              );
              
              translationCallback(txt, bracketedSentence);
              editableTextState.hideToolbar();
            },
            label: 'Translate',
          ),
          ContextMenuButtonItem(
            onPressed: () {
              final (txt, st, ed) = _getExpandedSelectionWithIndices(editableTextState);
              
              if (txt.isEmpty) {
                editableTextState.hideToolbar();
                return;
              }
              
              final bracketedSentence = _getSentenceWithBracketedSelection(
                fullText,
                st,
                ed,
              );
              
              doubtCallback(txt, bracketedSentence);
              editableTextState.hideToolbar();
            },
            label: 'Doubt',
          ),
        ];

        if (wordCount == 1) {
          buttons.add(
            ContextMenuButtonItem(
              onPressed: () {
                final (txt, st, ed) = _getExpandedSelectionWithIndices(editableTextState);
                final bracketedSentence = _getSentenceWithBracketedSelection(
                  fullText,
                  st,
                  ed,
                );
                
                wordInfoCallback(txt, bracketedSentence);
                editableTextState.hideToolbar();
              },
              label: 'Word Info',
            ),
          );
        }
        
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: buttons,
        );
      },
    );
  }
}
