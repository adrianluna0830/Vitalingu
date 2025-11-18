import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingTextContent extends StatelessWidget {
  final double lineHeight;
  final double lineSpacing;
  final double shortLineWidthFactor;
  final Color baseColor;
  final Color highlightColor;
  final double borderRadius;

  const ShimmerLoadingTextContent({
    super.key,
    this.lineHeight = 16.0,
    this.lineSpacing = 8.0,
    this.shortLineWidthFactor = 0.5,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: lineHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          SizedBox(height: lineSpacing),
          Container(
            width: double.infinity,
            height: lineHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          SizedBox(height: lineSpacing),
          Container(
            width: MediaQuery.of(context).size.width * shortLineWidthFactor,
            height: lineHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ],
      ),
    );
  }
}

