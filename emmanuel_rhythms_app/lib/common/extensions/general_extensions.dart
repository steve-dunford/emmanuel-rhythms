extension NullableStringExtensions on int? {
  bool get isNullOrZero => this == null || this == 0;
}