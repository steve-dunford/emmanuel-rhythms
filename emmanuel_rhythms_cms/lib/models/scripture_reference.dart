import 'package:emmanuel_rhythms_cms/models/bible_book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scripture_reference.freezed.dart';
part 'scripture_reference.g.dart';

@freezed
class ScriptureReference with _$ScriptureReference {
  factory ScriptureReference(
      {
        required String id,
        required BibleBook book,
        int? fromChapter,
        int? toChapter,
        int? fromVerse,
        int? toVerse}) = _ScriptureReference;

  factory ScriptureReference.fromJson(Map<String, Object?> json) => _$ScriptureReferenceFromJson(json);
}
