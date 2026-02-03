import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:vitalingu/core/di/injection.dart';
import 'package:vitalingu/core/models/error_handler.dart';
import 'package:vitalingu/core/router/app_router.dart';

class ErrorDisplayer extends StatefulWidget {
  
  final Widget child;
  const ErrorDisplayer({super.key, required this.child});

  @override
  State<ErrorDisplayer> createState() => _ErrorDisplayerState();
}

class _ErrorDisplayerState extends State<ErrorDisplayer> {
  final ErrorHandler _errorNotifier = getIt<ErrorHandler>();

  void showErrorDialog(Exception error) {
    final context = getIt<AppRouter>().navigatorKey.currentContext;
    if (context != null) {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return errorDialogWidget(dialogContext, 'Error', error.toString(), 'Accept');
        },
      );
    }
  }

  Widget errorDialogWidget(BuildContext context, String dialogTitle, String errorMessage, String acceptButtonText) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () { _errorNotifier.goToHome(); Navigator.of(context).pop(); },
          child: Text(acceptButtonText),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final error = _errorNotifier.errorSignal.watch(context);
    if (error != null) {
      // Defer the dialog show to the next frame to ensure the build phase is complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
         showErrorDialog(error);
      });
    }
    return widget.child;
  }
}
