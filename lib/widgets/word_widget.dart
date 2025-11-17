import 'package:flutter/material.dart';
import 'package:vitalingu/widgets/ai_selectable_text.dart';
import 'package:vitalingu/word/word.dart';

class WordWidget extends StatefulWidget {
  final Word word;
  const WordWidget({super.key, required this.word});

  @override
  State<WordWidget> createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < widget.word.definitions.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.word.wordLema,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              onPressed: _goToPreviousPage,
              icon: Icon(Icons.arrow_back),
            ),
            Expanded(
              child: SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: widget.word.definitions.length,
                  itemBuilder: (context, index) {
                    final definition = widget.word.definitions[index];
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Part of Speech: ${definition.partOfSpeech}'),
                            SizedBox(height: 10),
                            Text('Meaning: ${definition.meaning}'),
                            SizedBox(height: 20),
                            Text('Examples:', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            ...definition.examples.map((example) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AiSelectableText(text: example.untranslatedExample),
                                    Text('  ${example.translatedExample}', 
                                      style: TextStyle(fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: _goToNextPage,
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.word.definitions.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}