import 'package:flutter/material.dart';

class CustomOverlay {
  final Widget myWidget;
  OverlayEntry? _overlayEntry;

  CustomOverlay({required this.myWidget});

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final size = MediaQuery.of(context).size;

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
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Material(
                color: Colors.transparent,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width - 60,
                    maxHeight: size.height - 60,
                  ),
                  child: myWidget,
                ),
              ),
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
