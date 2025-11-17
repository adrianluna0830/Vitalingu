import 'package:flutter/material.dart';

class CustomOverlay {
  final Widget myWidget;
  OverlayEntry? _overlayEntry;

  CustomOverlay({required this.myWidget});

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
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
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
