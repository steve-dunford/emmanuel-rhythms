// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_content_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyContentInstance _$$_DailyContentInstanceFromJson(
        Map<String, dynamic> json) =>
    _$_DailyContentInstance(
      dailyContentInstanceId: json['dailyContentInstanceId'] as String,
      dailyContentId: json['dailyContentId'] as String,
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$$_DailyContentInstanceToJson(
        _$_DailyContentInstance instance) =>
    <String, dynamic>{
      'dailyContentInstanceId': instance.dailyContentInstanceId,
      'dailyContentId': instance.dailyContentId,
      'item': instance.item.toJson(),
      'date': const TimestampConverter().toJson(instance.date),
    };
