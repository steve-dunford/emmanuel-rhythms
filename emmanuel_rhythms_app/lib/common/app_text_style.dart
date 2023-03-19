import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle acuminProSemibold(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontFamily: 'Acumin Pro', fontWeight: FontWeight.w600) ??
        const TextStyle();
  }

  static TextStyle montserrat(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
              fontFamily: 'Montserrat',
            ) ??
        const TextStyle();
  }

  static TextStyle montserratMedium(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w500) ??
        const TextStyle();
  }

  static TextStyle montserratLight(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w300) ??
        const TextStyle();
  }

  static TextStyle montserratSemiBold(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontFamily: 'Montserrat', fontWeight: FontWeight.w600) ??
        const TextStyle();
  }

  static TextTheme theme(BuildContext context) {
    TextStyle montserratMedium = AppTextStyle.montserratMedium(context);
    TextStyle montserratLight = AppTextStyle.montserratLight(context);
    TextStyle montserratSemiBold = AppTextStyle.montserratSemiBold(context);

    return Theme.of(context).textTheme.copyWith(
          headline1: montserratMedium.copyWith(
              fontSize: 40, color: AppColours.emmanuelBlue),
          headline2: montserratMedium.copyWith(
              fontSize: 34, color: AppColours.emmanuelBlue),
          headline3: montserratMedium.copyWith(
              fontSize: 20, color: AppColours.emmanuelBlue),
          headline4: montserratMedium.copyWith(
              fontSize: 24, color: AppColours.emmanuelBlue),
          headline5: montserratMedium.copyWith(
              fontSize: 22, color: AppColours.emmanuelBlue),
          headline6: montserratMedium.copyWith(
              fontSize: 20, color: AppColours.emmanuelBlue),
          subtitle1: montserratSemiBold.copyWith(
              fontSize: 18, color: AppColours.emmanuelBlue),
          subtitle2: montserratMedium.copyWith(
              fontSize: 18, color: AppColours.emmanuelBlue),
          bodyText1: montserratLight.copyWith(fontSize: 16),
          bodyText2: montserratMedium.copyWith(fontSize: 14),
          caption: montserratMedium.copyWith(fontSize: 11),
          button: montserratMedium.copyWith(fontSize: 18),
        );
  }

  static TextStyle itemCaption(BuildContext context) =>
      acuminProSemibold(context).copyWith(
        fontSize: 48,
          height: 0.9,
          color: Colors.white);

  static TextStyle scriptureCaption(BuildContext context) =>
      acuminProSemibold(context).copyWith(
          fontSize: 48,
          height: 0.9,
          color: Colors.white);

  static TextStyle menuItemCaption(BuildContext context) =>
      acuminProSemibold(context).copyWith(
          color: AppColours.emmanuelBlue,
          fontSize: 48,
          height: 0.9);

  static InputDecoration textInputDecoration(String hint, bool error) =>
      InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: error
              ? const BorderSide(color: AppColours.emmanuelBlue, width: 3.0)
              : const BorderSide(color: AppColours.emmanuelBlue, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black, width: 1.0)),
      );
}
