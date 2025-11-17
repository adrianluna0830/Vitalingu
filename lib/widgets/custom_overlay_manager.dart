import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/custom_overlay.dart';
@injectable
class CustomOverlayManager {
  final CustomOverlay _overlaySingleton = getIt<CustomOverlay>();
  OverlayEntry? _overlayEntry;

  void showOverlay(BuildContext context, Widget widget, {bool alwaysFill = false}) {
    _overlayEntry = _overlaySingleton.showOverlay(context, widget, alwaysFill: alwaysFill);
  }

  void hideOverlay() {
    if (_overlayEntry != null) {
      _overlaySingleton.removeOverlay(_overlayEntry!);
      _overlayEntry = null;
    }
  }

  void hideAllOverlays() {
    _overlaySingleton.removeAllOverlays();
    _overlayEntry = null;
  }
}
