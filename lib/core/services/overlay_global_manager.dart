import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class OverlayGlobalManager {
  final List<OverlayEntry> _overlays = [];

  OverlayEntry showOverlay(BuildContext context, Widget myWidget, {bool alwaysFill = false}) {
    final overlay = Overlay.of(context);
    final size = MediaQuery.of(context).size;

    final bool isFirstOverlay = alwaysFill || _overlays.isEmpty;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          if (isFirstOverlay)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.black.withAlpha(76),
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

    overlay.insert(overlayEntry);
    _overlays.add(overlayEntry);
    return overlayEntry;
  }

  void removeOverlay(OverlayEntry overlayEntry) {
    overlayEntry.remove();
    _overlays.remove(overlayEntry);
  }

  void removeAllOverlays() {
    for (final overlay in _overlays) {
      overlay.remove();
    }
    _overlays.clear();
  }
}

