import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/repositories/resource_repository.dart';
import 'package:flutter/material.dart';

class ResourcesViewModel extends ChangeNotifier with Disposer {
  final ResourceRepository _resourceRepository;

  List<Item>? resources;

  ResourcesViewModel(this._resourceRepository) {
    _resourceRepository.allResources().listen((resources) {
      this.resources = resources;
      notifyListeners();
    }).disposedBy(disposeBag);
  }

}