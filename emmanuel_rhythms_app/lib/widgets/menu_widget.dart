import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:flutter/material.dart';

import '../common/app_colours.dart';

class MenuWidget extends StatelessWidget {
  final List<MenuEntry> menuItems;
  final VoidCallback onClose;

  const MenuWidget({Key? key, required this.menuItems, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.menuBackground,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onClose,
                child: Container(
                  width: 50,
                  height: 50,
                  color: AppColours.midGrey,
                  child: Image.asset(Assets.closeIcon)
                ),
              ),
            ],
          ),
        const SizedBox(height: 50),
        ...menuItems.map((item) => _MenuItemWidget(menuItem: item))
            .toList(),
        ]

      ),
    );
  }
}

class _MenuItemWidget extends StatelessWidget {
  final MenuEntry menuItem;

  const _MenuItemWidget({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: menuItem.onSelected,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                menuItem.text,
              style: AppTextStyle.menuItemCaption(context),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Image.asset(Assets.rightIcon),
            )
          ],
        ),
      ),
    );
  }

}

class MenuEntry {
  final VoidCallback onSelected;
  final String text;

  MenuEntry(this.text, this.onSelected);
}