import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ChatInputBar extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback onChat;
  final VoidCallback onMic;
  final bool canType;
  final double spacing;
  final int maxLines;
  final VoidCallback? onFocusStarted;

  const ChatInputBar({
    super.key,
    required this.onSend,
    required this.onChat,
    required this.onMic,
    required this.canType,
    this.spacing = 11.0,
    this.maxLines = 6,
    this.onFocusStarted,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
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
    _controller.addListener(_onTextChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      widget.onFocusStarted?.call();
    }
    setState(() {});
  }

  void _onTextChange() {
    final hasText = _controller.text.trim().isNotEmpty;
    if (_hasText != hasText) {
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
    final showSendIcon = _hasText || _focusNode.hasFocus;
    final showChatPanel = !_focusNode.hasFocus;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TapRegion(
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            child: _MessageTextField(
              textFieldKey: _textFieldKey,
              focusNode: _focusNode,
              controller: _controller,
              canType: widget.canType,
              maxLines: widget.maxLines,
            ),
          ),
        ),
        SizedBox(width: widget.spacing),
        _SendOrMicButton(
          textEnabled: showSendIcon,
          buttonSize: _initialTextFieldHeight,
          canType: widget.canType,
          onSend: () {
            widget.onSend(_controller.text);
            _controller.clear();
          },
          onMic: widget.onMic,
        ),
        if (showChatPanel) ...[
          SizedBox(width: widget.spacing),
          _ChatPanelToggleButton(
            buttonSize: _initialTextFieldHeight,
            canType: widget.canType,
            onChat: widget.onChat,
          ),
        ],
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.removeListener(_onTextChange);
    _focusNode.dispose();
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
  final bool textEnabled;
  final double buttonSize;
  final bool canType;
  final VoidCallback onSend;
  final VoidCallback onMic;

  const _SendOrMicButton({
    required this.textEnabled,
    required this.buttonSize,
    required this.canType,
    required this.onSend,
    required this.onMic,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: Size(buttonSize, buttonSize),
        padding: EdgeInsets.zero,
        backgroundColor: canType ? Colors.green : Colors.grey.shade400,
      ),
      icon: Icon(
        textEnabled ? Icons.send : Icons.mic,
        color: Colors.black,
        size: textEnabled ? 24 : 28,
      ),
      onPressed: canType
          ? () {
              if (textEnabled) {
                onSend();
              } else {
                onMic();
              }
            }
          : null,
    );
  }
}

class _ChatPanelToggleButton extends StatelessWidget {
  final double buttonSize;
  final bool canType;
  final VoidCallback onChat;

  const _ChatPanelToggleButton({
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