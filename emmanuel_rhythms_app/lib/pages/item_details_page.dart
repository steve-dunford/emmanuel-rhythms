import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:emmanuel_rhythms_app/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/vimeo_video_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ItemDetailsPage extends StatelessWidget {
  static const route = 'itemDetails';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDetailsArguments;

    return ChangeNotifierProvider(
        create: (_) => ItemDetailsViewModel(args.item),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (viewModel.item.description != null)
                      Html(data: viewModel.item.description),
                    const SizedBox(
                      height: 10,
                    ),
                    _itemSpecificUI(context, viewModel),
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

  Widget _scriptureReading(
      BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.item.scriptureReferences?.isEmpty ?? true) {
      return Container();
    }

    return Column(
        children: viewModel.item.scriptureReferences!.map((ref) {
      return Column(
        children: [
          Center(
              child: Text(ref.displayString ?? '',
                  style: Theme.of(context).textTheme.headline4)),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () => viewModel.readScriptureRef(ref),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColours.emmanuelBlue),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'Read Now',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              )),
          const SizedBox(height: 50,)
        ],
      );
    }).toList());
  }
}

class ItemDetailsArguments {
  final Item item;

  ItemDetailsArguments(this.item);
}
