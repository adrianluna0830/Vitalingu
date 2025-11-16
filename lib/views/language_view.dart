import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/widgets/custom_selectable_text.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final TextEditingController _wordController = TextEditingController();
  final GlobalKey _bodyKey = GlobalKey();

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language View'),
      ),
      body: Container(
        key: _bodyKey,
        child: Center(
          child: AiSelectableText(bodyKey: _bodyKey, text: 'This is a sample text. Also another sample text.',), 
        ),
      ),
    );
  }
}

class AiSelectableText extends StatefulWidget {
  const AiSelectableText({super.key, required this.bodyKey, required this.text});
  final GlobalKey bodyKey;
  final String text;
  @override
  State<AiSelectableText> createState() => _AiSelectableTextState();
}

class _AiSelectableTextState extends State<AiSelectableText> with SignalsMixin {
  late final customOverlay = createSignal<CustomOverlay?>(null);
  
  void _showOverlay(Widget myWidget) {
    final current = customOverlay.peek();
    if (current != null) {
      current._removeOverlay();
    }
    
    final overlay = CustomOverlay(bodyKey: widget.bodyKey, myWidget: myWidget);
    overlay._showOverlay(context);
    customOverlay.value = overlay;
  }
  
  void _hideOverlay() {
    final current = customOverlay.peek();
    if (current != null) {
      current._removeOverlay();
      customOverlay.value = null;
    }
  }
  
  void _showTranslation(String param1, String param2) => _showOverlay(ResponseOutput(onClose: _hideOverlay));
  
  void _showDoubtInput(String param1, String param2) => _showOverlay(
    DoubtInput(
      onSubmit: () => _showTranslation(param1, param2),
      onClose: _hideOverlay,
    ),
  );
  
  void _showWordInfo(String param1, String param2) => _showOverlay(ResponseOutput(onClose: _hideOverlay));
  
  @override
  Widget build(BuildContext context) {
    return CustomSelectableText(text: widget.text, leftBracket: "<", rightBracket: ">", doubtCallback: _showDoubtInput, translationCallback: _showTranslation, wordInfoCallback: _showWordInfo);
  }
}

class ResponseOutput extends StatelessWidget {
  final VoidCallback onClose;
  
  const ResponseOutput({super.key, required this.onClose});

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
            color: Colors.black.withOpacity(0.1),
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
            onPressed: onClose,
            icon: const Icon(Icons.close),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Container(
                  width: 150.0,
                  height: 16.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoubtInput extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onClose;

  const DoubtInput({
    super.key, 
    required this.onSubmit, 
    required this.onClose,
  });

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
            color: Colors.black.withOpacity(0.1),
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
            onPressed: onClose,
            icon: const Icon(Icons.close),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter your doubt',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onSubmit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class CustomOverlay {
  final GlobalKey bodyKey;
  final Widget myWidget;
  OverlayEntry? _overlayEntry;

  CustomOverlay({required this.bodyKey, required this.myWidget});

  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);

    final renderBox = bodyKey.currentContext?.findRenderObject() as RenderBox?;
    final offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    final size = renderBox?.size ?? Size.zero;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Material(
              color: Colors.transparent,
              child: myWidget,
            ),
          ),
        ],
      ),
    );

    overlay?.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}