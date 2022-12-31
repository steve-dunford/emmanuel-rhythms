import 'package:cell_calendar/cell_calendar.dart';
import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/common/utils.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/item_instance.dart';
import 'package:emmanuel_rhythms_cms/repositories/item_repository.dart';
import 'package:flutter/material.dart';

class CalendarViewModel extends ChangeNotifier with Disposer {

  final ItemRepository _itemRepository;

  List<Item>? _items;
  List<ItemInstance>? _instances;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 28));

  CalendarViewModel(
    this._itemRepository
  ) {
    _itemRepository
        .itemsForDates(startDate, endDate)
        .listen((items) {
      _items = items;
      notifyListeners();
    }).disposedBy(disposeBag);

    _itemRepository
        .itemInstancesForDates(startDate, endDate)
        .listen((instances) {
      _instances = instances;
      notifyListeners();
    }).disposedBy(disposeBag);
  }
  
  List<CalendarEvent> get events {
    final events = (_instances ?? [])
      .map((instance) {

        final item = (_items ?? []).firstWhere((item) => item.id == instance.itemId);

        return CalendarEvent(eventName: item.title, eventDate: instance.date);
      })
      .toList();

    return events;
  }

}