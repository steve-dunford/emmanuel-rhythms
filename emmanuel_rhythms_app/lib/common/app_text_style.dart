import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle avenirNext(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontFamily: 'Avenir Next LT Pro',
    ) ??
        const TextStyle();
  }

  static TextStyle avenirNextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontFamily: 'Avenir Next LT Pro',
      fontWeight: FontWeight.bold,
      color: AppColours.emmanuelBlue,
    ) ??
        const TextStyle();
  }

  static TextStyle avenirNextItalic(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      fontFamily: 'Avenir Next LT Pro',
      fontStyle: FontStyle.italic,
      color: AppColours.emmanuelBlue,
    ) ??
        const TextStyle();
  }


  static TextTheme theme(BuildContext context) {
    TextStyle avenirNext = AppTextStyle.avenirNext(context);
    TextStyle avenirNextBold = AppTextStyle.avenirNextBold(context);

    return Theme.of(context).textTheme.copyWith(
      headline1: avenirNextBold.copyWith(fontSize: 40),
      headline2: avenirNextBold.copyWith(fontSize: 34),
      headline3: avenirNextBold.copyWith(fontSize: 28),
      headline4: avenirNextBold.copyWith(fontSize: 24),
      headline5: avenirNextBold.copyWith(fontSize: 22),
      headline6: avenirNextBold.copyWith(fontSize: 20),
      subtitle1: avenirNextBold.copyWith(fontSize: 18),
      subtitle2: avenirNextBold.copyWith(fontSize: 18),
      bodyText1: avenirNext.copyWith(fontSize: 16),
      bodyText2: avenirNext.copyWith(fontSize: 14),
      caption: avenirNext.copyWith(fontSize: 11),
      button: avenirNextBold.copyWith(fontSize: 18),
    );
  }

  static TextStyle itemCaption(BuildContext context) =>
    avenirNext(context).copyWith(color: Colors.white);

  static InputDecoration textInputDecoration(String hint, bool error) => InputDecoration(
    hintText: hint,
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