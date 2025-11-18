import 'package:flutter/material.dart';
import 'package:vitalingu/shared/widgets/selectable_text/shimmer_loading_word_content.dart';

class WordDefinitionDisplayContainer extends StatelessWidget {
  final Widget? content;
  final VoidCallback onNavigateBack;
  final VoidCallback onCloseAllWindows;

  final double containerBorderRadiusRatio;
  final double containerInnerPaddingRatio;
  final double containerShadowOpacity;
  final double containerShadowBlurRadius;
  final double containerShadowSpreadRadius;
  final double verticalSpacingRatio;
  final double topSpacingMultiplier;
  final double navigationPaddingMultiplier;

  const WordDefinitionDisplayContainer({
    super.key,
    this.content,
    required this.onNavigateBack,
    required this.onCloseAllWindows,
    this.containerBorderRadiusRatio = 0.045,
    this.containerInnerPaddingRatio = 0.02,
    this.containerShadowOpacity = 0.1,
    this.containerShadowBlurRadius = 10.0,
    this.containerShadowSpreadRadius = 2.0,
    this.verticalSpacingRatio = 0.025,
    this.topSpacingMultiplier = 0.3,
    this.navigationPaddingMultiplier = 0.75,
  });

  Widget _buildNavigationBar(double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding * navigationPaddingMultiplier),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onNavigateBack,
            icon: const Icon(Icons.arrow_back),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            onPressed: onCloseAllWindows,
            icon: const Icon(Icons.close),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenDimensions = MediaQuery.of(context).size;
    final screenWidth = screenDimensions.width;

    final calculatedBorderRadius = screenWidth * containerBorderRadiusRatio;
    final calculatedPadding = screenWidth * containerInnerPaddingRatio;
    final calculatedSpacing = screenDimensions.height * verticalSpacingRatio;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(calculatedBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(containerShadowOpacity),
            blurRadius: containerShadowBlurRadius,
            spreadRadius: containerShadowSpreadRadius,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(calculatedPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNavigationBar(calculatedPadding),
            SizedBox(height: calculatedSpacing * topSpacingMultiplier),
            Expanded(
              child: content ?? const ShimmerLoadingWordContent(),
            ),
          ],
        ),
      ),
    );
  }
}