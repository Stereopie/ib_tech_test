import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'chart_utils.dart';

/// Paints labels on the given canvas
void paintLabels(Canvas canvas, Size size, List<num> points) {
  final formatter = intl.NumberFormat.currency(symbol: '', decimalDigits: 0);
  const chartTextStyle = TextStyle(fontSize: 11, color: Colors.black87);

  final pointWidth = size.width / points.length;

  final minPainter = TextPainter(
    text: TextSpan(text: formatter.format(points.min), style: chartTextStyle),
    textDirection: TextDirection.ltr,
  )..layout(
      maxWidth: size.width,
    );

  final maxPainter = TextPainter(
    text: TextSpan(text: formatter.format(points.max), style: chartTextStyle),
    textDirection: TextDirection.ltr,
  )..layout(
      maxWidth: size.width,
    );

  // TODO paint labels in the correct height positions
  minPainter.paint(canvas,
      Offset((points.indexOf(points.min)) * pointWidth, size.height * 0.87));
  maxPainter.paint(
      canvas, Offset((points.indexOf(points.max)) * pointWidth, 40));
}

/// Paints a curve and a gradient
class CurvePainter extends CustomPainter {
  /// Curve painter
  CurvePainter(this.points);

  /// A list of points to draw on the chart
  final List<num> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Save the canvas so we can revert the any transformations later
    // Inverse the canvas so the y axis starts from the bottom
    canvas
      ..save()
      ..translate(0, size.height)
      ..scale(1, -1);

    final path = getBezierPath(points, size);

    canvas.drawPath(
      path,
      paint,
    );

    final fillPaint = Paint()
      ..strokeWidth = 0.0
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(colors: [
        Colors.white,
        Colors.orange,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          .createShader(
              Rect.fromLTWH(0, size.height / 5, size.width, size.height * 0.7));

    // Draw the gradient, then restore the canvas so we can draw the labels
    // without the canvas being inverted.
    canvas
      ..drawPath(getGradientFill(path, size, Offset(0, size.height)), fillPaint)
      ..restore();

    paintLabels(canvas, size, points);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
