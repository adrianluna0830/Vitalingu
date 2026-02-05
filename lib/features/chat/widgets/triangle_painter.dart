import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool isLeft;
  TrianglePainter({required this.color, required this.isLeft});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    
    if (isLeft) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, 0);
    } else {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
