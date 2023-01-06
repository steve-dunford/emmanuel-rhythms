import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/common/converters/timestamp_converter.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content_instance.dart';
import 'package:emmanuel_rhythms_cms/models/items/schedule_type.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
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
      required List<Tag> tags}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);

  static Item get defaultItem => Item(
    id: const Uuid().v4(),
    tags: [],
    title: '',
    type: ItemType.video,
  );
}
