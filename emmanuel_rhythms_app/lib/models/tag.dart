enum Tag {
  emmanuelLurgan,
  emmanuelPortadown
}

extension TagExtensions on Tag {

  String get name {
    switch(this) {
      case Tag.emmanuelLurgan:
        return 'Emmanuel Lurgan';
      case Tag.emmanuelPortadown:
        return 'Emmanuel Portadown';
    }
  }
}