import 'package:flutter/material.dart';

enum ItemType {
  text,
  video,
  scripture,
  podcast
}

extension ItemTypeExtensions on ItemType {

  String get displayName {
    switch(this) {
      case ItemType.text:
        return 'Text';
      case ItemType.video:
        return 'Video';
      case ItemType.scripture:
        return 'Scripture Reading';
      case ItemType.podcast:
        return 'Podcast';
    }
  }
}