import 'package:emmanuel_rhythms_app/style/assets.dart';

enum ChurchV2 {
  emmanuelLurgan,
  emmanuelPortadown,
  journeyLisburn
}

extension ChurchExtensions on ChurchV2 {
  String get displayName {
    switch(this) {
      case ChurchV2.emmanuelLurgan:
        return 'Emmanuel Lurgan';
      case ChurchV2.emmanuelPortadown:
        return 'Emmanuel Portadown';
      case ChurchV2.journeyLisburn:
        return 'The Journey';
    }
  }

  String get selectedImageName {
    switch(this) {
      case ChurchV2.emmanuelLurgan:
        return Assets.lurganSelected;
      case ChurchV2.emmanuelPortadown:
        return Assets.portadownSelected;
      case ChurchV2.journeyLisburn:
        return Assets.lurganSelected;
    }
  }

  String get unselectedImageName {
    switch(this) {
      case ChurchV2.emmanuelLurgan:
        return Assets.lurganUnselected;
      case ChurchV2.emmanuelPortadown:
        return Assets.portadownUnselected;
      case ChurchV2.journeyLisburn:
        return Assets.lurganUnselected;
    }
  }
}