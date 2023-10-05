import 'dart:async';

import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content_instance.dart';
import 'package:emmanuel_rhythms_cms/repositories/daily_content_repository.dart';
import 'package:flutter/material.dart';

class CalendarViewModel extends ChangeNotifier with Disposer {
  final DailyContentRepository _itemRepository;

  StreamSubscription? _itemSubscription;
  StreamSubscription? _instanceSubscription;

  List<DailyContent>? _dailyContent;
  List<DailyContentInstance>? _instances;

  DateTime startDate = DateTime.now().startOfMonth.atMidnight;
  DateTime endDate = DateTime.now().endOfMonth.atMidnight;
  DateTime selectedDate = DateTime.now().atMidnight;

  CalendarViewModel(this._itemRepository) {
    _updateListeners();
  }

  _updateListeners() async {
    await _itemSubscription?.cancel();
    _itemSubscription =
        _itemRepository.dailyContent().listen((content) {
          _dailyContent = content;
      notifyListeners();
    });

    await _instanceSubscription?.cancel();
    _instanceSubscription = _itemRepository
        .dailyContentInstances(startDate, endDate)
        .listen((instances) {
      _instances = instances;
      notifyListeners();
    });
  }

  setMonth(DateTime month) {
    startDate = month.startOfMonth;
    endDate = month.endOfMonth;
    _updateListeners();
  }

  List<CalendarEventData<DailyContent>> get events {
    final rawInstances = _instances ?? [];
    rawInstances.sort((a,b) => a.item.resolvedSortOrder.compareTo(b.item.resolvedSortOrder));

    final events = rawInstances.map((instance) {
      final dailyContent =
          (_dailyContent ?? []).firstWhere((content) => content.dailyContentId == instance.dailyContentId);

      return CalendarEventData<DailyContent>(
          title: dailyContent.item.title,
          date: instance.date,
          event: dailyContent,
          color: dailyContent.item.type.color);
    }).toList();


    return events;
  }
}
