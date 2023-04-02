enum BibleBook {
  genesis,
  exodus,
  leviticus,
  numbers,
  deuteronomy,
  joshua,
  judges,
  ruth,
  samuel1,
  samuel2,
  kings1,
  kings2,
  chronicles1,
  chronicles2,
  ezra,
  nehemiah,
  esther,
  job,
  psalms,
  proverbs,
  ecclesiastes,
  songOfSongs,
  isaiah,
  jeremiah,
  lamentations,
  ezekiel,
  daniel,
  hosea,
  joel,
  amos,
  obadiah,
  jonah,
  micah,
  nahum,
  habakkuk,
  zephaniah,
  haggai,
  zechariah,
  malachi,
  matthew,
  mark,
  luke,
  john,
  acts,
  romans,
  corinthians1,
  corinthians2,
  galatians,
  ephesians,
  philippians,
  colossians,
  thessalonians1,
  thessalonians2,
  timothy1,
  timothy2,
  titus,
  philemon,
  hebrews,
  james,
  peter1,
  peter2,
  john1,
  john2,
  john3,
  jude,
  revelation
}

extension BibleBookExtensions on BibleBook {
  String get bookName {
    switch (this) {
      case BibleBook.genesis:
        return 'Gensis';
      case BibleBook.exodus:
        return 'Exodus';
      case BibleBook.leviticus:
        return 'Leviticus';
      case BibleBook.numbers:
        return 'Numbers';
      case BibleBook.deuteronomy:
        return 'Deuteronomy';
      case BibleBook.joshua:
        return 'Joshua';
      case BibleBook.judges:
        return 'Judges';
      case BibleBook.ruth:
        return 'Ruth';
      case BibleBook.samuel1:
        return '1 Samuel';
      case BibleBook.samuel2:
        return '2 Samuel';
      case BibleBook.kings1:
        return '1 Kings';
      case BibleBook.kings2:
        return '2 Kings';
      case BibleBook.chronicles1:
        return '1 Chronicles';
      case BibleBook.chronicles2:
        return '2 Chronicles';
      case BibleBook.ezra:
        return 'Ezra';
      case BibleBook.nehemiah:
        return 'Nehemiah';
      case BibleBook.esther:
        return 'Esther';
      case BibleBook.job:
        return 'Job';
      case BibleBook.psalms:
        return 'Psalms';
      case BibleBook.proverbs:
        return 'Proverbs';
      case BibleBook.ecclesiastes:
        return 'Ecclesiastes';
      case BibleBook.songOfSongs:
        return 'Song of Songs';
      case BibleBook.isaiah:
        return 'Isaiah';
      case BibleBook.jeremiah:
        return 'Jeremiah';
      case BibleBook.lamentations:
        return 'Lamentations';
      case BibleBook.ezekiel:
        return 'Ezehiel';
      case BibleBook.daniel:
        return 'Daniel';
      case BibleBook.hosea:
        return 'Hosea';
      case BibleBook.joel:
        return 'Joel';
      case BibleBook.amos:
        return 'Amos';
      case BibleBook.obadiah:
        return 'Obadiah';
      case BibleBook.jonah:
        return 'Jonah';
      case BibleBook.micah:
        return 'Micah';
      case BibleBook.nahum:
        return 'Nahum';
      case BibleBook.habakkuk:
        return 'Habakkuk';
      case BibleBook.zephaniah:
        return 'Zephaniah';
      case BibleBook.haggai:
        return 'Haggai';
      case BibleBook.zechariah:
        return 'Zechariah';
      case BibleBook.malachi:
        return 'Malachi';
      case BibleBook.matthew:
        return 'Matthew';
      case BibleBook.mark:
        return 'Mark';
      case BibleBook.luke:
        return 'Luke';
      case BibleBook.john:
        return 'John';
      case BibleBook.acts:
        return 'Acts';
      case BibleBook.romans:
        return 'Romans';
      case BibleBook.corinthians1:
        return '1 Corinthians';
      case BibleBook.corinthians2:
        return '2 Corinthians';
      case BibleBook.galatians:
        return 'Galatians';
      case BibleBook.ephesians:
        return 'Ephesians';
      case BibleBook.philippians:
        return 'Philippians';
      case BibleBook.colossians:
        return 'Colossians';
      case BibleBook.thessalonians1:
        return '1 Thessalonians';
      case BibleBook.thessalonians2:
        return '2 Thessalonians';
      case BibleBook.timothy1:
        return '1 Timothy';
      case BibleBook.timothy2:
        return '2 Timothy';
      case BibleBook.titus:
        return 'Titus';
      case BibleBook.philemon:
        return 'Philemon';
      case BibleBook.hebrews:
        return 'Hebrews';
      case BibleBook.james:
        return 'James';
      case BibleBook.peter1:
        return '1 Peter';
      case BibleBook.peter2:
        return '2 Peter';
      case BibleBook.john1:
        return '1 John';
      case BibleBook.john2:
        return '2 John';
      case BibleBook.john3:
        return '3 John';
      case BibleBook.jude:
        return 'Jude';
      case BibleBook.revelation:
        return 'Revelation';
    }
  }

