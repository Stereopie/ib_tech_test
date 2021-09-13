import 'dart:convert';

import 'package:http/http.dart';

import '../model/chart_data.dart';

/// Fetches the chart points from the given endpoint
Future<ChartData> fetchChartPoints(String endpoint) async {
  final response = await get(Uri.parse(endpoint), headers: {
    'x-mobile-version': '0.1',
  });

  // TODO handle errors

  return ChartData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}
