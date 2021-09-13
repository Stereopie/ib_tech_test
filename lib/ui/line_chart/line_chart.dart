import 'package:flutter/material.dart';

import '../../model/chart_data.dart';
import 'line_chart_painter.dart';

/// Line chart
class LineChart extends StatelessWidget {
  /// Line chart
  const LineChart(this.chartData);

  /// Data we're showing in the line chart
  final ChartData chartData;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DefaultTabController(
            length: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFF646464),
                  ),
                ),
                labelPadding: EdgeInsets.symmetric(vertical: 12),
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Text('1D'),
                  Text('1W'),
                  Text('1M'),
                  Text('1Y'),
                  Text('All'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: CurvePainter(chartData.points),
                ),
                // TODO update with start date and end date from chartData
                const Positioned(
                  left: 15,
                  bottom: 10,
                  child: Text('14 Mar'),
                ),
                const Positioned(
                  right: 15,
                  bottom: 10,
                  child: Text('15 Mar'),
                ),
              ],
            ),
          ),
        ],
      );
}
