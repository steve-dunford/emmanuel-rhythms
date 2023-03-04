import 'package:emmanuel_rhythms_app/style/assets.dart';

enum Church {
  emmanuelLurgan,
  emmanuelPortadown
}

extension ChurchExtensions on Church {
  String get displayName {
    switch(this) {
      case Church.emmanuelLurgan:
        return 'Emmanuel Lurgan';
      case Church.emmanuelPortadown:
        return 'Emmanuel Portadown';
    }
  }

  String get selectedImageName {
    switch(this) {
      case Church.emmanuelLurgan:
        return Assets.lurganSelected;
      case Church.emmanuelPortadown:
        return Assets.portadownSelected;
    }
  }

  String get unselectedImageName {
    switch(this) {
      case Church.emmanuelLurgan:
        return Assets.lurganUnselected;
      case Church.emmanuelPortadown:
        return Assets.portadownUnselected;
    }
  }
}