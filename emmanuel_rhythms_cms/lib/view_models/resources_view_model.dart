import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/repositories/resources_repository.dart';
import 'package:emmanuel_rhythms_cms/repositories/tags_repository.dart';
import 'package:flutter/material.dart';

class ResourcesViewModel extends ChangeNotifier with Disposer {
  final ResourcesRepository _resourcesRepository;

  List<Item>? resources;

  ResourcesViewModel(this._resourcesRepository) {
    _resourcesRepository.resources().listen((resources) {
      this.resources = resources;
      notifyListeners();
    }).disposedBy(disposeBag);
  }
}