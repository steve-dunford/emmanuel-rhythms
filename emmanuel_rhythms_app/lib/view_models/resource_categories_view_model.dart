import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_app/common/disposer.dart';
import 'package:emmanuel_rhythms_app/models/resource_category.dart';
import 'package:emmanuel_rhythms_app/repositories/tags_repository.dart';
import 'package:flutter/material.dart';

class ResourceCategoriesViewModel extends ChangeNotifier with Disposer {
  final TagsRepository _tagsRepository;

  List<ResourceCategory>? categories;

  ResourceCategoriesViewModel(this._tagsRepository) {
    allCategories().listen((categories) {
      this.categories = categories;
      notifyListeners();
    }).disposedBy(disposeBag);
  }

  Stream<List<ResourceCategory>> allCategories() =>
    _tagsRepository.tags().map((tags) => [
      ...tags.map((t) => ResourceCategory(t)),
      ResourceCategory(null)
    ]);
}
