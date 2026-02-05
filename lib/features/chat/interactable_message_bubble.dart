// import 'package:flutter/material.dart';
// import 'package:vitalingu/features/chat/message_bubble.dart';

// class InteractableMessageBubble extends StatelessWidget {
//   final VoidCallback onTap;
//   final Widget child;
//   final double messageMaxWidthRatio;
//   final double messageMinWidthRatio;
//   final double triangleWidthRatio;
//   final double triangleHeightRatio;
//   final double borderRadius;
//   final BubbleInnerDesignAlignment alignment;
//   final Color backgroundColor;

//   const InteractableMessageBubble({
//     super.key,
//     required this.onTap,
//     required this.child,
//     this.messageMaxWidthRatio = 0.50,
//     this.messageMinWidthRatio = 0.2,
//     this.triangleWidthRatio = 0.2,
//     this.triangleHeightRatio = 0.5,
//     this.borderRadius = 22.0,
//     this.alignment = BubbleInnerDesignAlignment.left,
//     this.backgroundColor = Colors.green,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Ink(
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(borderRadius),
//           splashColor: Colors.black.withOpacity(0.1),
//           highlightColor: Colors.black.withOpacity(0.05),
//           hoverColor: Colors.black.withOpacity(0.05),
//           child: MessageBubble(
//             messageMaxWidthRatio: messageMaxWidthRatio,
//             messageMinWidthRatio: messageMinWidthRatio,
//             triangleWidthRatio: triangleWidthRatio,
//             triangleHeightRatio: triangleHeightRatio,
//             borderRadius: borderRadius,
//             alignment: alignment,
//             backgroundColor: backgroundColor,
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }