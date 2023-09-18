// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ELRNotification _$$_ELRNotificationFromJson(Map<String, dynamic> json) =>
    _$_ELRNotification(
      id: json['id'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      title: json['title'] as String?,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$$_ELRNotificationToJson(_$_ELRNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'timestamp': instance.timestamp.toIso8601String(),
      'title': instance.title,
      'parentId': instance.parentId,
    };
