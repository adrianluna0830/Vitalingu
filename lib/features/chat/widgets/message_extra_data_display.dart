import 'package:flutter/material.dart';

class MessageExtraDataDisplay extends StatelessWidget {
  final Widget child;
  final VoidCallback onClose;
  const MessageExtraDataDisplay({super.key, required this.child, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: double.infinity,
      height: 400.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
              child: IconButton(onPressed: onClose, icon: Icon(Icons.close)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
