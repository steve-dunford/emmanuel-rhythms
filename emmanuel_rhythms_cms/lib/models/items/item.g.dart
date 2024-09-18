// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      title: json['title'] as String,
      isPriority: json['isPriority'] as bool,
      sortOrder: json['sortOrder'] as int?,
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
          ?.map((e) => $enumDecode(_$ChurchV2EnumMap, e))
          .toList(),
      churches: (json['churches'] as List<dynamic>)
          .map((e) => $enumDecode(_$ChurchEnumMap, e))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ItemTypeEnumMap[instance.type]!,
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
      'churchesV2':
          instance.churchesV2?.map((e) => _$ChurchV2EnumMap[e]!).toList(),
      'churches': instance.churches.map((e) => _$ChurchEnumMap[e]!).toList(),
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

const _$ItemTypeEnumMap = {
  ItemType.text: 'text',
  ItemType.vimeoVideo: 'vimeoVideo',
  ItemType.youtubeVideo: 'youtubeVideo',
  ItemType.download: 'download',
  ItemType.scripture: 'scripture',
  ItemType.transistorFMPodcast: 'transistorFMPodcast',
  ItemType.soundcloudPodcast: 'soundcloudPodcast',
  ItemType.devotional: 'devotional',
};

const _$ChurchV2EnumMap = {
  ChurchV2.emmanuelLurgan: 'emmanuelLurgan',
  ChurchV2.emmanuelPortadown: 'emmanuelPortadown',
  ChurchV2.journeyLisburn: 'journeyLisburn',
};

const _$ChurchEnumMap = {
  Church.emmanuelLurgan: 'emmanuelLurgan',
  Church.emmanuelPortadown: 'emmanuelPortadown',
};
