import 'package:emmanuel_rhythms_app/models/church.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
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
}
