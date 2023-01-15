// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyContent _$$_DailyContentFromJson(Map<String, dynamic> json) =>
    _$_DailyContent(
      dailyContentId: json['dailyContentId'] as String,
      scheduleType: $enumDecode(_$ScheduleTypeEnumMap, json['scheduleType']),
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp),
      daysOfWeek:
          (json['daysOfWeek'] as List<dynamic>?)?.map((e) => e as int).toList(),
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DailyContentToJson(_$_DailyContent instance) =>
    <String, dynamic>{
      'dailyContentId': instance.dailyContentId,
      'scheduleType': _$ScheduleTypeEnumMap[instance.scheduleType]!,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'daysOfWeek': instance.daysOfWeek,
      'item': instance.item.toJson(),
    };

const _$ScheduleTypeEnumMap = {
  ScheduleType.oneDay: 'oneDay',
  ScheduleType.everyDay: 'everyDay',
  ScheduleType.daysOfWeek: 'daysOfWeek',
};
