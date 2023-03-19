import 'package:emmanuel_rhythms_app/models/tag.dart';

class ResourceCategory {
  final Tag? tag;

  ResourceCategory(this.tag);

  String get caption =>
      tag?.name ?? 'Other';
}