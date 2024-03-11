import 'package:flutter/material.dart';

Future<void> adaptiveDialogComponent(
  BuildContext context, {
  required String title,
  required String agreeLabel,
  required VoidCallback onAgreePressed,
  required String cancelLabel,
  required VoidCallback onCancelPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: title.isNotEmpty ? Text(title) : null,
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: onCancelPressed,
            child: Text(cancelLabel),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: onAgreePressed,
            child: Text(agreeLabel),
          ),
        ],
      );
    },
  );
}
