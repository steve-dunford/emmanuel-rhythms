import 'package:emmanuel_rhythms_app/models/bible_book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:emmanuel_rhythms_app/common/extensions/general_extensions.dart';

part 'scripture_reference.freezed.dart';

part 'scripture_reference.g.dart';

@freezed
class ScriptureReference with _$ScriptureReference {
  factory ScriptureReference({
    required String id,
    required BibleBook book,
    int? fromChapter,
    int? toChapter,
    int? fromVerse,
    int? toVerse}) = _ScriptureReference;

  factory ScriptureReference.fromJson(Map<String, Object?> json) =>
      _$ScriptureReferenceFromJson(json);
}

extension ScriptureReferenceExtensions on ScriptureReference {
  String get displayString =>
    book.bookName + (chapterAndVerse == null ? '' : ' $chapterAndVerse');
    String? get chapterAndVerse {

    if (fromChapter.isNullOrZero) {
      if (fromVerse.isNullOrZero) {
        return null;
      } else {
        if (toVerse.isNullOrZero) {
          return 'verse $fromVerse';
        } else {
          return 'verses $fromVerse - $toVerse';
        }
      }
    }
    else {
      if(fromVerse.isNullOrZero) {
        if(toChapter.isNullOrZero) {
          return 'chapter $fromChapter';
        } else {
          return 'chapters $fromChapter - $toChapter';
        }
      } else {
        if(toChapter.isNullOrZero) {
          if(toVerse.isNullOrZero) {
            return '$fromChapter:$fromVerse';
          } else {
            return '$fromChapter:$fromVerse-$toVerse';
          }
        } else if(fromChapter == toChapter) {
          return '$fromChapter:$fromVerse-$toVerse';
        } else {
          return '$fromChapter:$fromVerse-$toChapter:$toVerse';
        }
      }
    }
  }

  String? get verseRange {
    if(fromVerse == null) {
      return null;
    }
    if(toVerse == null) {
      return fromVerse!.toString();
    } else {
      return '$fromVerse-$toVerse';
    }
  }
  String? get youVersionString {
    final chapter = fromChapter.isNullOrZero ? '1' : fromChapter.toString();

    if(verseRange == null) {
      return '${book.youversionCode}.$chapter.NIVUK';
    }
    return '${book.youversionCode}.$chapter.$verseRange.NIVUK';
  }

}