import 'dart:async';

import 'package:calendar_view/calendar_view.dart';
import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/item_instance.dart';
import 'package:emmanuel_rhythms_cms/repositories/item_repository.dart';
import 'package:flutter/material.dart';

class CalendarViewModel extends ChangeNotifier with Disposer {
  final ItemRepository _itemRepository;

  StreamSubscription? _itemSubscription;
  StreamSubscription? _instanceSubscription;

  List<Item>? _items;
  List<ItemInstance>? _instances;

  DateTime startDate = DateTime.now().startOfMonth.atMidnight;
  DateTime endDate = DateTime.now().endOfMonth.atMidnight;
  DateTime selectedDate = DateTime.now().atMidnight;

  CalendarViewModel(this._itemRepository) {
    _updateListeners();
  }

  _updateListeners() async {
    await _itemSubscription?.cancel();
    _itemSubscription =
        _itemRepository.itemsForDates(startDate, endDate).listen((items) {
      _items = items;
      notifyListeners();
    });

    await _instanceSubscription?.cancel();
    _instanceSubscription = _itemRepository
        .itemInstancesForDates(startDate, endDate)
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

  List<CalendarEventData<Item>> get events {
    final events = (_instances ?? []).map((instance) {
      final item =
          (_items ?? []).firstWhere((item) => item.id == instance.itemId);

      return CalendarEventData<Item>(
          title: item.title,
          date: instance.date,
          event: item,
          color: item.type.color);
    }).toList();

    return events;
  }
}
