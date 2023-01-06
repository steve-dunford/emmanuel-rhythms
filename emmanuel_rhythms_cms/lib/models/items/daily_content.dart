import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content_instance.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/schedule_type.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  static DailyContent get defaultContent => DailyContent(
      dailyContentId: const Uuid().v4(),
      startDate: DateTime.now().atMidnight,
      endDate: DateTime.now().atMidnight,
      scheduleType: ScheduleType.oneDay,
      item: Item.defaultItem);
}

extension DailyContentExtensions on DailyContent {
  List<DailyContentInstance> generateInstances() {
    var currentDate = startDate;
    var instances = List<DailyContentInstance>.empty();

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      if (daysOfWeek == null ||
          daysOfWeek!.isEmpty ||
          daysOfWeek!.contains(currentDate.weekday)) {
        final instance = DailyContentInstance(
            dailyContentInstanceId: const Uuid().v4(),
            item: item.copyWith(),
            date: currentDate,
            dailyContentId: dailyContentId);

        instances = [...instances, instance];
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return instances;
  }
}
