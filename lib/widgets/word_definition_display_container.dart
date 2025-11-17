import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:signals/signals_flutter.dart';

class WordDefinitionDisplayContainer extends StatelessWidget {
  final Signal<Widget?> wordContentSignal;
  final VoidCallback onNavigateBack;
  final VoidCallback onCloseAllWindows;

  final double containerBorderRadiusRatio;
  final double containerInnerPaddingRatio;
  final double containerShadowOpacity;
  final double containerShadowBlurRadius;
  final double containerShadowSpreadRadius;
  
  final double verticalSpacingRatio;
  final double topSpacingMultiplier;
  
  final double shimmerContentWidthScale;
  final double shimmerLineHeightRatio;
  final int shimmerExampleItemCount;
  final double shimmerTitleWidthMultiplier;
  final double shimmerTitleHeightMultiplier;
  final double shimmerSectionTitleWidth;
  final double shimmerSectionContentWidthSmall;
  final double shimmerSectionContentWidthMedium;
  final double shimmerSectionContentWidthLarge;
  final double shimmerExampleWidthMultiplier;
  final double shimmerExampleSecondLineScale;
  final double shimmerBorderRadius;
  
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  
  final double navigationPaddingMultiplier;

  const WordDefinitionDisplayContainer({
    super.key,
    required this.wordContentSignal,
    required this.onNavigateBack,
    required this.onCloseAllWindows,
    this.containerBorderRadiusRatio = 0.045,
    this.containerInnerPaddingRatio = 0.02,
    this.containerShadowOpacity = 0.1,
    this.containerShadowBlurRadius = 10.0,
    this.containerShadowSpreadRadius = 2.0,
    this.verticalSpacingRatio = 0.025,
    this.topSpacingMultiplier = 0.3,
    this.shimmerContentWidthScale = 0.7,
    this.shimmerLineHeightRatio = 0.027,
    this.shimmerExampleItemCount = 3,
    this.shimmerTitleWidthMultiplier = 0.35,
    this.shimmerTitleHeightMultiplier = 1.3,
    this.shimmerSectionTitleWidth = 0.27,
    this.shimmerSectionContentWidthSmall = 0.85,
    this.shimmerSectionContentWidthMedium = 0.7,
    this.shimmerSectionContentWidthLarge = 1.0,
    this.shimmerExampleWidthMultiplier = 1.2,
    this.shimmerExampleSecondLineScale = 0.85,
    this.shimmerBorderRadius = 4.0,
    this.shimmerBaseColor = const Color(0xFFE0E0E0),
    this.shimmerHighlightColor = const Color(0xFFF5F5F5),
    this.navigationPaddingMultiplier = 0.75,
  });

  Widget _createShimmerBar({
    required double barWidth,
    required double barHeight,
  }) {
    return Container(
      width: barWidth,
      height: barHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(shimmerBorderRadius),
      ),
    );
  }

  Widget _createShimmerSection({
    required double availableWidth,
    required double availableHeight,
    required double titleWidthMultiplier,
    required double contentWidthMultiplier,
    required double sectionSpacing,
    required double titleHeightScale,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _createShimmerBar(
          barWidth: availableWidth * titleWidthMultiplier,
          barHeight: availableHeight * shimmerLineHeightRatio * titleHeightScale,
        ),
        SizedBox(height: sectionSpacing * 0.4),
        _createShimmerBar(
          barWidth: availableWidth * contentWidthMultiplier,
          barHeight: availableHeight * shimmerLineHeightRatio,
        ),
      ],
    );
  }

  Widget _createShimmerExampleItem({
    required double availableWidth,
    required double availableHeight,
    required double widthMultiplier,
    required double itemSpacing,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemSpacing * 0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createShimmerBar(
            barWidth: availableWidth * widthMultiplier,
            barHeight: availableHeight * shimmerLineHeightRatio,
          ),
          SizedBox(height: itemSpacing * 0.4),
          _createShimmerBar(
            barWidth: availableWidth * (widthMultiplier * shimmerExampleSecondLineScale),
            barHeight: availableHeight * shimmerLineHeightRatio,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingShimmerLayout({
    required double screenWidth,
    required double screenHeight,
    required double spacing,
  }) {
    final titleWidth = shimmerContentWidthScale * shimmerTitleWidthMultiplier;
    final sectionTitleWidth = shimmerContentWidthScale * shimmerSectionTitleWidth;
    
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: shimmerHighlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createShimmerBar(
              barWidth: screenWidth * titleWidth,
              barHeight: screenHeight * shimmerLineHeightRatio * shimmerTitleHeightMultiplier,
            ),
            SizedBox(height: spacing),
            _createShimmerSection(
              availableWidth: screenWidth,
              availableHeight: screenHeight,
              titleWidthMultiplier: sectionTitleWidth,
              contentWidthMultiplier: shimmerContentWidthScale * shimmerSectionContentWidthSmall,
              sectionSpacing: spacing,
              titleHeightScale: 0.9,
            ),
            SizedBox(height: spacing),
            _createShimmerSection(
              availableWidth: screenWidth,
              availableHeight: screenHeight,
              titleWidthMultiplier: sectionTitleWidth,
              contentWidthMultiplier: shimmerContentWidthScale * shimmerSectionContentWidthMedium,
              sectionSpacing: spacing,
              titleHeightScale: 0.9,
            ),
            SizedBox(height: spacing),
            _createShimmerSection(
              availableWidth: screenWidth,
              availableHeight: screenHeight,
              titleWidthMultiplier: sectionTitleWidth,
              contentWidthMultiplier: shimmerContentWidthScale * shimmerSectionContentWidthLarge,
              sectionSpacing: spacing,
              titleHeightScale: 0.9,
            ),
            SizedBox(height: spacing),
            _createShimmerBar(
              barWidth: screenWidth * sectionTitleWidth,
              barHeight: screenHeight * shimmerLineHeightRatio * 0.9,
            ),
            SizedBox(height: spacing * 0.7),
            ...List.generate(
              shimmerExampleItemCount,
              (index) => _createShimmerExampleItem(
                availableWidth: screenWidth,
                availableHeight: screenHeight,
                widthMultiplier: shimmerContentWidthScale * shimmerExampleWidthMultiplier,
                itemSpacing: spacing,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
    final screenHeight = screenDimensions.height;
    final screenWidth = screenDimensions.width;

    final calculatedBorderRadius = screenWidth * containerBorderRadiusRatio;
    final calculatedPadding = screenWidth * containerInnerPaddingRatio;
    final calculatedSpacing = screenHeight * verticalSpacingRatio;

    return Align(
      alignment: Alignment.center,
      child: Container(
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
                child: Watch((context) {
                  final wordContent = wordContentSignal.value;
                  if (wordContent == null) {
                    return _buildLoadingShimmerLayout(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      spacing: calculatedSpacing,
                    );
                  }
                  return wordContent;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}