import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/repositories/resources_repository.dart';
import 'package:flutter/material.dart';

class ResourceDetailsViewModel extends ChangeNotifier {
  final ResourcesRepository _resourcesRepository;
  final bool _isNewResource;

  Item resource;
  bool isSaving = false;
  bool isDeleting = false;
  bool isPublishing = false;

  ResourceDetailsViewModel(this._resourcesRepository, this.resource, this._isNewResource);

  setItem(Item item) {
    resource = item;
  }

  Future<void> save() async {
    try {
      _updateIsSaving(true );
      await _resourcesRepository.upsertResource(resource);
    } finally {
      _updateIsSaving(false);
    }
  }

  Future<void> publish() async {
    try {
      _updateIsPublishing(true);

      await save();

      await _resourcesRepository.publishResource(resource);
    } finally {
      _updateIsPublishing(false);
    }
  }

  bool get canDelete => !_isNewResource;

  Future<void> delete() async {
    try {
      _updateIsDeleting(true );
      await _resourcesRepository.deleteResource(resource);
    } finally {
      _updateIsDeleting(false);
    }
  }

  _updateIsSaving(bool saving) {
    isSaving = saving;
    notifyListeners();
  }

  _updateIsPublishing(bool publishing) {
    isPublishing = publishing;
    notifyListeners();
  }

  _updateIsDeleting(bool deleting) {
    isDeleting = deleting;
    notifyListeners();
  }
}
