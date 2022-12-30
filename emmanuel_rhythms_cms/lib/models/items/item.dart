import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
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
      String? description,
      String? backgroundImage,
      String? url,
      required List<Tag> tags,
      @TimestampConverter() required DateTime startDate,
      @TimestampConverter() required DateTime endDate,
      List<int>? daysOfWeek}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);

  static Item get defaultItem => Item(
    id: const Uuid().v4(),
    startDate: DateTime.now().atMidnight,
    endDate: DateTime.now().atMidnight,
    tags: [],
    title: '',
    type: ItemType.video,
  );
}

extension ItemExtensions on Item {
  List<ItemInstance> generateInstances() {
    var currentDate = startDate;
    var instances = List<ItemInstance>.empty();

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      if (daysOfWeek == null ||
          daysOfWeek!.isEmpty ||
          daysOfWeek!.contains(currentDate.weekday)) {

        final instance = ItemInstance(
            itemInstanceId: const Uuid().v4(), itemId: id, date: currentDate);

        instances = [...instances, instance];
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return instances;
  }
}
