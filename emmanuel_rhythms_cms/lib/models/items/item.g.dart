// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      url: json['url'] as String?,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => $enumDecode(_$TagEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'url': instance.url,
      'tags': instance.tags.map((e) => _$TagEnumMap[e]!).toList(),
    };

const _$ItemTypeEnumMap = {
  ItemType.video: 'video',
  ItemType.scripture: 'scripture',
  ItemType.podcast: 'podcast',
};

const _$TagEnumMap = {
  Tag.emmanuelLurgan: 'emmanuelLurgan',
  Tag.emmanuelPortadown: 'emmanuelPortadown',
};
