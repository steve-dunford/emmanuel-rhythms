import 'package:emmanuel_rhythms_app/models/churchV2.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageRepository {
  bool get hasSelectedChurch;

  ChurchV2? selectedChurch();

  setSelectedChurch(ChurchV2 church);
}

const _selectedChurchKey = 'selectedChurch';
const _notificationsKey = 'notifications';
const _maxNotifications = 30;

class SharedPreferencesLocalStorageRepository extends LocalStorageRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesLocalStorageRepository(this._sharedPreferences);

  @override
  ChurchV2? selectedChurch() {
    final rawValue = _sharedPreferences.getString(_selectedChurchKey);

    if (rawValue != null && ChurchV2.values.any((c) => c.name == rawValue)) {
      return ChurchV2.values.firstWhere((c) => c.name == rawValue);
    }

    return null;
  }

  @override
  setSelectedChurch(ChurchV2 church) {
    _sharedPreferences.setString(_selectedChurchKey, church.name);
  }

  @override
  bool get hasSelectedChurch => selectedChurch() != null;


}
