import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:flutter/material.dart';

class ScriptureButton extends StatelessWidget {
  final String caption;
  final VoidCallback onClick;

  const ScriptureButton({Key? key, required this.caption, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColours.emmanuelBlue,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 40, 20),
              child: Column(
                children: [
                  Center(
                      child: Text(caption,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.scriptureCaption(context))),
                  const SizedBox(
                    height: 10,
                  ),
                  StandardButton(
                      onTap: onClick,
                      isEnabled: true,
                      text: 'READ'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}