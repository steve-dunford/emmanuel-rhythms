import 'package:flutter/material.dart';

enum ItemType {
  text,
  vimeoVideo,
  youtubeVideo,
  download,
  scripture,
  transistorFMPodcast,
  soundcloudPodcast,
  anchorFMPodcast,
  devotional,
  unknown
}

extension ItemTypeExtensions on ItemType {

  String? get displayName {
    switch(this) {
      case ItemType.text:
        return null;
      case ItemType.vimeoVideo:
      case ItemType.youtubeVideo:
        return 'Video';
      case ItemType.download:
        return 'Download';
      case ItemType.scripture:
        return 'Reading';
      case ItemType.transistorFMPodcast:
      case ItemType.soundcloudPodcast:
      case ItemType.anchorFMPodcast:
        return 'Podcast';
      case ItemType.devotional:
        return 'Daily Devotional';
    }
  }
}