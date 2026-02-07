// widgets/bottom_menu_background.dart
import 'package:flutter/material.dart';

class BottomMenuBackground extends StatelessWidget {
  final Widget child;
  final VoidCallback onClose;

  const BottomMenuBackground({
    super.key,
    required this.onClose,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[100] ,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: onClose,
                icon: const Icon(Icons.close, size: 20, color: Colors.black),
              ),
            ),
          ),
          Flexible(
            child: child,
          ),
        ],
      ),
    );
  }
}