import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:flutter/material.dart';

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
          children: items.map((item) => AspectRatio(
            aspectRatio: 1.778,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(child: _itemBackground(item)),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColours.semiTransparentBlack,
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,20),
                          child: Text(item.title,
                          style: AppTextStyle.itemCaption(context),),
                        ),
                      ],
                    )
                  )
                ],
              ),
              ),
          ),
          ).toList()
        ),
      ),
    );

  }
  
  Widget _itemBackground(Item item) =>
      item.backgroundImage != null ? Image.network(item.backgroundImage!,fit: BoxFit.fitWidth,) :
          Container(
            color: AppColours.emmanuelBlue,
            child: Image.asset(Assets.emmanuelLogoWhite),
          );

}