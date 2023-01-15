import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/scripture_reference.dart';
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
      List<ScriptureReference>? scriptureReferences,
      required List<Tag> tags}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);

  static Item get defaultItem => Item(
    id: const Uuid().v4(),
    tags: [],
    title: '',
    type: ItemType.video,
  );
}
