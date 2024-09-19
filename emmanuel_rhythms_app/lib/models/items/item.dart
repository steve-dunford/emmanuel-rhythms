import 'package:emmanuel_rhythms_app/common/converters/item_type_converter.dart';
import 'package:emmanuel_rhythms_app/models/download.dart';
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
      @ItemTypeConverter() required ItemType type,
      required String title,
      required bool isPriority,
      int? sortOrder,
      String? description,
      String? backgroundImage,
      String? url,
      String? downloadFilename, //Deprecated, use downloads property
      bool? usePodcastDetails,
      List<ScriptureReference>? scriptureReferences,
      List<Download>? downloads,
      List<String>? churchesV2,
      required List<String> churches,
      required List<Tag> tags}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

const int maxInteger = 0x7FFFFFFFFFFFFFFF;

extension ItemExtensions on Item {
  int get resolvedSortOrder => isPriority
      ? -1
      : sortOrder != null
          ? sortOrder!
          : maxInteger;
}
