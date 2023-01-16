// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scripture_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScriptureReference _$$_ScriptureReferenceFromJson(
        Map<String, dynamic> json) =>
    _$_ScriptureReference(
      id: json['id'] as String,
      book: $enumDecode(_$BibleBookEnumMap, json['book']),
      fromChapter: json['fromChapter'] as int?,
      toChapter: json['toChapter'] as int?,
      fromVerse: json['fromVerse'] as int?,
      toVerse: json['toVerse'] as int?,
    );

Map<String, dynamic> _$$_ScriptureReferenceToJson(
        _$_ScriptureReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book': _$BibleBookEnumMap[instance.book]!,
      'fromChapter': instance.fromChapter,
      'toChapter': instance.toChapter,
      'fromVerse': instance.fromVerse,
      'toVerse': instance.toVerse,
    };

const _$BibleBookEnumMap = {
  BibleBook.genesis: 'genesis',
  BibleBook.exodus: 'exodus',
  BibleBook.leviticus: 'leviticus',
  BibleBook.numbers: 'numbers',
  BibleBook.deuteronomy: 'deuteronomy',
  BibleBook.joshua: 'joshua',
  BibleBook.judges: 'judges',
  BibleBook.ruth: 'ruth',
  BibleBook.samuel1: 'samuel1',
  BibleBook.samuel2: 'samuel2',
  BibleBook.kings1: 'kings1',
  BibleBook.kings2: 'kings2',
  BibleBook.chronicles1: 'chronicles1',
  BibleBook.chronicles2: 'chronicles2',
  BibleBook.ezra: 'ezra',
  BibleBook.nehemiah: 'nehemiah',
  BibleBook.esther: 'esther',
  BibleBook.job: 'job',
  BibleBook.psalms: 'psalms',
  BibleBook.proverbs: 'proverbs',
  BibleBook.ecclesiastes: 'ecclesiastes',
  BibleBook.songOfSongs: 'songOfSongs',
  BibleBook.isaiah: 'isaiah',
  BibleBook.jeremiah: 'jeremiah',
  BibleBook.lamentations: 'lamentations',
  BibleBook.ezekiel: 'ezekiel',
  BibleBook.daniel: 'daniel',
  BibleBook.hosea: 'hosea',
  BibleBook.joel: 'joel',
  BibleBook.amos: 'amos',
  BibleBook.obadiah: 'obadiah',
  BibleBook.jonah: 'jonah',
  BibleBook.micah: 'micah',
  BibleBook.nahum: 'nahum',
  BibleBook.habakkuk: 'habakkuk',
  BibleBook.zephaniah: 'zephaniah',
  BibleBook.haggai: 'haggai',
  BibleBook.zechariah: 'zechariah',
  BibleBook.malachi: 'malachi',
  BibleBook.matthew: 'matthew',
  BibleBook.mark: 'mark',
  BibleBook.luke: 'luke',
  BibleBook.john: 'john',
  BibleBook.acts: 'acts',
  BibleBook.romans: 'romans',
  BibleBook.corinthians1: 'corinthians1',
  BibleBook.corinthians2: 'corinthians2',
  BibleBook.galatians: 'galatians',
  BibleBook.ephesians: 'ephesians',
  BibleBook.philippians: 'philippians',
  BibleBook.colossians: 'colossians',
  BibleBook.thessalonians1: 'thessalonians1',
  BibleBook.thessalonians2: 'thessalonians2',
  BibleBook.timothy1: 'timothy1',
  BibleBook.timothy2: 'timothy2',
  BibleBook.titus: 'titus',
  BibleBook.philemon: 'philemon',
  BibleBook.hebrews: 'hebrews',
  BibleBook.james: 'james',
  BibleBook.peter1: 'peter1',
  BibleBook.peter2: 'peter2',
  BibleBook.john1: 'john1',
  BibleBook.john2: 'john2',
  BibleBook.john3: 'john3',
  BibleBook.jude: 'jude',
  BibleBook.revelation: 'revelation',
};
