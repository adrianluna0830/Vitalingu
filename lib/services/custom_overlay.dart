import 'package:flutter/material.dart';

class CustomOverlay {
  final GlobalKey bodyKey;
  final Widget myWidget;
  OverlayEntry? _overlayEntry;

  CustomOverlay({required this.bodyKey, required this.myWidget});

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);


    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Material(
              color: Colors.transparent,
              child: myWidget,
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
