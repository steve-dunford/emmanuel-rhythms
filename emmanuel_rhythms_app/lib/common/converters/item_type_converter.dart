import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ItemTypeConverter extends JsonConverter<ItemType, String> {

  const ItemTypeConverter();

  @override
  ItemType fromJson(String json) {
    final type = ItemType.values.firstWhereOrNull((it) => it.name == json);

    return type ?? ItemType.unknown;
  }

  @override
  String toJson(ItemType object) {
    return object.name;
  }
}