import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final DateTime value;
  final Function(DateTime) onValueChanged;

  const DateField({required this.value, required this.onValueChanged});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        final firstDate = DateTime.now().subtract(Duration(days: 365 * 2));
        final lastDate = DateTime.now().add(Duration(days: 365 * 4));


        final newValue = await showDatePicker(
            context: context,
            initialDate: value,
            firstDate: value.isBefore(firstDate) ? value : firstDate,
            lastDate: lastDate);

        onValueChanged(newValue ?? value);
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: AppColours.emmanuelBlue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              DateFormat('dd/MM/yyyy').format(value),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }

}