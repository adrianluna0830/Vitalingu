import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:signals/signals_flutter.dart';

class TextResponseOutputWidget extends StatelessWidget {
  final VoidCallback onClose;
  final Signal<String?> responseSignal;

  const TextResponseOutputWidget(
      {super.key, required this.onClose, required this.responseSignal});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: constraints.maxHeight * 0.3, // 36% del padre
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
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
              padding: const EdgeInsets.only(bottom: 10.0),
                      onPressed: onClose,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Watch((context) {
                    final response = responseSignal.value;
                    if (response == null) {
                      return Shimmer.fromColors(
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
                      return SingleChildScrollView(child: Text(response));
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
