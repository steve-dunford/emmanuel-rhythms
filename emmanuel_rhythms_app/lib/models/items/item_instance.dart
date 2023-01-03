import 'package:emmanuel_rhythms_app/common/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'item_instance.freezed.dart';
part 'item_instance.g.dart';

@freezed
class ItemInstance with _$ItemInstance {
  factory ItemInstance({
    required String itemInstanceId,
    required String itemId,
    @TimestampConverter() required DateTime date}) = _ItemInstance;

  factory ItemInstance.fromJson(Map<String, Object?> json) => _$ItemInstanceFromJson(json);
}