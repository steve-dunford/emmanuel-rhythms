import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/models/bible_book.dart';
import 'package:emmanuel_rhythms_cms/models/scripture_reference.dart';
import 'package:flutter/material.dart';

class ScriptureReferenceWidget extends StatefulWidget {
  final ScriptureReference initialReference;
  final Function(ScriptureReference) onChanged;
  final Function(ScriptureReference) onDelete;

  const ScriptureReferenceWidget(
      {Key? key, required this.initialReference,
        required this.onChanged,
      required this.onDelete})
      : super(key: key);

  @override
  State<ScriptureReferenceWidget> createState() =>
      _ScriptureReferenceWidgetState();
}

class _ScriptureReferenceWidgetState extends State<ScriptureReferenceWidget> {
  late ScriptureReference reference;

  final chapterFromController = TextEditingController();
  final chapterToController = TextEditingController();
  final verseFromController = TextEditingController();
  final verseToController = TextEditingController();

  @override
  void initState() {
    reference = widget.initialReference;

    chapterFromController.text = reference.fromChapter?.toString() ?? '';
    chapterToController.text = reference.toChapter?.toString() ?? '';
    verseFromController.text = reference.fromVerse?.toString() ?? '';
    verseToController.text = reference.toVerse?.toString() ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<BibleBook>(
              value: widget.initialReference.book,
              onChanged: (book) {
                reference = reference.copyWith(book: book!);
                widget.onChanged(reference);
              },
              items: BibleBook.values.map((e) {
                return DropdownMenuItem<BibleBook>(
                    value: e, child: Text(e.name));
              }).toList()),
          const SizedBox(width: 5),

          SizedBox(
            width: 40,
            child: TextField(
                controller: chapterFromController,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  reference = reference.copyWith(
                      fromChapter: text.isEmpty ? null : int.tryParse(text));
                  widget.onChanged(reference);
                },
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                decoration: AppTextStyle.textInputDecoration('', false,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4))),
          ),
          const SizedBox(width: 2),
          Text(
            ':',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 40,
            child: TextField(
                controller: verseFromController,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  reference = reference.copyWith(
                      fromVerse: text.isEmpty ? null : int.tryParse(text));
                  widget.onChanged(reference);
                },
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                decoration: AppTextStyle.textInputDecoration('', false,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4))),
          ),
          const SizedBox(width: 10),
          Text(
            ' - ',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 40,
            child: TextField(
                controller: chapterToController,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  reference = reference.copyWith(
                      toChapter: text.isEmpty ? null : int.tryParse(text));
                  widget.onChanged(reference);
                },
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                decoration: AppTextStyle.textInputDecoration('', false,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4))),
          ),
          const SizedBox(width: 2),
          Text(
            ':',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 40,
            child: TextField(
                controller: verseToController,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  reference = reference.copyWith(
                      toVerse: text.isEmpty ? null : int.tryParse(text));
                  widget.onChanged(reference);
                },
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                decoration: AppTextStyle.textInputDecoration('', false,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4))),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () => widget.onDelete(reference),
            child: SizedBox(
              width: 40,
              child: Image.asset(Assets.deleteIcon),
            ),
          )
        ],
      ),
    );
  }
}
