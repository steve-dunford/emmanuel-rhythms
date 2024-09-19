import 'package:emmanuel_rhythms_cms/models/church_v2.dart';

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

  ChurchV2 toChurchV2() {
    switch(this) {
      case Church.emmanuelLurgan:
        return ChurchV2.emmanuelLurgan;
      case Church.emmanuelPortadown:
        return ChurchV2.emmanuelPortadown;
    }
  }
}