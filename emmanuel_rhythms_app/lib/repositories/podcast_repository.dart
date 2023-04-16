import 'dart:io';
import 'package:http/io_client.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../models/podcast_details.dart';

abstract class PodcastRepository {
  Future<PodcastDetails?> getTransistorFMPodcastDetails(String itemUrl);
  Future<PodcastDetails?> getSoundcloudPodcastDetails(String itemUrl);
}

class TransistorFMPodcastRepository extends PodcastRepository {
  static const transistorRssFeedUrl = 'https://feeds.transistor.fm/emmanuel-church-lurgan';
  static const soundcloudRssFeedUrl = 'https://feeds.soundcloud.com/users/soundcloud:users:297901712/';

  @override
  Future<PodcastDetails?> getTransistorFMPodcastDetails(String itemUrl) async {
    return _getPodcastDetails(itemUrl, transistorRssFeedUrl);
  }

  @override
  Future<PodcastDetails?> getSoundcloudPodcastDetails(String itemUrl) async {
    return _getPodcastDetails(itemUrl, soundcloudRssFeedUrl);
  }

  @override
  Future<PodcastDetails?> _getPodcastDetails(String itemUrl, String feedUrl) async {
    final client = IOClient(HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(
        Uri.parse(feedUrl));
    var channel = RssFeed.parse(response.body);
    final items = channel.items?.where((item) => item.link?.toLowerCase() == itemUrl.toLowerCase()) ?? [];

    if(items.isNotEmpty) {
      return PodcastDetails(
        items.first.title,
        items.first.description,
        items.first.enclosure?.url
      );
    }

    return null;
  }

}