import 'package:flutter/material.dart';

class DoubtInput extends StatefulWidget {
  final Function(String doubt) onSubmit;
  final VoidCallback onClose;

  const DoubtInput({
    super.key,
    required this.onSubmit,
    required this.onClose,
  });

  @override
  State<DoubtInput> createState() => _DoubtInputState();
}

class _DoubtInputState extends State<DoubtInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: widget.onClose,
            icon: const Icon(Icons.close),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter your doubt',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => widget.onSubmit(_controller.text),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
