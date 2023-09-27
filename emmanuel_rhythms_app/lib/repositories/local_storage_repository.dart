import 'dart:convert';

import 'package:emmanuel_rhythms_app/models/church.dart';
import 'package:emmanuel_rhythms_app/models/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageRepository {
  bool get hasSelectedChurch;

  Church? selectedChurch();

  setSelectedChurch(Church church);

  addNotification(ELRNotification notification);

  List<ELRNotification> getNotifications();
}

const _selectedChurchKey = 'selectedChurch';
const _notificationsKey = 'notifications';
const _maxNotifications = 30;

class SharedPreferencesLocalStorageRepository extends LocalStorageRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesLocalStorageRepository(this._sharedPreferences);

  @override
  Church? selectedChurch() {
    final rawValue = _sharedPreferences.getString(_selectedChurchKey);

    if (rawValue != null && Church.values.any((c) => c.name == rawValue)) {
      return Church.values.firstWhere((c) => c.name == rawValue);
    }

    return null;
  }

  @override
  setSelectedChurch(Church church) {
    _sharedPreferences.setString(_selectedChurchKey, church.name);
  }

  @override
  bool get hasSelectedChurch => selectedChurch() != null;

  @override
  addNotification(ELRNotification notification) {
    var allNotifications = getNotifications();
    allNotifications.add(notification);
    allNotifications = allNotifications.sortedBy((n) => n.timestamp);

    if (allNotifications.length > _maxNotifications) {
      allNotifications = allNotifications
          .skip(allNotifications.length - _maxNotifications)
          .toList();
    }

    _sharedPreferences.setStringList(_notificationsKey,
        allNotifications.map((n) => jsonEncode(n.toJson())).toList());
  }

  @override
  List<ELRNotification> getNotifications() {
    final rawNotifications =
        _sharedPreferences.getStringList(_notificationsKey);
    if (rawNotifications != null) {
      return rawNotifications
          .map((raw) => ELRNotification.fromJson(jsonDecode(raw)))
          .toList(growable: true);
    }
    return List<ELRNotification>.empty(growable: true);
  }
}
