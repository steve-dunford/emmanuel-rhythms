import 'package:emmanuel_rhythms_app/models/tag.dart';

extension TagListExtensions on List<Tag> {

  List<Tag> distinct() {
    var idSet = <String>{};
    var distinct = <Tag>[];
    for (var t in this) {
      if (idSet.add(t.id)) {
        distinct.add(t);
      }
    }

    return distinct;
  }
}