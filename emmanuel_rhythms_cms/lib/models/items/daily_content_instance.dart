import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'daily_content_instance.freezed.dart';
part 'daily_content_instance.g.dart';

@freezed
class DailyContentInstance with _$DailyContentInstance {

  factory DailyContentInstance({
    required String dailyContentInstanceId,
    required String dailyContentId,
    required Item item,
    @TimestampConverter() required DateTime date}) = _DailyContentInstance;

  factory DailyContentInstance.fromJson(Map<String, Object?> json) => _$DailyContentInstanceFromJson(json);
}