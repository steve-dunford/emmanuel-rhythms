import 'dart:async';

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
  static const loadAheadCount = 14;
  static const loadBehindCount = 14;
  static const loadThreshold = 3;

  int currentIndex = initialPageIndex;
  late int loadWindowStartIndex;
  late int loadWindowEndIndex;
  bool _isLoading = true;
  bool _hasDoneFirstLoad = false;
  List<DailyContentInstance>? instances;
  StreamSubscription? instancesSubscription;

  HomeViewModel(this._dailyContentRepository, this._localStorageRepository) {
    _updateInstanceListener();
  }

  _updateInstanceListener() {
    instancesSubscription?.cancel();
    loadWindowStartIndex = currentIndex - loadBehindCount;
    loadWindowEndIndex = currentIndex + loadAheadCount;

    _isLoading = true;
    instancesSubscription = _dailyContentRepository
        .itemInstancesForDates(_dateForIndex(loadWindowStartIndex),
        _dateForIndex(loadWindowEndIndex))
        .listen((instances) {
      this.instances = instances;
      _isLoading = false;
      _hasDoneFirstLoad = true;
      notifyListeners();
    });
  }

  bool get shouldShowLoadingIndicator =>
      _isLoading &&
          (!_hasDoneFirstLoad || currentIndex < loadWindowStartIndex ||
              currentIndex > loadWindowEndIndex);

  DateTime get currentDate => _dateForIndex(currentIndex);

  setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();

    // if the current index is getting close to either end of the window we've got loaded, move the window
    // so we keep content close to where we need it.
    if (currentIndex - loadWindowStartIndex <= loadThreshold ||
        loadWindowEndIndex - currentIndex <= loadThreshold) {
      _updateInstanceListener();
    }
  }

  onSelectedChurchChanged() {
    notifyListeners();
  }

  List<Item> itemsForIndex(int index) =>
      instances
          ?.where((instance) =>
      instance.item.churches
          .contains(_localStorageRepository.selectedChurch()) &&
          instance.date.toUtc().isAtSameMomentAs(_dateForIndex(index)))
          .map((instance) => instance.item)
          .toList() ??
          [];

  DateTime _dateForIndex(int index) {
    final adjustedIndex = index - initialPageIndex;

    if (adjustedIndex >= 0) {
      return DateTime
          .now()
          .atMidnight
          .add(Duration(days: adjustedIndex));
    } else {
      return DateTime
          .now()
          .atMidnight
          .subtract(Duration(days: adjustedIndex.abs()));
    }
  }

  String get title => DateFormat('d MMM yyyy').format(currentDate);
}
