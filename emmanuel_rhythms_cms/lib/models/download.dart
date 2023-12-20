import 'package:emmanuel_rhythms_cms/models/bible_book.dart';
import 'package:emmanuel_rhythms_cms/models/download_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download.freezed.dart';
part 'download.g.dart';

@freezed
class Download with _$Download {
  factory Download(
      {
        required String id,
        required DownloadType downloadType,
        required String filename,
        required String url}) = _Download;

  factory Download.fromJson(Map<String, Object?> json) => _$DownloadFromJson(json);
}
