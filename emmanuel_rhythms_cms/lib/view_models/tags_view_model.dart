import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:emmanuel_rhythms_cms/repositories/tags_repository.dart';
import 'package:flutter/material.dart';

class TagsViewModel extends ChangeNotifier with Disposer {
  final TagsRepository _tagsRepository;

  List<Tag> tags = [];

  TagsViewModel(this._tagsRepository) {
    _tagsRepository.tags().listen((tags) {
      this.tags = tags;
      notifyListeners();
    }).disposedBy(disposeBag);
  }


}