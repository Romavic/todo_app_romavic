import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_romavic/resources/screen_measurements.dart';

class InformationComponent extends StatelessWidget {
  const InformationComponent({
    super.key,
    required this.imageSvg,
    required this.text,
  });

  final String imageSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageSvg,
              height: getHeightSizeScreen(context) * 0.1,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
