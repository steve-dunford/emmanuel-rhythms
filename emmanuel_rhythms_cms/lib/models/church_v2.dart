import 'package:emmanuel_rhythms_cms/models/church.dart';

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
        return 'Journey Lisburn';
    }
  }

  Church? toLegacyChurch() {
    switch(this) {
      case ChurchV2.emmanuelLurgan:
        return Church.emmanuelLurgan;
      case ChurchV2.emmanuelPortadown:
        return Church.emmanuelPortadown;
    }

    return null;
  }
}