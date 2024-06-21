import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewDownloadButton extends StatelessWidget {
  final VoidCallback onClick;
  final String caption;

  const ViewDownloadButton({Key? key, required this.onClick, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: onClick,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColours.emmanuelBlue),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                caption,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 14),
              ),
            ),
          )),
    );
  }

}