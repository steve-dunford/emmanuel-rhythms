// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String,
      type: const ItemTypeConverter().fromJson(json['type'] as String),
      title: json['title'] as String,
      isPriority: json['isPriority'] as bool,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
      description: json['description'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      url: json['url'] as String?,
      downloadFilename: json['downloadFilename'] as String?,
      usePodcastDetails: json['usePodcastDetails'] as bool?,
      scriptureReferences: (json['scriptureReferences'] as List<dynamic>?)
          ?.map((e) => ScriptureReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      downloads: (json['downloads'] as List<dynamic>?)
          ?.map((e) => Download.fromJson(e as Map<String, dynamic>))
          .toList(),
      churchesV2: (json['churchesV2'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      churches:
          (json['churches'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const ItemTypeConverter().toJson(instance.type),
      'title': instance.title,
      'isPriority': instance.isPriority,
      'sortOrder': instance.sortOrder,
      'description': instance.description,
      'backgroundImage': instance.backgroundImage,
      'url': instance.url,
      'downloadFilename': instance.downloadFilename,
      'usePodcastDetails': instance.usePodcastDetails,
      'scriptureReferences':
          instance.scriptureReferences?.map((e) => e.toJson()).toList(),
      'downloads': instance.downloads?.map((e) => e.toJson()).toList(),
      'churchesV2': instance.churchesV2,
      'churches': instance.churches,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };
