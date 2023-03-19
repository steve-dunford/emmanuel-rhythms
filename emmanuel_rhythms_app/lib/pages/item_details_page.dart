import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_app/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:emmanuel_rhythms_app/widgets/vimeo_video_widget.dart';
import 'package:flutter/material.dart';
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
        create: (_) => ItemDetailsViewModel(GetIt.I.get(), args.item),
        builder: (context, child) {
          final viewModel = context.watch<ItemDetailsViewModel>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: AppColours.emmanuelBlue,
              title: Text(viewModel.item.title,
                  style: Theme.of(context).textTheme.headline3),
              automaticallyImplyLeading: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (viewModel.item.description != null)
                      Html(data: viewModel.item.description),
                    const SizedBox(
                      height: 10,
                    ),
                    _itemSpecificUI(context, viewModel),
                    const SizedBox(
                      height: 10,
                    ),
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
                                                color: AppColours.emmanuelBlue),
                                      ),
                                    )),
                              ))
                          .toList(),
          ]
                    )
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
      case ItemType.download:
        return _download(context, viewModel);
      case ItemType.podcast:
        return _podcastPlayer(context, viewModel);
    }

    return Container();
  }

  Widget _download(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.item.url == null) {
      return Container();
    }

    return Center(
      child: GestureDetector(
          onTap: viewModel.openUrl,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColours.emmanuelBlue),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'View Now',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          )),
    );
  }

  Widget _vimeoVideo(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.vimeoVideoId == null) {
      return Container();
    }
    return VimeoVideoWidget(
      videoId: viewModel.vimeoVideoId!,
    );
  }

  Widget _podcastPlayer(BuildContext context, ItemDetailsViewModel viewModel) {
    final details = viewModel.podcastDetails;

    if (details == null) {
      return Container();
    }

    return Column(
      children: [
        if (viewModel.showPodcastDetails && details.title != null) ...[
          Text(details.title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 20),
        ],
        if (viewModel.showPodcastDetails && details.description != null) ...[
          Text(details.description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 20),
        ],
        if (details.audioFileUrl != null)
          AudioWidget(url: details!.audioFileUrl!)
      ],
    );
  }

  Widget _scriptureReading(
      BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.item.scriptureReferences?.isEmpty ?? true) {
      return Container();
    }

    return Column(
        children: viewModel.item.scriptureReferences!.map((ref) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColours.emmanuelBlue,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(50,50,40,20),
                child: Column(
                  children: [
                    Center(
                        child: Text(ref.displayString.toUpperCase() ?? '',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.scriptureCaption(context))),
                    const SizedBox(
                      height: 10,
                    ),
                    StandardButton(
                        onTap: () => viewModel.readScriptureRef(ref),
                        isEnabled: true,
                        text: 'READ'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}

class ItemDetailsArguments {
  final Item item;

  ItemDetailsArguments(this.item);
}
