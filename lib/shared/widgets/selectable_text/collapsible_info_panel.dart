import 'package:flutter/material.dart';
import 'package:vitalingu/shared/widgets/selectable_text/shimmer_loading_panel_content.dart';

class CollapsibleInfoPanel extends StatelessWidget {
  final VoidCallback onClose;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final double contentPadding;
  final double shadowBlurRadius;
  final Color shadowColor;
  final Widget? content;
  
  const CollapsibleInfoPanel({
    super.key,
    required this.onClose,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    this.backgroundColor = Colors.white,
    this.contentPadding = 20.0, 
    this.shadowBlurRadius = 10.0,
    this.shadowColor = Colors.black26,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: shadowBlurRadius,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onClose,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(contentPadding),
                child: content ?? const ShimmerLoadingPanelContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

