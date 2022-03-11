import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:uuid/uuid.dart';

class VideoItem extends Item {
  final String videoUrl;

  VideoItem({
    required String id,
    required String title,
    String? backgroundImage,
    required List<Tag> tags,
    required DateTime startDate,
    DateTime? endDate,
    List<int>? daysOfWeek,
    required this.videoUrl}) : super(
      id,
      ItemType.video,
      title,
      backgroundImage,
      tags,
      startDate,
      endDate,
      daysOfWeek);

  VideoItem copyWith(String? id,
      String? title,
      String? backgroundImage,
      List<Tag>? tags,
      DateTime? startDate,
      DateTime? endDate,
      List<int>? daysOfWeek,
      String? videoUrl) {
    return VideoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        backgroundImage: backgroundImage ?? this.backgroundImage,
        tags: tags ?? this.tags,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        videoUrl: videoUrl ?? this.videoUrl);
  }

  static VideoItem get defaultItem {
    return VideoItem(
        id: const Uuid().toString(),
        title: '',
        tags: [],
        startDate: DateTime.now(),
        videoUrl: '');
  }

  factory VideoItem.fromMap(String id, Map<String, dynamic> map) {
    return VideoItem(
      id: id,
      title: map['title'] as String? ?? '',
      tags: (map['tags'] as List? ?? []).map((e) => e as Tag).toList(),
      startDate: map['startDate'] as DateTime,
      endDate:  map['endDate'] as DateTime?,
      backgroundImage: map['backgroundImage'] as String?,
      daysOfWeek: (map['daysOfWeek'] as List? ?? []).map((e) => e as int).toList(),
      videoUrl: map['videoUrl'] as String? ?? ''
    );
  }
}