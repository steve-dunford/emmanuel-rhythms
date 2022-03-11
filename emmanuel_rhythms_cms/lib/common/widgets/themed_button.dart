import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:flutter/material.dart';

class ThemedButton extends StatelessWidget {

  final VoidCallback onTap;
  final bool isRunningOperation;
  final String text;

  const ThemedButton({
    required this.onTap,
    required this.text,
    this.isRunningOperation = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: AppColours.emmanuelBlue,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child:
              isRunningOperation ?
              const CircularProgressIndicator(color: Colors.white) :
            Text(text, style: AppTextStyle
                .theme(context)
                .bodyText1!
                .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }


}