// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadImpl _$$DownloadImplFromJson(Map<String, dynamic> json) =>
    _$DownloadImpl(
      id: json['id'] as String,
      downloadType: $enumDecode(_$DownloadTypeEnumMap, json['downloadType']),
      filename: json['filename'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$DownloadImplToJson(_$DownloadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'downloadType': _$DownloadTypeEnumMap[instance.downloadType]!,
      'filename': instance.filename,
      'url': instance.url,
    };

const _$DownloadTypeEnumMap = {
  DownloadType.devotionalAudio: 'devotionalAudio',
  DownloadType.devotionalTranscript: 'devotionalTranscript',
  DownloadType.fileDownload: 'fileDownload',
};
