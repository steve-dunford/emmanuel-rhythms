import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  factory Notification(
      {required String id,
      required String title,
      required String text,
      @TimestampConverter() required DateTime timestamp}) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
