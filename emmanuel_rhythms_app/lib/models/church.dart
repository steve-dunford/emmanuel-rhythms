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
}