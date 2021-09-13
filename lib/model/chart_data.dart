import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_data.freezed.dart';
part 'chart_data.g.dart';

/// Chart values
@freezed
class ChartData with _$ChartData {
  /// Chart values
  factory ChartData({
    @Default(0) double price,
    @Default(0) double changePercent,
    @Default(0) double changeAmount,
    @Default(0) double high,
    @Default(0) double low,
    @Default(0) double volumePrimary24h,
    @Default(0) double volumeSecondary24h,
    @Default('') String pointsStartFrom,
    @Default(<double>[]) List<double> points,
  }) = _ChartData;

  /// Generate model from json
  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);
}
