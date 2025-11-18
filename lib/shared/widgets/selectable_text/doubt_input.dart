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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints(maxHeight: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter your doubt',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => widget.onSubmit(_controller.text),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

