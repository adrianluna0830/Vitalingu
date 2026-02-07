import 'package:flutter/material.dart';

class OutlinedButtonTemplate extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isDisabled;

  const OutlinedButtonTemplate({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(14),
          side: BorderSide(
            color: isDisabled
                ? Colors.grey[400]! // Color más suave para el borde cuando está deshabilitado
                : (isSelected ? Colors.deepPurple : Colors.grey[700]!),
            width: 2,
          ),
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.deepPurple : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
