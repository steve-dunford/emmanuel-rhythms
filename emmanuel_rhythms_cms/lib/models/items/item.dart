import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item_instance.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item(
      {required String id,
      required ItemType type,
      required String title,
      String? backgroundImage,
      String? url,
      required List<Tag> tags,
      @TimestampConverter() required DateTime startDate,
      @TimestampConverter() required DateTime endDate,
      List<int>? daysOfWeek}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

extension ItemExtensions on Item {
  List<ItemInstance> generateInstances() {
    var currentDate = startDate;
    final instances = List<ItemInstance>.empty();

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      if (daysOfWeek == null ||
          daysOfWeek!.isEmpty ||
          daysOfWeek!.contains(currentDate.weekday)) {
        instances.add(ItemInstance(
            itemInstanceId: const Uuid().v4(), itemId: id, date: currentDate));
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return instances;
  }
}
