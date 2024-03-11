import 'package:flutter/material.dart';
import 'package:todo_app_romavic/resources/screen_measurements.dart';

class ButtonTextWithLoaderComponent extends StatelessWidget {
  const ButtonTextWithLoaderComponent({
    super.key,
    required this.state,
    required this.message,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
  });

  final bool state;
  final String message;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: state ? () {} : onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(getWidthSizeScreen(context), 50),
        ),
      ),
      child: state
          ? const Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            )
          : Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(color: Colors.white),
            ),
    );
  }
}
