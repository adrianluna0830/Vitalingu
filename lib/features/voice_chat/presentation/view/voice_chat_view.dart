// views/voice_chat_view.dart

import 'package:align_positioned/align_positioned.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart'; // Asegúrate de importar signals_flutter
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/features/voice_chat/presentation/view_model/voice_chat_view_model.dart';
import 'package:vitalingu/shared/widgets/voice_chat/circular_info_button.dart';
import 'package:vitalingu/shared/widgets/selectable_text/collapsible_info_panel.dart';
import 'package:vitalingu/shared/widgets/voice_chat/animated_voice_button.dart';

@RoutePage()
class VoiceChatView extends StatelessWidget {
   VoiceChatView({super.key});

  final VoiceChatViewModel viewModel = getIt<VoiceChatViewModel>();

  static const animDuration = Duration(milliseconds: 250);
  static const buttonPanelGap = 20.0;
  static const containerMargin = 16.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final panelHeight = screenSize.height * 0.50;

    final bool isPanelOpen = viewModel.showInfoPanel.watch(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Voice Chat')),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: Text(
                "Contenido de la vista (si lo hay)",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            _buildInfoPanel(panelHeight, screenSize.width, isPanelOpen),
            _buildInfoButton(isPanelOpen),
            _buildVoiceRecorderButton(panelHeight, isPanelOpen),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoPanel(
      double panelHeight, double screenWidth, bool isPanelOpen) {
    return AnimatedAlignPositioned(
      duration: animDuration,
      curve: Curves.easeOut,
      alignment: Alignment.bottomCenter,
      dy: isPanelOpen ? -containerMargin : panelHeight + containerMargin,
      childHeight: panelHeight,
      child: SizedBox(
        width: screenWidth - (containerMargin * 2),
        child: CollapsibleInfoPanel(
          onClose: viewModel.closeInfoPanel,
        ),
      ),
    );
  }

  Widget _buildInfoButton(bool isPanelOpen) {
    return AnimatedAlignPositioned(
      duration: animDuration,
      curve: Curves.easeOut,
      alignment: Alignment.bottomLeft,
      dx: isPanelOpen ? -75 : 40,
      dy: -20,
      childWidth: 55,
      childHeight: 55,
      child: CircularInfoButton(
        icon: Icons.info_outline,
        onTap: viewModel.openInfoPanel,
      ),
    );
  }

  Widget _buildVoiceRecorderButton(double panelHeight, bool isPanelOpen) {
    return AnimatedAlignPositioned(
      duration: animDuration,
      curve: Curves.easeOut,
      alignment: Alignment.bottomCenter,
      dy: isPanelOpen
          ? -(panelHeight + buttonPanelGap + containerMargin)
          : -(buttonPanelGap + containerMargin),
      childWidth: 90,
      childHeight: 90,
      child: Watch(
        (context) => AnimatedVoiceButton(
          isCircle: viewModel.isCircle.value,
          onTap: viewModel.toggleShape,
        ),
      ),
    );
  }
}

