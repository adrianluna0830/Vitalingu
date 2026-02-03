import 'package:flutter/material.dart';

class SecretTextField extends StatefulWidget {
  final Function(String value) onChanged;
  final String initialValue;
  final int maxWidth;
  final String? errorMessage;

  const SecretTextField({
    super.key, 
    required this.onChanged, 
    required this.initialValue,
    this.maxWidth = 300,
    this.errorMessage,
  });
  
  @override
  State<SecretTextField> createState() => _SecretTextFieldState();
}

class _SecretTextFieldState extends State<SecretTextField> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  bool isObscured = true;
  
  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue;
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }
  
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorMessage != null;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.maxWidth.toDouble(),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: isObscured,
            decoration: InputDecoration(
              labelText: 'Gemini API Key',
              errorText: widget.errorMessage,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: hasError ? const Color(0xFFB71C1C) : Colors.grey.shade600, // Gris más oscuro
                  width: hasError ? 2 : 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: hasError ? const Color(0xFFB71C1C) : Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFB71C1C),
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFB71C1C),
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                  if (hasFocus)
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        widget.onChanged(controller.text);
                        focusNode.unfocus();
                      },
                    ),
                ],
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}