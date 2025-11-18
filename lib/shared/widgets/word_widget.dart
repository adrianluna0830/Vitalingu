import 'package:flutter/material.dart';
import 'package:vitalingu/shared/widgets/selectable_text/ai_selectable_text.dart';
import 'package:vitalingu/features/word_overlay/domain/model/word.dart';

class WordWidget extends StatefulWidget {
  final Word wordData;
  final Duration pageAnimationDuration;
  final Curve pageAnimationCurve;
  
  final TextStyle wordTitleStyle;
  final TextStyle sectionHeaderStyle;
  final TextStyle contentTextStyle;
  final TextStyle aiSelectableTextStyle;
  final TextStyle exampleTranslationStyle;
  
  final double verticalSpacing;
  final double sectionSpacing;
  final double examplePadding;
  final double horizontalPadding;
  
  final double indicatorSize;
  final double indicatorSpacing;
  final double navigationIconSize;

  const WordWidget({
    super.key,
    required this.wordData,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeInOut,
    this.wordTitleStyle = const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
    ),
    this.sectionHeaderStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    this.contentTextStyle = const TextStyle(fontSize: 16.0),
    this.aiSelectableTextStyle = const TextStyle(fontSize: 16.0),
    this.exampleTranslationStyle = const TextStyle(
      fontSize: 16.0,
      fontStyle: FontStyle.italic,
    ),
    this.verticalSpacing = 16.0,
    this.sectionSpacing = 6.0,
    this.examplePadding = 12.0,
    this.horizontalPadding = 16.0,
    this.indicatorSize = 10.0,
    this.indicatorSpacing = 4.0,
    this.navigationIconSize = 20.0,
  });

  @override
  State<WordWidget> createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  late PageController _definitionPageController;
  int _currentDefinitionIndex = 0;

  @override
  void initState() {
    super.initState();
    _definitionPageController = PageController();
  }

  @override
  void dispose() {
    _definitionPageController.dispose();
    super.dispose();
  }

  void _navigateToNextDefinition() {
    final isLastPage =
        _currentDefinitionIndex >= widget.wordData.definitions.length - 1;

    if (!isLastPage) {
      _definitionPageController.nextPage(
        duration: widget.pageAnimationDuration,
        curve: widget.pageAnimationCurve,
      );
    }
  }

  void _navigateToPreviousDefinition() {
    final isFirstPage = _currentDefinitionIndex <= 0;

    if (!isFirstPage) {
      _definitionPageController.previousPage(
        duration: widget.pageAnimationDuration,
        curve: widget.pageAnimationCurve,
      );
    }
  }

  void _updateCurrentPageIndex(int newIndex) {
    setState(() => _currentDefinitionIndex = newIndex);
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Widget _buildSectionHeader(String headerText) {
    return Text(headerText, style: widget.sectionHeaderStyle);
  }

  Widget _buildSectionBody(String bodyText) {
    return Text(
      _capitalizeFirstLetter(bodyText),
      style: widget.contentTextStyle,
    );
  }

  Widget _buildExampleBlock({required dynamic exampleData}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.examplePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AiSelectableText(
            text: _capitalizeFirstLetter(exampleData.untranslatedExample),
            textStyle: widget.aiSelectableTextStyle,
          ),
          SizedBox(height: widget.sectionSpacing * 0.67),
          Text(
            _capitalizeFirstLetter(exampleData.translatedExample),
            style: widget.exampleTranslationStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicatorDot({
    required int dotIndex,
    required bool isActiveDot,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.indicatorSpacing),
      width: widget.indicatorSize,
      height: widget.indicatorSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActiveDot ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget _buildNavigationBar() {
    final totalDefinitions = widget.wordData.definitions.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _navigateToPreviousDefinition,
          icon: const Icon(Icons.arrow_back),
          iconSize: widget.navigationIconSize,
        ),
        ...List.generate(
          totalDefinitions,
          (index) => _buildPageIndicatorDot(
            dotIndex: index,
            isActiveDot: _currentDefinitionIndex == index,
          ),
        ),
        IconButton(
          onPressed: _navigateToNextDefinition,
          icon: const Icon(Icons.arrow_forward),
          iconSize: widget.navigationIconSize,
        ),
      ],
    );
  }

  Widget _buildDefinitionPage({required WordDefinition definition}) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSectionHeader('Translated Word'),
            SizedBox(height: widget.sectionSpacing),
            _buildSectionBody(definition.translatedWord),
            SizedBox(height: widget.verticalSpacing),
            _buildSectionHeader('Part Of Speech'),
            SizedBox(height: widget.sectionSpacing),
            _buildSectionBody(definition.partOfSpeech),
            SizedBox(height: widget.verticalSpacing),
            _buildSectionHeader('Meaning'),
            SizedBox(height: widget.sectionSpacing),
            _buildSectionBody(definition.meaning),
            SizedBox(height: widget.verticalSpacing),
            _buildSectionHeader('Examples'),
            SizedBox(height: widget.examplePadding),
            ...definition.examples.map(
              (exampleItem) => _buildExampleBlock(exampleData: exampleItem),
            ),
            SizedBox(height: widget.verticalSpacing * 0.5),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _capitalizeFirstLetter(widget.wordData.wordLema),
          style: widget.wordTitleStyle,
        ),
        SizedBox(height: widget.verticalSpacing),
        Expanded(
          child: PageView.builder(
            controller: _definitionPageController,
            onPageChanged: _updateCurrentPageIndex,
            itemCount: widget.wordData.definitions.length,
            itemBuilder: (context, pageIndex) {
              final currentDefinition = widget.wordData.definitions[pageIndex];
              return _buildDefinitionPage(definition: currentDefinition);
            },
          ),
        ),
        SizedBox(height: widget.sectionSpacing * 0.67),
        _buildNavigationBar(),
      ],
    );
  }
}
