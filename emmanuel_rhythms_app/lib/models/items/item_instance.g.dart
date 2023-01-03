// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemInstance _$$_ItemInstanceFromJson(Map<String, dynamic> json) =>
    _$_ItemInstance(
      itemInstanceId: json['itemInstanceId'] as String,
      itemId: json['itemId'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$$_ItemInstanceToJson(_$_ItemInstance instance) =>
    <String, dynamic>{
      'itemInstanceId': instance.itemInstanceId,
      'itemId': instance.itemId,
      'date': const TimestampConverter().toJson(instance.date),
    };
