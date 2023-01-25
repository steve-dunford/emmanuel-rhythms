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

  Color get color {
    switch(this) {
      case ItemType.text:
        return Colors.blue;
      case ItemType.vimeoVideo:
        return Colors.orange;
      case ItemType.download:
        return Colors.purple;
      case ItemType.scripture:
        return Colors.red;
      case ItemType.podcast:
        return Colors.green;
    }
  }
}