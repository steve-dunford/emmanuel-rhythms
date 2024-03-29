import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:flutter/material.dart';


class AppTextStyle {
  static TextStyle avenirNext(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontFamily: 'AvenirNext',
    ) ??
        const TextStyle();
  }

  static TextStyle avenirNextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontFamily: 'AvenirNext',
      fontWeight: FontWeight.bold,
    ) ??
        const TextStyle();
  }


  static TextTheme theme(BuildContext context) {
    TextStyle avenirNext = AppTextStyle.avenirNext(context);
    TextStyle avenirNextBold = AppTextStyle.avenirNextBold(context);

    return Theme.of(context).textTheme.copyWith(
      headline1: avenirNextBold.copyWith(fontSize: 70, color: AppColours.emmanuelBlue),
      headline2: avenirNextBold.copyWith(fontSize: 60, color: AppColours.emmanuelBlue),
      headline3: avenirNextBold.copyWith(fontSize: 50, color: AppColours.emmanuelBlue),
      headline4: avenirNextBold.copyWith(fontSize: 45, color: AppColours.emmanuelBlue),
      headline5: avenirNextBold.copyWith(fontSize: 38, color: AppColours.emmanuelBlue, fontWeight: FontWeight.bold),
      headline6: avenirNextBold.copyWith(fontSize: 24, color: AppColours.emmanuelBlue),
      subtitle1: avenirNextBold.copyWith(fontSize: 22),
      subtitle2: avenirNextBold.copyWith(fontSize: 18),
      bodyText1: avenirNext.copyWith(fontSize: 16, color: AppColours.emmanuelBlue),
      bodyText2: avenirNext.copyWith(fontSize: 14, color: AppColours.emmanuelBlue),
      caption: avenirNext.copyWith(fontSize: 11),
      button: avenirNextBold.copyWith(fontSize: 18),
    );
  }

  static InputDecoration textInputDecoration(String hint, bool error, {EdgeInsetsGeometry? contentPadding}) => InputDecoration(
    hintText: hint,
    contentPadding: contentPadding,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: error ?
      const BorderSide(color: AppColours.emmanuelBlue, width: 3.0) :
      const BorderSide(color: AppColours.emmanuelBlue, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide:
        const BorderSide(color: Colors.black, width: 1.0)
    ),
  );
}