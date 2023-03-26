import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/pages/item_details_page.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

class ItemListWidget extends StatelessWidget {
  final List<Item> items;

  const ItemListWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items
                .sorted((item1, item2) => item1.isPriority
                    ? -1
                    : item2.isPriority
                        ? 1
                        : 0)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        GetIt.I.get<AnalyticsRepository>().track('content_viewed', {
                          'content_name':item.title,
                          'content_id':item.id,
                          'content_type':item.type.name
                        });

                        Navigator.of(context).pushNamed(
                          ItemDetailsPage.route,
                          arguments: ItemDetailsArguments(item));
                      },
                      child: AspectRatio(
                        aspectRatio: 1.778,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned.fill(child: _itemBackground(item)),
                            Positioned.fill(
                              child: Container(
                                  color: AppColours.itemOverlay,
                                  child: Center(
                                    child: FractionallySizedBox(
                                      widthFactor: 0.6,
                                      child: Text(
                                        item.title.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style:
                                            AppTextStyle.itemCaption(context),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }

  Widget _itemBackground(Item item) => item.backgroundImage != null
      ? Image.network(
          item.backgroundImage!,
          fit: BoxFit.fitWidth,
        )
      : Container(
          color: AppColours.emmanuelBlue,
          child: Image.asset(Assets.emmanuelLogoWhite),
        );
}
