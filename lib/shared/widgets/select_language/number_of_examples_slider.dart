import 'package:flutter/material.dart';

class NumberOfExamplesSlider extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final TextStyle? titleStyle;

  const NumberOfExamplesSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 10,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Number of Examples', style: titleStyle),
      subtitle: Slider(
        value: value.toDouble(),
        min: min.toDouble(),
        max: max.toDouble(),
        divisions: max - min,
        label: value.toString(),
        onChanged: (val) => onChanged(val.toInt()),
      ),
    );
  }
}

