// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
// import 'package:signals/signals_flutter.dart';
// import 'package:vitalingu/core/di/injection.dart';
// import 'package:vitalingu/core/models/language/learning_unit.dart';
// import 'package:vitalingu/core/models/markdown_style.dart';
// import 'package:vitalingu/features/learning/view_models/unit_explanation_page_view_model.dart';

// @RoutePage()
// class UnitExplanationPage extends StatefulWidget {
//   final LearningUnit unit;
//   const UnitExplanationPage({super.key, required this.unit});

//   @override
//   State<UnitExplanationPage> createState() => _UnitExplanationPageState();
// }

// class _UnitExplanationPageState extends State<UnitExplanationPage> {
//   final vm = getIt<UnitExplanationPageViewModel>();

//   @override
//   void initState() {
//     super.initState();
//     vm.fetchExplanation(widget.unit);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final future = vm.explanation.watch(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explicación '),
//         actions: [
//           if (vm.explanation.value.hasValue)
//             Row(
//               children: [
//                 IconButton(onPressed: null, icon: const Icon(Icons.refresh)),
//                 IconButton(onPressed: null, icon: const Icon(Icons.fact_check)),
//                 IconButton(onPressed: null, icon: const Icon(Icons.help)),
//               ],
//             ),
//         ],
//       ),
//       body: Watch((context) {
//         return vm.explanation.value.map(
//           data: (explanation) => Markdown(
//             selectable: true,
//             data: explanation,
//             styleSheet: customMarkdownStyleSheet(context),
//           ),
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (error, stackTrace) => Center(child: Text('Error: $error')),
//         );
//       }),
//     );
//   }
// }
