import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerInfoPanelContent extends StatelessWidget {
  final double spacing;
  final double titleHeight;
  final double subtitleHeight;
  final double bodyHeight;

  const ShimmerInfoPanelContent({
    super.key,
    this.spacing = 10.0,
    this.titleHeight = 18.0,
    this.subtitleHeight = 15.0,
    this.bodyHeight = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlaceholderLine(width: 180.0, height: titleHeight),
          SizedBox(height: spacing),
          _buildPlaceholderLine(width: 250.0, height: subtitleHeight),
          SizedBox(height: spacing * 1.5),
          _buildPlaceholderLine(width: double.infinity, height: bodyHeight),
          SizedBox(height: spacing / 2),
          _buildPlaceholderLine(width: double.infinity, height: bodyHeight),
          SizedBox(height: spacing / 2),
          _buildPlaceholderLine(width: 200.0, height: bodyHeight),
          SizedBox(height: spacing),
          _buildPlaceholderLine(width: double.infinity, height: bodyHeight),
          SizedBox(height: spacing / 2),
          _buildPlaceholderLine(width: 150.0, height: bodyHeight),
          SizedBox(height: spacing),
          _buildPlaceholderLine(width: double.infinity, height: bodyHeight),
          SizedBox(height: spacing / 2),
          _buildPlaceholderLine(width: double.infinity, height: bodyHeight),
          SizedBox(height: spacing / 2),
          _buildPlaceholderLine(width: 220.0, height: bodyHeight),
        ],
      ),
    );
  }

  Widget _buildPlaceholderLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}