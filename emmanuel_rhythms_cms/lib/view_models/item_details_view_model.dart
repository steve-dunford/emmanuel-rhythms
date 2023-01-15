import 'package:emmanuel_rhythms_cms/models/bible_book.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_cms/repositories/file_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final FileRepository _fileRepository;

  Item item;
  bool isSettingImage = false;

  ItemDetailsViewModel(this._fileRepository, this.item);

  List<ItemTypeOption> itemTypeOptions =
      ItemType.values.map((it) => ItemTypeOption(it, it.displayName)).toList();

  ItemTypeOption get selectedItemType =>
      itemTypeOptions.firstWhere((it) => it.itemType == item.type);

  setItemType(ItemTypeOption? option) {
    item = item.copyWith(type: option?.itemType ?? ItemType.video);
    notifyListeners();
  }

  setTitle(String title) {
    item = item.copyWith(title: title);
    notifyListeners();
  }

  setDescription(String? description) {
    item = item.copyWith(description: description);
    notifyListeners();
  }

  _updateSettingImage(bool setting) {
    isSettingImage = setting;
    notifyListeners();
  }

  Future<void> setImage(PlatformFile image) async {
    try {
      _updateSettingImage(true);

      if (image.bytes == null) {
        return;
      }

      final url = await _fileRepository.uploadFile(
          image.name, image.bytes!, 'item_images');

      if (url != null) {
        item = item.copyWith(backgroundImage: url);
        notifyListeners();
      }
    } finally {
      _updateSettingImage(false);
    }
  }

  addScriptureReference() {
    item = item.copyWith(scriptureReferences: [
      ...item.scriptureReferences ?? [],
      ScriptureReference(id: const Uuid().v4(), book: BibleBook.matthew)
    ]);
    notifyListeners();
  }

  deleteScriptureReference(ScriptureReference refToDelete) {
    item = item.copyWith(
        scriptureReferences: item.scriptureReferences
            ?.where((ref) => ref.id != refToDelete.id)
            .toList());
    notifyListeners();
  }

  updateScriptureReference(ScriptureReference updatedRef) {
    item = item.copyWith(
        scriptureReferences: item.scriptureReferences
            ?.map((ref) => ref.id == updatedRef.id ? updatedRef : ref)
            .toList());
    notifyListeners();
  }
}

class ItemTypeOption {
  final ItemType itemType;
  final String displayName;

  ItemTypeOption(this.itemType, this.displayName);
}
