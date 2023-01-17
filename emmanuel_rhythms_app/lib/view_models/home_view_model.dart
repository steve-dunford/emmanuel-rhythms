import 'package:emmanuel_rhythms_app/common/extensions/datetime_extensions.dart';
import 'package:emmanuel_rhythms_app/models/items/daily_content_instance.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/repositories/daily_content_repository.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ChangeNotifier with Disposer {
  final DailyContentRepository _dailyContentRepository;
  final LocalStorageRepository _localStorageRepository;

  static const initialPageIndex = 1000;

  DateTime currentDate = DateTime.now().atMidnight;

  bool isLoading = true;
  List<DailyContentInstance>? instances;

  HomeViewModel(this._dailyContentRepository, this._localStorageRepository) {
    _dailyContentRepository.allInstances().listen((instances) {
      this.instances = instances;
      isLoading = false;
      notifyListeners();
    });
  }

  setCurrentIndex(int index) {
    currentDate = _dateForIndex(index);
    notifyListeners();
  }

  onSelectedChurchChanged()  {
    notifyListeners();
  }

  List<Item> itemsForIndex(int index) => instances
      ?.where((instance) => instance.item.churches.contains(_localStorageRepository.selectedChurch) && instance.date.isAtSameMomentAs(_dateForIndex(index)))
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