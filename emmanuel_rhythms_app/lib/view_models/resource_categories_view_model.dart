import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:emmanuel_rhythms_app/models/resource_category.dart';
import 'package:emmanuel_rhythms_app/repositories/resource_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/tags_repository.dart';
import 'package:flutter/material.dart';
import 'package:emmanuel_rhythms_app/common/extensions/list_extensions.dart';

class ResourceCategoriesViewModel extends ChangeNotifier with Disposer {
  final ResourceRepository _resourceRepository;

  List<ResourceCategory>? categories;

  ResourceCategoriesViewModel(this._resourceRepository) {
    allCategories().listen((categories) {
      this.categories = categories;
      notifyListeners();
    }).disposedBy(disposeBag);
  }

  Stream<List<ResourceCategory>> allCategories() =>
      _resourceRepository.allResources().map((resources) {
        final usedTags = resources.expand((r) => r.tags).toList().distinct();

        final hasUntaggedResources = resources.any((r) => r.tags.isEmpty);

        return usedTags.map((t) => ResourceCategory(t)).toList()
          ..addAll(hasUntaggedResources ? [ResourceCategory(null)] : []);
      });
}
