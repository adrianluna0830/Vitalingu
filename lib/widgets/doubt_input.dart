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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: constraints.maxHeight * 0.3, // 30% of the parent
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // Align close button to the right
                children: [
                  IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(Icons.close),
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
            ),
          ),
        );
      },
    );
  }
}
