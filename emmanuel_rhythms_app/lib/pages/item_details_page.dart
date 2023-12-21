import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_app/models/video_type.dart';
import 'package:emmanuel_rhythms_app/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/scripture_button.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:emmanuel_rhythms_app/widgets/video_widget.dart';
import 'package:emmanuel_rhythms_app/widgets/view_download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../widgets/audio_widget.dart';

class ItemDetailsPage extends StatelessWidget {
  static const route = 'itemDetails';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDetailsArguments;

    return ChangeNotifierProvider(
        create: (_) =>
            ItemDetailsViewModel(GetIt.I.get(), GetIt.I.get(), args.item),
        builder: (context, child) {
          final viewModel = context.watch<ItemDetailsViewModel>();

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white, // Status bar
              ),
              backgroundColor: Colors.white,
              foregroundColor: AppColours.emmanuelBlue,
              centerTitle: true,
              title: Text(viewModel.pageTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.headline3),
              automaticallyImplyLeading: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (viewModel.title != null)
                      Text(
                        viewModel.title!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    if (viewModel.item.description != null)
                      Html(
                        data: viewModel.item.description,
                        onLinkTap: (link, context, map, element) {
                          viewModel.openLink(link);
                        },
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    _itemSpecificUI(context, viewModel),
                    const SizedBox(
                      height: 10,
                    ),
                    if (viewModel.item.tags.isNotEmpty)
                      Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text('TAGS: '),
                            ...viewModel.item.tags
                                .map((tag) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: const BoxDecoration(
                                            color: AppColours.lightGrey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              tag.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: AppColours
                                                          .emmanuelBlue),
                                            ),
                                          )),
                                    ))
                                .toList(),
                          ])
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _itemSpecificUI(BuildContext context, ItemDetailsViewModel viewModel) {
    switch (viewModel.item.type) {
      case ItemType.scripture:
        return _scriptureReading(context, viewModel);
      case ItemType.vimeoVideo:
        return _vimeoVideo(context, viewModel);
      case ItemType.youtubeVideo:
        return _youtubeVideo(context, viewModel);
      case ItemType.download:
        return _download(context, viewModel);
      case ItemType.transistorFMPodcast:
      case ItemType.soundcloudPodcast:
        return _podcastPlayer(context, viewModel);
      case ItemType.devotional:
        return _devotional(context, viewModel);
    }

    return Container();
  }

  Widget _download(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.item.url == null) {
      return Container();
    }

    return ViewDownloadButton(
        caption: 'View Now', onClick: viewModel.openDownload);
  }

  Widget _vimeoVideo(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.vimeoVideoId == null) {
      return Container();
    }
    return VideoWidget(
      videoId: viewModel.vimeoVideoId!,
      videoType: VideoType.vimeo,
    );
  }

  Widget _youtubeVideo(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.youtubeVideoUrl == null) {
      return Container();
    }
    return VideoWidget(
      videoId: viewModel.youtubeVideoUrl!,
      videoType: VideoType.youTube,
    );
  }

  Widget _podcastPlayer(BuildContext context, ItemDetailsViewModel viewModel) {
    final details = viewModel.podcastDetails;

    if (details == null) {
      return Container();
    }

    return Column(
      children: [
        if (viewModel.showPodcastDetails && details.title != null) ...[],
        if (viewModel.showPodcastDetails && details.description != null) ...[
          Text(details.description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 20),
        ],
        if (details.audioFileUrl != null) AudioWidget(podcast: details!)
      ],
    );
  }

  Widget _scriptureReading(
      BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.item.scriptureReferences?.isEmpty ?? true) {
      return Container();
    }

    return Column(children: [
      ...viewModel.item.scriptureReferences!.map((ref) {
        return ScriptureButton(
            caption: ref.displayString.toUpperCase() ?? '',
            onClick: () => viewModel.readScriptureRef(ref));
      }).toList(),
      if (viewModel.item.url != null) ...[
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColours.emmanuelBlue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 40, 20),
                child: Column(
                  children: [
                    Center(
                        child: Text('DEVOTIONAL\nVIDEO',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.scriptureCaption(context))),
                    const SizedBox(
                      height: 10,
                    ),
                    StandardButton(
                        onTap: () => viewModel.openDownload(),
                        isEnabled: true,
                        text: 'WATCH'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]
    ]);
  }

  Widget _devotional(BuildContext context, ItemDetailsViewModel viewModel) {
    final scriptures = viewModel.item.scriptureReferences ?? [];

    return Column(
      children: [
        if (scriptures.isNotEmpty)
          Text('BIBLE', style: Theme.of(context).textTheme.headline2),
        const SizedBox(height: 10),
        Column(
          children: scriptures.map((ref) {
            return ScriptureButton(
                caption: ref.displayString.toUpperCase() ?? '',
                onClick: () => viewModel.readScriptureRef(ref));
          }).toList(),
        ),
        if (viewModel.hasDevotionalAudio() ||
            viewModel.hasDevotionalTranscript())
          Column(
            children: [
              const SizedBox(height: 30),
              Text('DEVOTIONAL', style: Theme.of(context).textTheme.headline2),
            ],
          ),
        if (viewModel.hasDevotionalAudio())
          Column(
            children: [
              const SizedBox(height: 20),
              AudioWidget(podcast: viewModel.devotionalAudioDetails()!),
            ],
          ),
        if (viewModel.hasDevotionalTranscript())
          Column(
            children: [
              const SizedBox(height: 10),
              ViewDownloadButton(
                  caption: 'View Transcript',
                  onClick: viewModel.openDevotionalTranscript),
            ],
          ),
      ],
    );
  }
}

class ItemDetailsArguments {
  final Item item;

  ItemDetailsArguments(this.item);
}
