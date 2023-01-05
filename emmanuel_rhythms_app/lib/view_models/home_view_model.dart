import 'package:emmanuel_rhythms_app/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_instance.dart';
import 'package:emmanuel_rhythms_app/repositories/item_repository.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ChangeNotifier with Disposer {
  final ItemRepository _itemRepository;

  static const initialPageIndex = 1000;

  DateTime currentDate = DateTime.now().atMidnight;

  bool isLoading = true;
  List<ItemInstance>? instances;

  HomeViewModel(this._itemRepository) {
    _itemRepository.allItemInstances().listen((instances) {
      this.instances = instances;
      isLoading = false;
      notifyListeners();
    });
  }

  setCurrentIndex(int index) {
    currentDate = _dateForIndex(index);
    notifyListeners();
  }

  List<Item> itemsForIndex(int index) => instances
      ?.where((instance) => instance.date.isAtSameMomentAs(_dateForIndex(index)))
        .map((instance) => instance.item)
        .toList() ?? [];

  DateTime _dateForIndex(int index) {
    final adjustedIndex = index - initialPageIndex;

    if(adjustedIndex >= 0) {
      return DateTime.now().atMidnight.toUtc().add(Duration(days: adjustedIndex));
    } else {
      return DateTime.now().atMidnight.toUtc().subtract(Duration(days: adjustedIndex.abs()));
    }
  }

  String get title =>
    DateFormat('d MMM yyyy').format(currentDate);


}