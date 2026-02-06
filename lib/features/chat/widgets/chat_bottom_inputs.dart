import 'package:flutter/material.dart';

class ChatBottomInputs extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback onChat;
  final bool canType;
  final double spacing;
  final int maxLines;
  
  const ChatBottomInputs({
    super.key,
    required this.onSend,
    required this.onChat,
    required this.canType,
    this.spacing = 11.0,
    this.maxLines = 6,
  });

  @override
  State<ChatBottomInputs> createState() => _ChatBottomInputsState();
}

class _ChatBottomInputsState extends State<ChatBottomInputs> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _textFieldKey = GlobalKey();
  double _initialTextFieldHeight = 60.0; 
  bool _heightCaptured = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _captureInitialHeight();
    });
  }

  void _captureInitialHeight() {
    if (!_heightCaptured) {
      final RenderBox? renderBox = 
          _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null && mounted) {
        setState(() {
          _initialTextFieldHeight = renderBox.size.height;
          _heightCaptured = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
Expanded(
  child: TextField(
    key: _textFieldKey,
    minLines: 1,
    maxLines: widget.maxLines,
    keyboardType: TextInputType.multiline,
    controller: _controller,
    textAlignVertical: TextAlignVertical.center,
    enabled: widget.canType,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: const Color.fromARGB(255, 65, 65, 65),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 12,
      ),
      hintText: "Type your message...",
      hintStyle: const TextStyle(
        color: Colors.white70,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22.0),
        borderSide: BorderSide.none,
      ),
    ),
  ),
),

        SizedBox(width: widget.spacing),
        IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(_initialTextFieldHeight, _initialTextFieldHeight),
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
            fixedSize: Size(_initialTextFieldHeight, _initialTextFieldHeight),
            padding: EdgeInsets.zero,
            backgroundColor:
                widget.canType ? Colors.green : Colors.grey.shade400,
          ),
          icon: const Icon(Icons.chat, color: Colors.black),
          onPressed: widget.canType
              ? () {
                  widget.onChat();
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