import 'dart:math';
import 'package:flutter/material.dart';

class ArcIndicator extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;
  ArcIndicator(
      {required this.bgColor,
      required this.lineColor,
      required this.percent,
      required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;
    Paint completedLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), 2.5,
        2 * pi * 0.5, false, bgLine);
    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), 2.5,
        sweepAngle, false, completedLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
