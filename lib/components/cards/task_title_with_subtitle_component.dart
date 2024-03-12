import 'package:flutter/material.dart';

class TaskTitleWithSubtitleComponent extends StatelessWidget {
  const TaskTitleWithSubtitleComponent({
    super.key,
    required this.title,
    required this.details,
    required this.isDone,
    this.onTap,
  });

  final String title;
  final String details;
  final bool isDone;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              details,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
