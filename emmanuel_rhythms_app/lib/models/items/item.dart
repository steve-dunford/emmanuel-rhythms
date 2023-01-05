import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_app/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/models/items/schedule_type.dart';
import 'package:emmanuel_rhythms_app/models/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item(
      {required String id,
      required ItemType type,
      required String title,
      required ScheduleType scheduleType,
      String? description,
      String? backgroundImage,
      String? url,
      required List<Tag> tags,
      @TimestampConverter() required DateTime startDate,
      @TimestampConverter() required DateTime endDate,
      List<int>? daysOfWeek}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);

}
