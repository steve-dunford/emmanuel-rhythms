import 'dart:async';

import 'package:flutter/material.dart';

List<DateTime> datesBetween(DateTime start, DateTime end) {
  List<DateTime> allDates = [];

  var current = DateTime(start.year, start.month, start.day, 0, 0);

  while(current.isBefore(end)) {
    allDates.add(current);
    current = current.add(const Duration(days: 1));
  }

  return allDates;

}

Future<bool> showConfirmationDialog(BuildContext context, String title, String prompt) {

  final completer = Completer<bool>();

  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text('Cancel'),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
      completer.complete(false);
    },
  );
  Widget continueButton = TextButton(
    child: const Text('Continue'),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
      completer.complete(true);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(prompt),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return completer.future;
}