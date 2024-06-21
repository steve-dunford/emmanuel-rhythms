import 'dart:io';

import 'package:emmanuel_rhythms_app/models/bible_book.dart';
import 'package:emmanuel_rhythms_app/models/download_type.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/podcast_details.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/repositories/podcast_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collection/collection.dart';
import '../models/items/item_type.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final PodcastRepository _podcastRepository;
  final AnalyticsRepository _analyticsRepository;
  final Item item;

  PodcastDetails? podcastDetails;
  String? description;

  ItemDetailsViewModel(this._podcastRepository, this._analyticsRepository, this.item) {
    if (item.type == ItemType.transistorFMPodcast && item.url != null) {
      _podcastRepository.getTransistorFMPodcastDetails(item.url!).then((details) {
        podcastDetails = details;
        notifyListeners();
      });
    }

    if (item.type == ItemType.soundcloudPodcast && item.url != null) {
      _podcastRepository.getSoundcloudPodcastDetails(item.url!).then((details) {
        podcastDetails = details;
        notifyListeners();
      });
    }

    ItemDetailsViewModel.htmlTemplate().then((template) {
      if (item.description != null) {
        description = template.replaceAll("#CONTENT#", item.description!);
        notifyListeners();
      }
    });
  }

  String get pageTitle => item.type.displayName ?? '';

  String? get title {
    switch (item.type) {
      case ItemType.transistorFMPodcast:
      case ItemType.soundcloudPodcast:
        return podcastDetails?.title;
      case ItemType.devotional:
        return null;  //Don't show title for devotionals
      default:
        return item.title;
    }
  }

  static String? _htmlTemplate;

  static Future<String> htmlTemplate() async {
    _htmlTemplate ??= await rootBundle.loadString('assets/html_template.html');

    return _htmlTemplate!;
  }

  bool get showPodcastDetails => item.usePodcastDetails ?? false;

  String? scriptureReading() {
    final refs = item.scriptureReferences;
    if (refs != null && refs.isNotEmpty) {
      var buffer = StringBuffer();

      final uniqueBooks = refs.map((r) => r.book).toSet().toList();

      for (final book in uniqueBooks) {
        final refsForBook = refs.where((r) => r.book == book);
        buffer.write('${book.bookName} ');

        bool isFirstRef = true;
        for (final ref in refsForBook) {
          if (!isFirstRef) {
            buffer.write(', ');
          }
          final representation = ref.displayString;
          if (representation == null) {
            buffer.write('(whole book)');
          } else {
            buffer.write(representation);
          }

          isFirstRef = false;
        }
      }

      return buffer.toString();
    }

    return null;
  }

  String? get vimeoVideoId {
    if (item.url == null) {
      return null;
    }
    return item.url!.substring(item.url!.lastIndexOf('/') + 1);
  }

  String? get youtubeVideoUrl => item.url;

  Future<void> readScriptureRef(ScriptureReference ref) async {
    final url = Uri.parse('https://bible.com/bible/113/${ref.youVersionString}');

    _analyticsRepository.track('scripture_read', {
      'content_name': item.title,
      'content_id': item.id,
      'ref': ref.displayString
    });

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }


  }

  Future<void> openLink(String? link) async {
    if(link != null) {
      final url = Uri.parse(link);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    }
  }

  bool hasDevotionalTranscript() =>
      item.downloads?.any((d) => d.downloadType == DownloadType.devotionalTranscript) ?? false;

  Future<void> openDevotionalTranscript() async {
    return _doOpenDownload(DownloadType.devotionalTranscript, 'devotion_transcript_viewed');
  }

  bool hasDevotionalAudio() =>
      item.downloads?.any((d) => d.downloadType == DownloadType.devotionalAudio) ?? false;

  PodcastDetails? devotionalAudioDetails() {
    final audio = item.downloads?.firstWhereOrNull((d) => d.downloadType == DownloadType.devotionalAudio);

    if(audio != null) {
      final title = 'Devotional: ${scriptureReading()}';

      return PodcastDetails(title, '', audio.url);
    }

    return null;
  }

  Future<void> openDownload() async {
    return _doOpenDownload(DownloadType.fileDownload, 'download_viewed');
  }

  Future<void> _doOpenDownload(DownloadType type, String analyticsName) async {

    final rawUrl = item.downloads?.firstWhereOrNull((d) => d.downloadType == type)?.url ?? item.url;

    if (rawUrl == null) {
      return;
    }

    final url = Uri.parse(rawUrl);

    if (await canLaunchUrl(url)) {

      _analyticsRepository.track(analyticsName, {
        'content_name': item.title,
        'content_id': item.id,
        'download_url': rawUrl ?? ''
      });

      final launchMode = Platform.isAndroid ? LaunchMode.externalApplication : LaunchMode.platformDefault;
      await launchUrl(url, mode: launchMode);
    }
  }


}
