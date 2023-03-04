import 'package:emmanuel_rhythms_app/models/church.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageRepository {
  bool get hasSelectedChurch;
  Church? selectedChurch();

  setSelectedChurch(Church church);
}

const _selectedChurchKey = 'selectedChurch';

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
}
