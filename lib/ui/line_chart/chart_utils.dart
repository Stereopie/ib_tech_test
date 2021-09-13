import 'dart:math';
import 'dart:ui';
import 'package:collection/src/iterable_extensions.dart';

/// Get a list of relative points on a canvas from a given list of
/// points
List<Point<double>> getChartPoints(
    List<num> points, Size size, num minHeight, num chartRange) {
  final pointWidth = size.width / (points.length > 1 ? points.length - 1 : 1);

  var count = 0;
  return points.map((point) {
    final pointHeight = size.height * ((point - minHeight) / chartRange);
    return Point(count++ * pointWidth, pointHeight);
  }).toList();
}

/// Get a bezier path from a list of points
Path getBezierPath(List<num> points, Size size) {
  // Adding a small size increase so the chart doesn't take up full canvas
  final chartRange = points.max * 1.008 - points.min * 0.992;
  final minHeight = points.min * 0.992;

  final path = Path();

  final chartPoints = getChartPoints(points, size, minHeight, chartRange);
  const smoothingFactor = 4;

  path.moveTo(chartPoints[0].x, chartPoints[0].y);
  for (var i = 1; i < chartPoints.length - 2; i++) {
    final previousPoint = chartPoints[i - 1];
    final nextPoint = chartPoints[i + 1];
    final controllerPoint1 = Point(
      chartPoints[i].x + (nextPoint.x - previousPoint.x) / smoothingFactor,
      chartPoints[i].y + (nextPoint.y - previousPoint.y) / smoothingFactor,
    );
    final controllerPoint2 = Point(
      nextPoint.x - (chartPoints[i + 2].x - chartPoints[i].x) / smoothingFactor,
      nextPoint.y - (chartPoints[i + 2].y - chartPoints[i].y) / smoothingFactor,
    );

    path.cubicTo(controllerPoint1.x, controllerPoint1.y, controllerPoint2.x,
        controllerPoint2.y, nextPoint.x, nextPoint.y);
  }

  return path;
}

/// Get's a gradient fill below a specified [Path]
Path getGradientFill(Path path, Size size, Offset startPoint) {
  // Draw a line from the bottom of the chart to the offset of the bezier
  // curve so we can fill below the chart
  final fillPath = Path()
    ..addPath(path, Offset.zero)
    ..relativeLineTo(4, 0)
    ..lineTo(size.width + 8, 0)
    ..lineTo(0, 0)
    ..lineTo(startPoint.dx - 8, startPoint.dy);

  return fillPath;
}
