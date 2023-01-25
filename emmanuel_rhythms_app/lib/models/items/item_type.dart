import 'package:flutter/material.dart';

enum ItemType {
  text,
  vimeoVideo,
  download,
  scripture,
  podcast
}

extension ItemTypeExtensions on ItemType {

  String get displayName {
    switch(this) {
      case ItemType.text:
        return 'Text';
      case ItemType.vimeoVideo:
        return 'Vimeo Video';
      case ItemType.download:
        return 'Download';
      case ItemType.scripture:
        return 'Scripture Reading';
      case ItemType.podcast:
        return 'Podcast';
    }
  }
}