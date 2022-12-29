import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/repositories/item_repository.dart';
import 'package:flutter/material.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final ItemRepository _itemRepository;

  Item item;
  ScheduleType scheduleType = ScheduleType.oneDay;

  ItemDetailsViewModel(this._itemRepository, this.item);

  List<ItemTypeOption> get itemTypeOptions =>
    ItemType.values.map((it) => ItemTypeOption(it, it.displayName)).toList();


  setItemType(ItemTypeOption option) {
    item = item.copyWith(type: option.itemType);
    notifyListeners();
  }

  List<ScheduleTypeOption> get scheduleTypeOptions =>
  [
    ScheduleTypeOption(ScheduleType.oneDay, 'Single Day'),
    ScheduleTypeOption(ScheduleType.everyDay, 'Every Day'),
    ScheduleTypeOption(ScheduleType.daysOfWeek, 'Days of Week'),
  ];

  setScheduleType(ScheduleTypeOption? option) {
    scheduleType = option?.scheduleType ?? ScheduleType.oneDay;
    notifyListeners();
  }


  Future<void> save() {
    return _itemRepository.upsertItem(item);
  }
}

class ItemTypeOption {
  final ItemType itemType;
  final String displayName;

  ItemTypeOption(this.itemType, this.displayName);

}

enum ScheduleType {
  oneDay,
  everyDay,
  daysOfWeek
}

class ScheduleTypeOption {
  final ScheduleType scheduleType;
  final String displayName;

  ScheduleTypeOption(this.scheduleType, this.displayName);
}