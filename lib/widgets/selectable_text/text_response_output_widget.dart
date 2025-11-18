import 'package:flutter/material.dart';
import 'package:vitalingu/shared/widgets/selectable_text/shimmer_loading_text_content.dart';

class ResponseOutputPanel extends StatelessWidget {
  final VoidCallback onClose;
  final String? content;
  final double maxHeight;
  final double borderRadius;
  final Color backgroundColor;
  final double shadowOpacity;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final double contentPadding;
  final double topSpacing;

  const ResponseOutputPanel({
    super.key,
    required this.onClose,
    this.content,
    this.maxHeight = 300.0,
    this.borderRadius = 20.0,
    this.backgroundColor = Colors.white,
    this.shadowOpacity = 0.1,
    this.shadowBlurRadius = 10.0,
    this.shadowSpreadRadius = 2.0,
    this.contentPadding = 20.0,
    this.topSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(shadowOpacity),
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(contentPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            SizedBox(height: topSpacing),
            Flexible(
              child: content == null
                  ? const ShimmerLoadingTextContent()
                  : SingleChildScrollView(
                      child: Text(content!),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
