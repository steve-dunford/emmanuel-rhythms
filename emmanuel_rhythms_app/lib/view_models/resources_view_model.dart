import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/resource_repository.dart';
import 'package:flutter/material.dart';

class ResourcesViewModel extends ChangeNotifier with Disposer {
  final ResourceRepository _resourceRepository;
  final LocalStorageRepository _localStorageRepository;

  List<Item>? resources;

  ResourcesViewModel(this._resourceRepository, this._localStorageRepository) {
    _resourceRepository.allResources().listen((resources) {
      final selectedChurch = _localStorageRepository.selectedChurch;

      this.resources =
          resources.where((r) => r.churches.contains(selectedChurch)).toList();
      notifyListeners();
    }).disposedBy(disposeBag);
  }
}
