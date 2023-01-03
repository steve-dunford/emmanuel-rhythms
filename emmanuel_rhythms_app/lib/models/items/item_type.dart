import 'package:flutter/material.dart';

enum ItemType {
  video,
  scripture,
  podcast
}

extension ItemTypeExtensions on ItemType {

  String get displayName {
    switch(this) {
      case ItemType.video:
        return 'Video';
      case ItemType.scripture:
        return 'Scripture Reading';
      case ItemType.podcast:
        return 'Podcast';
    }
  }

  Color get color {
    switch(this) {
      case ItemType.video:
        return Colors.blue;
      case ItemType.scripture:
        return Colors.red;
      case ItemType.podcast:
        return Colors.green;
    }
  }
}