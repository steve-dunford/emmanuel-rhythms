import 'package:emmanuel_rhythms_cms/models/church.dart';
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
      required bool isPriority,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename,
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      required List<Church> churches,
      required List<Tag> tags}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);

  static Item get defaultItem => Item(
    id: const Uuid().v4(),
    tags: [],
    churches: [Church.emmanuelLurgan, Church.emmanuelPortadown],
    title: '',
    isPriority: false,
    type: ItemType.text,
    usePodcastDetails: true,
  );
}
