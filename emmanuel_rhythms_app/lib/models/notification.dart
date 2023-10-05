import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class ELRNotification with _$ELRNotification {
  factory ELRNotification(
      {
        required String id,
        required String text,
        required DateTime timestamp,
        String? title,
        String? parentId}) = _ELRNotification;

  factory ELRNotification.fromJson(Map<String, Object?> json) => _$ELRNotificationFromJson(json);
}