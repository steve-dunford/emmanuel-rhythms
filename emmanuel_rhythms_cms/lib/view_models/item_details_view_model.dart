import 'package:emmanuel_rhythms_cms/models/bible_book.dart';
import 'package:emmanuel_rhythms_cms/models/church.dart';
import 'package:emmanuel_rhythms_cms/models/download.dart';
import 'package:emmanuel_rhythms_cms/models/download_type.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:emmanuel_rhythms_cms/repositories/file_repository.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/list_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final FileRepository _fileRepository;

  Item item;
  bool isSettingImage = false;
  List<DownloadType> _currentlyUploading = [];

  ItemDetailsViewModel(this._fileRepository, this.item);

  List<ItemTypeOption> itemTypeOptions =
      ItemType.values.map((it) => ItemTypeOption(it, it.displayName)).toList();

  ItemTypeOption get selectedItemType =>
      itemTypeOptions.firstWhere((it) => it.itemType == item.type);

  setItemType(ItemTypeOption? option) {
    item = item.copyWith(type: option?.itemType ?? ItemType.text);
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

  setIsPriority(bool isPriority) {
    item = item.copyWith(isPriority: isPriority);
    notifyListeners();
  }

  setSortOrder(String sortOrder) {
    item = item.copyWith(sortOrder: int.tryParse(sortOrder));
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

  isChurchSelected(Church church) =>
    item.churches.contains(church);

  setChurchSelected(Church church, bool selected) {
    if (selected) {
      if (!item.churches.contains(church)) {
        item = item.copyWith(churches: [...item.churches, church]);
      }
    } else {
      if (item.churches.contains(church)) {
        item = item.copyWith(
            churches: item.churches.where((c) => c != church).toList());
      }
    }

    notifyListeners();
  }

  setSelectedTags(List<Tag> tags) {
    item = item.copyWith(tags: tags);
     notifyListeners();
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

  setUrl(String? url) {
    item = item.copyWith(
      url: url
    );
    notifyListeners();
  }

  setUsePodcastDetails(bool useDetails) {
    item = item.copyWith(
      usePodcastDetails: useDetails
    );
    notifyListeners();
  }

  _updateUploadingFile(DownloadType type, bool uploading) {
    if(uploading) {
      if(!_currentlyUploading.contains(type)) {
        _currentlyUploading.add(type);
      }
    } else {
      _currentlyUploading.removeWhere((d) => d == type);
    }
    notifyListeners();
  }

  String? downloadFileName(DownloadType type) {
    final name = item.downloads?.firstOrNullWhere((d) => d.downloadType == type)?.filename;

    return name ?? item.downloadFilename; //Backwards compatibility only
  }

  String? downloadUrl(DownloadType type) {
    final url = item.downloads?.firstOrNullWhere((d) => d.downloadType == type)?.url;

    return url ?? item.url; //Backwards compatibility only
  }

  bool isUploading(DownloadType type) => _currentlyUploading.contains(type);

  Future<void> setDownload(DownloadType type, PlatformFile file) async {
    try {
      _updateUploadingFile(type, true);

      if (file.bytes == null) {
        return;
      }

      final url = await _fileRepository.uploadFile(
          file.name, file.bytes!, 'item_uploads');

      if (url != null) {

        var existingDownloads = item.downloads ?? [];

        item = item.copyWith(
          downloads: [
            ...existingDownloads.where((d) => d.downloadType != type),
            Download(
              id: const Uuid().v4(),
              downloadType: type,
              filename: file.name,
              url: url
            )
          ]
        );

        notifyListeners();
      }
    } finally {
      _updateUploadingFile(type, false);
    }
  }

}

class ItemTypeOption {
  final ItemType itemType;
  final String displayName;

  ItemTypeOption(this.itemType, this.displayName);
}
