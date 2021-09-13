// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartData _$$_ChartDataFromJson(Map<String, dynamic> json) => _$_ChartData(
      price: (json['price'] as num?)?.toDouble() ?? 0,
      changePercent: (json['changePercent'] as num?)?.toDouble() ?? 0,
      changeAmount: (json['changeAmount'] as num?)?.toDouble() ?? 0,
      high: (json['high'] as num?)?.toDouble() ?? 0,
      low: (json['low'] as num?)?.toDouble() ?? 0,
      volumePrimary24h: (json['volumePrimary24h'] as num?)?.toDouble() ?? 0,
      volumeSecondary24h: (json['volumeSecondary24h'] as num?)?.toDouble() ?? 0,
      pointsStartFrom: json['pointsStartFrom'] as String? ?? '',
      points: (json['points'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ChartDataToJson(_$_ChartData instance) =>
    <String, dynamic>{
      'price': instance.price,
      'changePercent': instance.changePercent,
      'changeAmount': instance.changeAmount,
      'high': instance.high,
      'low': instance.low,
      'volumePrimary24h': instance.volumePrimary24h,
      'volumeSecondary24h': instance.volumeSecondary24h,
      'pointsStartFrom': instance.pointsStartFrom,
      'points': instance.points,
    };
