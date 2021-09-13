import 'dart:math';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ib_tech_test/ui/line_chart/chart_utils.dart';

void main() {
  group('getChartPoints', () {
    test('Empty list of points', () {
      final points = <double>[];
      final convertedPoints = getChartPoints(
        points,
        const Size(100, 100),
        0,
        10,
      );
      expect(convertedPoints, <Point<double>>[]);
    });

    test('Converting a list of doubles to a list of relative Point', () {
      final points = <double>[2];
      final convertedPoints = getChartPoints(
        points,
        const Size(100, 100),
        0,
        10,
      );
      // TODO calculate the points from the original points and the size
      expect(convertedPoints, [
        const Point(0, 20),
      ]);
    });

    test('Converting a list of doubles to a list of relative Point', () {
      final points = <double>[2, 4, 6, 8, 10, 4, 5];
      final convertedPoints = getChartPoints(
        points,
        const Size(100, 100),
        0,
        10,
      );
      // TODO calculate the points from the original points and the size
      expect(convertedPoints, const [
        Point(0, 20),
        Point(16.666666666666668, 40),
        Point(33.333333333333336, 60),
        Point(50, 80),
        Point(66.66666666666667, 100),
        Point(83.33333333333334, 40),
        Point(100, 50),
      ]);
    });
  });

  // getBezierPath
  // Given a list of doubles, call getBezierPath() and compare against a know
  // bezier curve

  // getGradientFill
  // Draw a straight line across the whole width of a canvas and assert that
  // the gradient is drawn under the line

  // Tests for the chart painter
  // paint labels

  // given a set of specified points, assert that max and min points
  // are drawn in the  correct place, potentially do this via matchesGoldenFile
}
