import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:flutter/material.dart';

class ThemedButton extends StatelessWidget {

  final VoidCallback onTap;
  final bool isEnabled;
  final bool isRunningOperation;
  final String text;
  final double height;

  const ThemedButton({
    required this.onTap,
    required this.text,
    this.isEnabled = true,
    this.height = 60.0,
    this.isRunningOperation = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isEnabled ? onTap : null,
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.5,
          child: Container(
            height: height,
            decoration: BoxDecoration(
                color: AppColours.emmanuelBlue,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        ),
      ),
    );
  }


}