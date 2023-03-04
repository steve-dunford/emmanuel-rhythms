import 'package:emmanuel_rhythms_app/models/church.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:flutter/material.dart';

class ChurchSelectionViewModel extends ChangeNotifier {
  final LocalStorageRepository _localStorageRepository;

  ChurchSelectionViewModel(this._localStorageRepository);

  bool isChurchSelected(Church church) =>
    _localStorageRepository.selectedChurch() == church;

  bool get hasSelectedChurch =>
  _localStorageRepository.hasSelectedChurch;

  setSelectedChurch(Church church) {
    _localStorageRepository.setSelectedChurch(church);
    notifyListeners();
  }


}