import 'dart:io';
import 'package:http/io_client.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../models/podcast_details.dart';

abstract class PodcastRepository {
  Future<PodcastDetails?> getPodcastDetails(String itemUrl);
}

class TransistorFMPodcastRepository extends PodcastRepository {
  static const rssFeedUrl = 'https://feeds.transistor.fm/emmanuel-church-lurgan';

  @override
  Future<PodcastDetails?> getPodcastDetails(String itemUrl) async {
    final client = IOClient(HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true));

    // RSS feed
    var response = await client.get(
        Uri.parse(rssFeedUrl));
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