import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:flutter/material.dart';

@immutable

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
      headline5: avenirNextBold.copyWith(fontSize: 38, color: AppColours.emmanuelBlue),
      headline6: avenirNextBold.copyWith(fontSize: 32, color: AppColours.emmanuelBlue),
      subtitle1: avenirNextBold.copyWith(fontSize: 24),
      subtitle2: avenirNextBold.copyWith(fontSize: 18),
      bodyText1: avenirNext.copyWith(fontSize: 16),
      bodyText2: avenirNext.copyWith(fontSize: 14),
      caption: avenirNext.copyWith(fontSize: 11),
      button: avenirNextBold.copyWith(fontSize: 18),
    );
  }
}