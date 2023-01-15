import 'package:emmanuel_rhythms_app/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/schedule_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'daily_content.freezed.dart';
part 'daily_content.g.dart';

@freezed
class DailyContent with _$DailyContent {
  factory DailyContent({
    required String dailyContentId,
    required ScheduleType scheduleType,
    @TimestampConverter() required DateTime startDate,
    @TimestampConverter() required DateTime endDate,
    List<int>? daysOfWeek,
    required Item item,
  }) = _DailyContent;

  factory DailyContent.fromJson(Map<String, Object?> json) =>
      _$DailyContentFromJson(json);


}