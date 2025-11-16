import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/word_generation_service.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final TextEditingController _wordController = TextEditingController();

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Learning')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TextField for user input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _wordController,
                decoration: const InputDecoration(
                  labelText: 'Enter a word',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final inputWord = _wordController.text.trim();
                if (inputWord.isNotEmpty) {
                  final word = await getIt<WordGenerationService>().getWord(inputWord);
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => WordDialog(word: word),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a word')),
                  );
                }
              },
              child: const Text('Generate Word'),
            ),
          ],
        ),
      ),
    );
  }
}

class WordDialog extends StatefulWidget {
  final dynamic word;

  const WordDialog({super.key, required this.word});

  @override
  State<WordDialog> createState() => _WordDialogState();
}

class _WordDialogState extends State<WordDialog> {
  late final PageController _pageController;
  late final Signal<int> _currentPage;
  late final List<Widget> _wordWidgets;

  @override
  void initState() {
    super.initState();
    _wordWidgets = widget.word.getWordWidgets();
    _currentPage = Signal(0);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Center the word at the top
            Center(
              child: Text(
                widget.word.wordLema ?? 'Unknown Word', // Access wordLema from the Word object
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => _currentPage.value = index,
                itemCount: _wordWidgets.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: _wordWidgets[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPage.value > 0) {
                      _goToPage(_currentPage.value - 1);
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 16),
                Watch((context) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    _wordWidgets.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage.value == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                )),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    if (_currentPage.value < _wordWidgets.length - 1) {
                      _goToPage(_currentPage.value + 1);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}