import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/schedule_type.dart';
import 'package:emmanuel_rhythms_cms/repositories/daily_content_repository.dart';
import 'package:flutter/material.dart';

class DailyContentViewModel extends ChangeNotifier {
  final DailyContentRepository _itemRepository;
  final bool _isNewContent;

  DailyContent content;
  bool isSettingImage = false;
  bool isSaving = false;
  bool isDeleting = false;

  DailyContentViewModel(this._itemRepository, this.content, this._isNewContent);

  List<ScheduleTypeOption> scheduleTypeOptions = [
    ScheduleTypeOption(ScheduleType.oneDay, 'Single Day'),
    ScheduleTypeOption(ScheduleType.everyDay, 'Every Day'),
    ScheduleTypeOption(ScheduleType.daysOfWeek, 'Days of Week'),
  ];

  ScheduleTypeOption get scheduleType =>
      scheduleTypeOptions.firstWhere((e) => e.scheduleType == content.scheduleType);

  setScheduleType(ScheduleTypeOption? option) {
    content = content.copyWith(
        scheduleType: option?.scheduleType ?? ScheduleType.oneDay
    );

    if (content.scheduleType == ScheduleType.oneDay) {
      content = content.copyWith(endDate: content.startDate);
    }
    if (content.scheduleType != ScheduleType.daysOfWeek) {
      content = content.copyWith(daysOfWeek: null);
    }
    notifyListeners();
  }

  setStartDate(DateTime date) {
    content = content.copyWith(
        startDate: date,
        endDate: content.scheduleType == ScheduleType.oneDay ? date : content.endDate);
    notifyListeners();
  }

  setEndDate(DateTime date) {
    content = content.copyWith(endDate: date);
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

  bool isDayOfWeekSelected(int day) => content.daysOfWeek?.contains(day) ?? false;

  setDaySelected(int day, bool selected) {
    var daysOfWeek =
    content.daysOfWeek == null ? List<int>.empty() : List.of(content.daysOfWeek!);
    if (selected && !daysOfWeek.contains(day)) {
      daysOfWeek = [...daysOfWeek, day];
    }
    if (!selected && daysOfWeek.contains(day)) {
      daysOfWeek = daysOfWeek.where((d) => d != day).toList();
    }

    content = content.copyWith(daysOfWeek: daysOfWeek);
    notifyListeners();
  }

  setItem(Item item) {
    content = content.copyWith(item: item);
  }

  Future<void> save() async {
    try {
      _updateIsSaving(true );
      await _itemRepository.upsertDailyContent(content);
    } finally {
      _updateIsSaving(false);
    }
  }

  bool get canDelete => !_isNewContent;

  Future<void> delete() async {
    try {
      _updateIsDeleting(true );
      await _itemRepository.deleteDailyContent(content);
    } finally {
      _updateIsDeleting(false);
    }
  }

  _updateIsSaving(bool saving) {
    isSaving = saving;
    notifyListeners();
  }

  _updateIsDeleting(bool deleting) {
    isDeleting = deleting;
    notifyListeners();
  }
}

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
