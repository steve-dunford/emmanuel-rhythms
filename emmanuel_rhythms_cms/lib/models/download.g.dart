// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Download _$$_DownloadFromJson(Map<String, dynamic> json) => _$_Download(
      id: json['id'] as String,
      downloadType: $enumDecode(_$DownloadTypeEnumMap, json['downloadType']),
      filename: json['filename'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_DownloadToJson(_$_Download instance) =>
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
