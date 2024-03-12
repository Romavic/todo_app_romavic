import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleDecoration extends Decoration {
  final Color? topColor;
  final Color? bottomColor;
  final Color? leftColor;
  final Color? rightColor;
  final double borderWidth;

  const CircleDecoration({
    this.topColor,
    this.bottomColor,
    this.leftColor,
    this.rightColor,
    this.borderWidth = 3.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomCircleBorderPainter(
      topColor: topColor,
      bottomColor: bottomColor,
      leftColor: leftColor,
      rightColor: rightColor,
      borderWidth: borderWidth,
    );
  }
}

class _CustomCircleBorderPainter extends BoxPainter {
  final Color? topColor;
  final Color? bottomColor;
  final Color? leftColor;
  final Color? rightColor;
  final double borderWidth;

  _CustomCircleBorderPainter({
    required this.topColor,
    required this.bottomColor,
    required this.leftColor,
    required this.rightColor,
    this.borderWidth = 3.0,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final paint = Paint();

    final radius = rect.shortestSide / 2;

    final center = rect.center;
    paint.color = Colors.transparent;
    canvas.drawCircle(center, radius, paint);

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    const double quarterCircle = math.pi / 2;
    const double startAngle = -math.pi / 4;

    borderPaint.color = topColor ?? Colors.grey.shade600;
    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      quarterCircle,
      false,
      borderPaint,
    );

    borderPaint.color = rightColor ?? Colors.grey.shade600;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + quarterCircle,
      quarterCircle,
      false,
      borderPaint,
    );

    borderPaint.color = bottomColor ?? Colors.grey.shade600;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + 2 * quarterCircle,
      quarterCircle,
      false,
      borderPaint,
    );

    borderPaint.color = leftColor ?? Colors.grey.shade600;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + 3 * quarterCircle,
      quarterCircle,
      false,
      borderPaint,
    );
  }
}
