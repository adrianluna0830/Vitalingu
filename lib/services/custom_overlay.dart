import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class CustomOverlay {
  final List<OverlayEntry> _overlays = []; // List to store OverlayEntry objects

  OverlayEntry showOverlay(BuildContext context, Widget myWidget, {bool alwaysFill = false}) {
    final overlay = Overlay.of(context);
    final size = MediaQuery.of(context).size;

    final bool isFirstOverlay = alwaysFill || _overlays.isEmpty; // Check if the list is empty

    OverlayEntry _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          if (isFirstOverlay)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.black.withAlpha(76), // Fixed typo in alpha
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

    overlay.insert(_overlayEntry);
    _overlays.add(_overlayEntry); // Add the OverlayEntry to the list
    return _overlayEntry;
  }

  void removeOverlay(OverlayEntry _overlayEntry) {
    _overlayEntry.remove();
    _overlays.remove(_overlayEntry); // Remove the OverlayEntry from the list
  }

  void removeAllOverlays() {
    for (final overlay in _overlays) {
      overlay.remove(); // Remove each OverlayEntry
    }
    _overlays.clear(); // Clear the list
  }
}