  String get youversionCode {
    switch (this) {
      case BibleBook.genesis:
        return 'GEN';
      case BibleBook.exodus:
        return 'EXO';
      case BibleBook.leviticus:
        return 'LEV';
      case BibleBook.numbers:
        return 'NUM';
      case BibleBook.deuteronomy:
        return 'DEU';
      case BibleBook.joshua:
        return 'JOS';
      case BibleBook.judges:
        return 'JDG';
      case BibleBook.ruth:
        return 'RUT';
      case BibleBook.samuel1:
        return '1SA';
      case BibleBook.samuel2:
        return '2SA';
      case BibleBook.kings1:
        return '1KI';
      case BibleBook.kings2:
        return '2KI';
      case BibleBook.chronicles1:
        return '1CH';
      case BibleBook.chronicles2:
        return '2CH';
      case BibleBook.ezra:
        return 'EZR';
      case BibleBook.nehemiah:
        return 'NEH';
      case BibleBook.esther:
        return 'EST';
      case BibleBook.job:
        return 'JOB';
      case BibleBook.psalms:
        return 'PSA';
      case BibleBook.proverbs:
        return 'PRO';
      case BibleBook.ecclesiastes:
        return 'ECC';
      case BibleBook.songOfSongs:
        return 'SNG';
      case BibleBook.isaiah:
        return 'ISA';
      case BibleBook.jeremiah:
        return 'JER';
      case BibleBook.lamentations:
        return 'LAM';
      case BibleBook.ezekiel:
        return 'EZK';
      case BibleBook.daniel:
        return 'DAN';
      case BibleBook.hosea:
        return 'HOS';
      case BibleBook.joel:
        return 'JOL';
      case BibleBook.amos:
        return 'AMO';
      case BibleBook.obadiah:
        return 'OBA';
      case BibleBook.jonah:
        return 'JON';
      case BibleBook.micah:
        return 'MIC';
      case BibleBook.nahum:
        return 'NAM';
      case BibleBook.habakkuk:
        return 'HAB';
      case BibleBook.zephaniah:
        return 'ZEP';
      case BibleBook.haggai:
        return 'HAG';
      case BibleBook.zechariah:
        return 'ZEC';
      case BibleBook.malachi:
        return 'MAL';
      case BibleBook.matthew:
        return 'MAT';
      case BibleBook.mark:
        return 'MRK';
      case BibleBook.luke:
        return 'LUK';
      case BibleBook.john:
        return 'JHN';
      case BibleBook.acts:
        return 'ACT';
      case BibleBook.romans:
        return 'ROM';
      case BibleBook.corinthians1:
        return '1CO';
      case BibleBook.corinthians2:
        return '2CO';
      case BibleBook.galatians:
        return 'GAL';
      case BibleBook.ephesians:
        return 'EPH';
      case BibleBook.philippians:
        return 'PHP';
      case BibleBook.colossians:
        return 'COL';
      case BibleBook.thessalonians1:
        return '1TH';
      case BibleBook.thessalonians2:
        return '2TH';
      case BibleBook.timothy1:
        return '1TI';
      case BibleBook.timothy2:
        return '2TI';
      case BibleBook.titus:
        return 'TIT';
      case BibleBook.philemon:
        return 'PHM';
      case BibleBook.hebrews:
        return 'BEH';
      case BibleBook.james:
        return 'JAS';
      case BibleBook.peter1:
        return '1PE';
      case BibleBook.peter2:
        return '2PE';
      case BibleBook.john1:
        return '1JN';
      case BibleBook.john2:
        return '2JN';
      case BibleBook.john3:
        return '3JN';
      case BibleBook.jude:
        return 'JUD';
      case BibleBook.revelation:
        return 'REV';
    }
  }
}
