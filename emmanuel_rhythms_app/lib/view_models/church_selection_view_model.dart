import 'package:emmanuel_rhythms_app/models/churchV2.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:flutter/material.dart';

class ChurchSelectionViewModel extends ChangeNotifier {
  final LocalStorageRepository _localStorageRepository;

  ChurchSelectionViewModel(this._localStorageRepository);

  bool isChurchSelected(ChurchV2 church) =>
    _localStorageRepository.selectedChurch() == church;

  bool get hasSelectedChurch =>
  _localStorageRepository.hasSelectedChurch;

  ChurchV2? get selectedChurch => _localStorageRepository.selectedChurch();

  setSelectedChurch(ChurchV2 church) {
    _localStorageRepository.setSelectedChurch(church);
    notifyListeners();
  }


}