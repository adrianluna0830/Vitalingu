import 'package:flutter/material.dart';

class ChatBottomInputs extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback onChat;
  final bool canType;
  final InputDecoration textFieldInputDecoration;
  final double spacing;
  final int maxLines;
  
  const ChatBottomInputs({
    super.key,
    required this.onSend,
    required this.onChat,
    required this.canType,
    this.textFieldInputDecoration = const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      isDense: true,
      
    ),
    this.spacing = 10.0,
    this.maxLines = 6,
  });

  @override
  State<ChatBottomInputs> createState() => _ChatBottomInputsState();
}

class _ChatBottomInputsState extends State<ChatBottomInputs> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end, 
      children: [
        Expanded(
          child: TextField(
            minLines: 1, 
            maxLines: widget.maxLines, 
            keyboardType: TextInputType.multiline,
            controller: _controller,
            enabled: widget.canType,
            decoration: widget.textFieldInputDecoration.copyWith(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
          ),
        ),
        SizedBox(width: widget.spacing),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor:
                widget.canType ? Colors.green : Colors.grey.shade400,
          ),
          icon: const Icon(Icons.send, color: Colors.black),
          onPressed: widget.canType
              ? () {
                  widget.onSend(_controller.text);
                  _controller.clear();
                }
              : null,
        ),
        SizedBox(width: widget.spacing),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor:
                widget.canType ? Colors.green : Colors.grey.shade400,
          ),
          icon: const Icon(Icons.chat, color: Colors.black),
          onPressed: widget.canType
              ? () {
                  widget.onChat(); // Corregido: usaba onSend en lugar de onChat
                }
              : null,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}