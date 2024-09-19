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
  devotional
}

extension ItemTypeExtensions on ItemType {

  String get displayName {
    switch(this) {
      case ItemType.text:
        return 'Text';
      case ItemType.vimeoVideo:
        return 'Vimeo Video';
      case ItemType.youtubeVideo:
        return 'YouTube Video';
      case ItemType.download:
        return 'Download';
      case ItemType.scripture:
        return 'Scripture Reading';
      case ItemType.transistorFMPodcast:
        return 'Emmanuel Lurgan Podcast';
      case ItemType.soundcloudPodcast:
        return 'Emmanuel Portadown Podcast';
      case ItemType.anchorFMPodcast:
        return 'Journey Lisburn Podcast';
      case ItemType.devotional:
        return 'Devotional';
    }
  }

  Color get color {
    switch(this) {
      case ItemType.text:
        return Colors.blue;
      case ItemType.vimeoVideo:
      case ItemType.youtubeVideo:
        return Colors.orange;
      case ItemType.download:
        return Colors.purple;
      case ItemType.scripture:
        return Colors.red;
      case ItemType.transistorFMPodcast:
      case ItemType.soundcloudPodcast:
      case ItemType.anchorFMPodcast:
        return Colors.green;
      case ItemType.devotional:
        return Colors.cyan;
    }
  }
}