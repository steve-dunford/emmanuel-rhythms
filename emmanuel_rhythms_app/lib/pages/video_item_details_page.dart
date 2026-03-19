import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/items/item_type.dart';
import 'package:emmanuel_rhythms_app/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItemDetailsPage extends StatefulWidget {
  static const route = 'videoItemDetails';

  const VideoItemDetailsPage({Key? key}) : super(key: key);

  @override
  State<VideoItemDetailsPage> createState() => _VideoItemDetailsPageState();
}

class _VideoItemDetailsPageState extends State<VideoItemDetailsPage> {
  YoutubePlayerController? _youtubeController;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final args =
        ModalRoute.of(context)!.settings.arguments as VideoItemDetailsArguments;

    final item = args.item;

    if (item.type == ItemType.youtubeVideo && item.url != null) {
      final youtubeVideoId = _extractYouTubeVideoId(item.url!);
      if (youtubeVideoId != null) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: youtubeVideoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
          ),
        );
      }
    }

    _initialized = true;
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as VideoItemDetailsArguments;

    final viewModel = ItemDetailsViewModel(
      GetIt.I.get(),
      GetIt.I.get(),
      args.item,
    );


    // YouTube: wrap the entire page in YoutubePlayerBuilder.
    if (viewModel.item.type == ItemType.youtubeVideo &&
        _youtubeController != null) {
      return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _youtubeController!),
        onEnterFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersiveSticky,
          );
        },
        onExitFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        },
        builder: (context, player) {
          return _buildScaffold(
            context,
            viewModel,
            videoWidget: Center(child: player),
          );
        },
      );
    }

    // Vimeo (or unsupported video types): open the URL.
    if (viewModel.item.type == ItemType.vimeoVideo) {
      return _buildScaffold(
        context,
        viewModel,
        videoWidget: viewModel.item.url == null
            ? const SizedBox.shrink()
            : StandardButton(
                text: 'OPEN VIDEO',
                isEnabled: true,
                onTap: () => viewModel.openLink(viewModel.item.url),
              ),
      );
    }

    return _buildScaffold(context, viewModel);

  }

  Widget _buildScaffold(
    BuildContext context,
    ItemDetailsViewModel viewModel, {
    Widget? videoWidget,
  }) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColours.emmanuelBlue,
        centerTitle: true,
        title: Text(
          viewModel.pageTitle.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              if (viewModel.item.description != null)
                Html(
                  data: viewModel.item.description,
                  onLinkTap: (link, map, element) {
                    viewModel.openLink(link);
                  },
                ),
              const SizedBox(height: 10),
              videoWidget ?? const SizedBox.shrink(),
              const SizedBox(height: 10),
              if (viewModel.item.tags.isNotEmpty)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('TAGS: '),
                    ...viewModel.item.tags.map(
                      (tag) => Padding(
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
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColours.emmanuelBlue,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  String? _extractYouTubeVideoId(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return null;
    return trimmed.substring(trimmed.lastIndexOf('/') + 1);
  }
}

class VideoItemDetailsArguments {
  final Item item;

  VideoItemDetailsArguments(this.item);
}

