import 'package:flutter/material.dart';
import 'package:todo_app_romavic/resources/colors.dart';

class ButtonContainerComponent extends StatelessWidget {
  const ButtonContainerComponent({
    super.key,
    this.onTap,
    required this.text,
  });

  final GestureTapCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(color: secondaryColor),
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
