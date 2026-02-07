import 'package:flutter/material.dart';

class ChatBottomInputs extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback onChat;
  final VoidCallback onMic; // New callback for microphone action
  final bool canType;
  final double spacing;
  final int maxLines;
  final ValueChanged<bool>? onFocusChanged;

  const ChatBottomInputs({
    super.key,
    required this.onSend,
    required this.onChat,
    required this.onMic, // Request microphone callback
    required this.canType,
    this.spacing = 11.0,
    this.maxLines = 6,
    this.onFocusChanged,
  });

  @override
  State<ChatBottomInputs> createState() => _ChatBottomInputsState();
}

class _ChatBottomInputsState extends State<ChatBottomInputs> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _textFieldKey = GlobalKey();
  double _initialTextFieldHeight = 60.0;
  bool _heightCaptured = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _captureInitialHeight();
    });
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChanged);
  }

  void _onFocusChange() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
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
          child: _MessageTextField(
            textFieldKey: _textFieldKey,
            focusNode: _focusNode,
            controller: _controller,
            canType: widget.canType,
            maxLines: widget.maxLines,
          ),
        ),
        SizedBox(width: widget.spacing),
        _SendOrMicButton(
          hasText: _hasText,
          buttonSize: _initialTextFieldHeight,
          canType: widget.canType,
          onSend: () {
            widget.onSend(_controller.text);
            _controller.clear();
          },
          onMic: widget.onMic, // Pass microphone callback
          sendIconSize: 24.0, // Default size for send icon
          micIconSize: 24.0,  // Default size for mic icon
          animationDuration: const Duration(milliseconds: 150), // Default value
        ),
        SizedBox(width: widget.spacing),
        _ChatButton(
          buttonSize: _initialTextFieldHeight,
          canType: widget.canType,
          onChat: widget.onChat,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }
}

class _MessageTextField extends StatelessWidget {
  final GlobalKey textFieldKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool canType;
  final int maxLines;

  const _MessageTextField({
    required this.textFieldKey,
    required this.focusNode,
    required this.controller,
    required this.canType,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: textFieldKey,
      focusNode: focusNode,
      minLines: 1,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      enabled: canType,
      style: const TextStyle(color: Colors.white, fontSize: 17),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color.fromARGB(255, 65, 65, 65),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 12,
        ),
        hintText: "Type your message...",
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _SendOrMicButton extends StatelessWidget {
  final bool hasText;
  final double buttonSize;
  final bool canType;
  final VoidCallback onSend;
  final VoidCallback onMic;
  final double sendIconSize;
  final double micIconSize;
  final Duration animationDuration; 

  const _SendOrMicButton({
    required this.hasText,
    required this.buttonSize,
    required this.canType,
    required this.onSend,
    required this.onMic,
    this.sendIconSize = 18.0,
    this.micIconSize = 28.0,
    this.animationDuration = const Duration(milliseconds: 125),
  });

  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: Size(buttonSize, buttonSize),
        padding: EdgeInsets.zero,
        backgroundColor: canType ? Colors.green : Colors.grey.shade400,
      ),
      icon: AnimatedSwitcher(
        duration: animationDuration, // Use the new parameter
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: Icon(
          hasText ? Icons.send : Icons.mic,
          key: ValueKey<bool>(hasText), // Clave única para cada icono
          color: Colors.black,
          size: hasText ? sendIconSize : micIconSize, // Tamaño dinámico
        ),
      ),
      onPressed: canType
          ? () {
              if (hasText) {
                onSend();
              } else {
                onMic();
              }
            }
          : null,
    );
  }
}


class _ChatButton extends StatelessWidget {
  final double buttonSize;
  final bool canType;
  final VoidCallback onChat;

  const _ChatButton({
    required this.buttonSize,
    required this.canType,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: Size(buttonSize, buttonSize),
        padding: EdgeInsets.zero,
        backgroundColor: canType ? Colors.green : Colors.grey.shade400,
      ),
      icon: const Icon(Icons.chat, color: Colors.black),
      onPressed: canType ? onChat : null,
    );
  }
}
