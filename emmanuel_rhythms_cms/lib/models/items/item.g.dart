// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      scheduleType: $enumDecode(_$ScheduleTypeEnumMap, json['scheduleType']),
      description: json['description'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      url: json['url'] as String?,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => $enumDecode(_$TagEnumMap, e))
          .toList(),
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp),
      daysOfWeek:
          (json['daysOfWeek'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'scheduleType': _$ScheduleTypeEnumMap[instance.scheduleType]!,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'url': instance.url,
      'tags': instance.tags.map((e) => _$TagEnumMap[e]!).toList(),
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'daysOfWeek': instance.daysOfWeek,
    };

const _$ItemTypeEnumMap = {
  ItemType.video: 'video',
  ItemType.scripture: 'scripture',
  ItemType.podcast: 'podcast',
};

const _$ScheduleTypeEnumMap = {
  ScheduleType.oneDay: 'oneDay',
  ScheduleType.everyDay: 'everyDay',
  ScheduleType.daysOfWeek: 'daysOfWeek',
};

const _$TagEnumMap = {
  Tag.emmanuelLurgan: 'emmanuelLurgan',
  Tag.emmanuelPortadown: 'emmanuelPortadown',
};
