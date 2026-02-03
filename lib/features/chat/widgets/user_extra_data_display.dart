import 'package:flutter/material.dart';

class UserExtraDataDisplay extends StatefulWidget {
  const UserExtraDataDisplay({super.key});

  @override
  State<UserExtraDataDisplay> createState() => _UserExtraDataDisplayState();
}

class _UserExtraDataDisplayState extends State<UserExtraDataDisplay> {
  final PageController _pageController = PageController();
  String _selectedOption = 'Option1';

  void _onSegmentChanged(String newSelection) {
    setState(() {
      _selectedOption = newSelection;
      final pageIndex = newSelection == 'Option1' ? 0 : 1;
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedOption = index == 0 ? 'Option1' : 'Option2';
              });
            },
            children: const [
              Center(child: Text('Page for Option 1')),
              Center(child: Text('Page for Option 2')),
            ],
          ),
        ),
        SegmentedButton<String>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(value: 'Option1', label: Text('Grammar')),
            ButtonSegment(value: 'Option2', label: Text('Fluency')),
          ],
          selected: {_selectedOption},
          onSelectionChanged: (Set<String> newSelection) {
            _onSegmentChanged(newSelection.first);
          },
        ),
      ],
    );
  }
}
