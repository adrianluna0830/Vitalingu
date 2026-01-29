import 'package:flutter/material.dart';

class MessageInputBottomBarWidget extends StatefulWidget {
  final Function(String) onSend;
  final bool canType;

  const MessageInputBottomBarWidget({super.key, required this.onSend, required this.canType});

  @override
  State<MessageInputBottomBarWidget> createState() => _MessageInputBottomBarWidgetState();
  
 
}

class _MessageInputBottomBarWidgetState extends State<MessageInputBottomBarWidget> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            enabled: widget.canType,
            decoration: InputDecoration(
              hintText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: widget.canType ? Colors.black : Colors.grey,
            shape: BoxShape.circle, 
          ),
          
          child: IconButton(
            icon: const Icon(Icons.send, color: Colors.white), 
            onPressed: widget.canType 
                ? () {
                    widget.onSend(_controller.text);
                    _controller.clear();
                  }
                : null,
          ),
        ),
      ],
    );
  }
}