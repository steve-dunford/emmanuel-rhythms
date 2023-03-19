import 'package:flutter/material.dart';

enum ItemType {
  text,
  vimeoVideo,
  download,
  scripture,
  podcast
}

extension ItemTypeExtensions on ItemType {

  String? get displayName {
    switch(this) {
      case ItemType.text:
        return null;
      case ItemType.vimeoVideo:
        return 'Video';
      case ItemType.download:
        return 'Download';
      case ItemType.scripture:
        return 'Reading';
      case ItemType.podcast:
        return 'Podcast';
    }
  }
}