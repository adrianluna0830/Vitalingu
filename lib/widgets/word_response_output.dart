import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:signals/signals_flutter.dart';

class WordResponseOutput extends StatefulWidget {
  final Signal<Widget?> responseSignal;
  final VoidCallback onClose;
  final double? width;  // Opcional: ancho específico
  final double? height; // Opcional: alto específico

  const WordResponseOutput({
    super.key, 
    required this.responseSignal, 
    required this.onClose,
    this.width,
    this.height,
  });

  @override
  State<WordResponseOutput> createState() => _WordResponseOutputState();
}

class _WordResponseOutputState extends State<WordResponseOutput> {
  @override
  Widget build(BuildContext context) {
    // Si no se proporciona tamaño, usa LayoutBuilder para adaptarse al padre
    return LayoutBuilder(
      builder: (context, constraints) {
        // Usa el tamaño proporcionado o el disponible del padre
        final availableWidth = widget.width ?? 
          (constraints.maxWidth.isFinite ? constraints.maxWidth : MediaQuery.of(context).size.width);
        final availableHeight = widget.height ?? 
          (constraints.maxHeight.isFinite ? constraints.maxHeight : MediaQuery.of(context).size.height * 0.8);
        
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: availableWidth - 32, // Restamos el padding
            height: availableHeight - 32,
            child: Container(
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
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Watch((context) {
                      final response = widget.responseSignal.value;
                      if (response == null) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 16.0,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                height: 16.0,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 150.0,
                                height: 16.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: response,
                        );
                      }
                    }),
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