import 'dart:typed_data';

import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/repositories/file_repository.dart';
import 'package:emmanuel_rhythms_cms/repositories/item_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final ItemRepository _itemRepository;
  final FileRepository _fileRepository;

  Item item;
  ScheduleType _scheduleType = ScheduleType.oneDay;
  bool isSettingImage = false;
  bool isSaving = false;

  ItemDetailsViewModel(this._itemRepository, this._fileRepository, this.item);

  List<ItemTypeOption> itemTypeOptions =
      ItemType.values.map((it) => ItemTypeOption(it, it.displayName)).toList();

  ItemTypeOption get selectedItemType =>
    itemTypeOptions.firstWhere((it) => it.itemType == item.type);

  setItemType(ItemTypeOption? option) {
    item = item.copyWith(type: option?.itemType ?? ItemType.video);
    notifyListeners();
  }

  List<ScheduleTypeOption> scheduleTypeOptions = [
    ScheduleTypeOption(ScheduleType.oneDay, 'Single Day'),
    ScheduleTypeOption(ScheduleType.everyDay, 'Every Day'),
    ScheduleTypeOption(ScheduleType.daysOfWeek, 'Days of Week'),
  ];

  ScheduleTypeOption get scheduleType =>
      scheduleTypeOptions.firstWhere((e) => e.scheduleType == _scheduleType);

  setScheduleType(ScheduleTypeOption? option) {
    _scheduleType = option?.scheduleType ?? ScheduleType.oneDay;

    if (_scheduleType == ScheduleType.oneDay) {
      item = item.copyWith(endDate: item.startDate);
    }
    if (_scheduleType != ScheduleType.daysOfWeek) {
      item = item.copyWith(daysOfWeek: null);
    }
    notifyListeners();
  }

  setStartDate(DateTime date) {
    item = item.copyWith(
        startDate: date,
        endDate: _scheduleType == ScheduleType.oneDay ? date : item.endDate);
    notifyListeners();
  }

  setEndDate(DateTime date) {
    item = item.copyWith(endDate: date);
    notifyListeners();
  }

  List<DayOfWeekOption> dayOfWeekOptions = [
    DayOfWeekOption(DateTime.monday, 'Monday'),
    DayOfWeekOption(DateTime.tuesday, 'Tuesday'),
    DayOfWeekOption(DateTime.wednesday, 'Wednesday'),
    DayOfWeekOption(DateTime.thursday, 'Thursday'),
    DayOfWeekOption(DateTime.friday, 'Friday'),
    DayOfWeekOption(DateTime.saturday, 'Saturday'),
    DayOfWeekOption(DateTime.sunday, 'Sunday'),
  ];

  bool isDayOfWeekSelected(int day) => item.daysOfWeek?.contains(day) ?? false;

  setDaySelected(int day, bool selected) {
    var daysOfWeek =
        item.daysOfWeek == null ? List<int>.empty() : List.of(item.daysOfWeek!);
    if (selected && !daysOfWeek.contains(day)) {
      daysOfWeek = [...daysOfWeek, day];
    }
    if (!selected && daysOfWeek.contains(day)) {
      daysOfWeek = daysOfWeek.where((d) => d != day).toList();
    }

    item = item.copyWith(daysOfWeek: daysOfWeek);
    notifyListeners();
  }

  setTitle(String title) {
    item = item.copyWith(title: title);
    notifyListeners();
  }

  setDescription(String description) {
    item = item.copyWith(description: description);
    notifyListeners();
  }

  _updateSettingImage(bool setting) {
    isSettingImage = setting;
    notifyListeners();
  }
  Future<void> setImage(PlatformFile image) async {
    try {
      _updateSettingImage(true);

      if(image.bytes == null) {
        return;
      }

      final url = await _fileRepository.uploadFile(
        image.name,
          image.bytes!,
          'item_images');

      if (url != null) {
        item = item.copyWith(backgroundImage: url);
        notifyListeners();
      }
    } finally {
      _updateSettingImage(false);
    }
  }

  Future<void> save() async {
    try {
      _updateIsSaving(true );
      await _itemRepository.upsertItem(item);
    } finally {
      _updateIsSaving(false);
    }
  }

  _updateIsSaving(bool saving) {
    isSaving = saving;
    notifyListeners();
  }
}

class ItemTypeOption {
  final ItemType itemType;
  final String displayName;

  ItemTypeOption(this.itemType, this.displayName);
}

enum ScheduleType { oneDay, everyDay, daysOfWeek }

class ScheduleTypeOption {
  final ScheduleType scheduleType;
  final String displayName;

  ScheduleTypeOption(this.scheduleType, this.displayName);
}

class DayOfWeekOption {
  final int day;
  final String displayName;

  DayOfWeekOption(this.day, this.displayName);
}
