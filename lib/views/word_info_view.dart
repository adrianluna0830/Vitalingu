import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitalingu/word/word.dart';
@RoutePage()
class WordInfoView extends StatefulWidget {
  final Word word;
  const WordInfoView({super.key, required this.word});

  @override
  State<WordInfoView> createState() => _WordInfoViewState();
}

class _WordInfoViewState extends State<WordInfoView> {
  @override
  void initState() {
    super.initState();
    //  widget.word.getWordPrompt();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // child: widget.word.get,
        ),
      ),
    );
  }
}