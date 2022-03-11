import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/video_item.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:uuid/uuid.dart';

class Item {
  final String id;
  final ItemType type;
  final String title;
  final String? backgroundImage;
  final List<Tag> tags;
  final DateTime startDate;
  final DateTime? endDate;
  final List<int>? daysOfWeek;

  Item(
      this.id,
      this.type,
      this.title,
      this.backgroundImage,
      this.tags,
      this.startDate,
      this.endDate,
      this.daysOfWeek);

  factory Item.fromDocument(DocumentSnapshot<dynamic> snapshot) {
    final id = snapshot.id;
    Map<String, Object?>? map = snapshot.data();

    final type = map?['type'] as ItemType?;

    if(type != null) {
      switch (type) {
        case ItemType.video:
          return VideoItem.fromMap(id, map!);
      }
    }

    throw Exception('Missing item type');
  }
}
