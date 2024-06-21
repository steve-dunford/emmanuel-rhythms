import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final bool isProcessing;
  final String text;

  const StandardButton(
      {Key? key,
      required this.onTap,
      required this.isEnabled,
      this.isProcessing = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        constraints: const BoxConstraints(
          maxWidth: 240
        ),
        color: isEnabled ? AppColours.buttonEnabled : AppColours.buttonDisabled,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
          child: Center(
            child: isProcessing
                ? const CircularProgressIndicator(color: AppColours.emmanuelBlue)
                : Text(
                    text,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
          ),
        ),
      ),
    );
  }
}
