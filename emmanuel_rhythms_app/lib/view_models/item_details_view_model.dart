import 'package:emmanuel_rhythms_app/models/bible_book.dart';
import 'package:emmanuel_rhythms_app/models/items/item.dart';
import 'package:emmanuel_rhythms_app/models/scripture_reference.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailsViewModel extends ChangeNotifier {
  final Item item;

  ItemDetailsViewModel(this.item);

  String? scriptureReading() {
    final refs = item.scriptureReferences;
    if(refs != null && refs.isNotEmpty) {

      var buffer = StringBuffer();

      final uniqueBooks = refs.map((r) => r.book).toSet().toList();

      for(final book in uniqueBooks) {
        final refsForBook = refs.where((r) => r.book == book);
        buffer.write('${book.bookName} ');

        bool isFirstRef = true;
        for(final ref in refsForBook) {
          if(!isFirstRef) {
            buffer.write(', ');
          }
          final representation = ref.displayString;
          if(representation == null) {
            buffer.write('(whole book)');
          } else {
            buffer.write(representation);
          }

          isFirstRef = false;
        }
      }

      return buffer.toString();
    }

    return null;
  }

  Future<void> readScriptureRef() async {
    final url =
        Uri.parse('https://bible.com/bible/1/${item.scriptureReferences?.first.youVersionString}');

    if(await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }


}