import 'package:flutter/material.dart';

class MessageInputBottomBarWidget extends StatefulWidget {
  final Function(String) onSend;
  final bool canType;
  final double borderRadius;

  const MessageInputBottomBarWidget({
    super.key,
    required this.onSend,
    required this.canType,
    this.borderRadius = 30.0,
  });

  @override
  State<MessageInputBottomBarWidget> createState() =>
      _MessageInputBottomBarWidgetState();
}

class _MessageInputBottomBarWidgetState
    extends State<MessageInputBottomBarWidget> {
  final TextEditingController _controller = TextEditingController();
  static const double _height = 48.0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: widget.canType,
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: widget.canType ? Colors.black : Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: widget.canType
                    ? () {
                        widget.onSend(_controller.text);
                        _controller.clear();
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
