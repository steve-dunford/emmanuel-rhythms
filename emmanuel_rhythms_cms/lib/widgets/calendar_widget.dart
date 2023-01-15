import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  final List<CalendarEventData<DailyContent>> events;
  final Function(DailyContent) onEventTap;
  final Function(DateTime) onPageChanged;

  const CalendarWidget(
      {Key? key,
      required this.events,
      required this.onEventTap,
      required this.onPageChanged})
      : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  void didUpdateWidget(covariant CalendarWidget oldWidget) {
    _syncEvents(widget.events);
    super.didUpdateWidget(oldWidget);
  }

  void _syncEvents(List<CalendarEventData<DailyContent>> events) {
    final controller = CalendarControllerProvider.of(context).controller;

    controller.removeWhere((element) => true);

    controller.addAll(events);
  }

  @override
  Widget build(BuildContext context) {
    return MonthView(
      headerStringBuilder: (date, {secondaryDate}) {
        final formatter = DateFormat('MMM yyyy');
        return formatter.format(date);
      },
      cellAspectRatio: 1.5,
      onPageChange: (date, page) => widget.onPageChanged(date),
      onEventTap: (event, date) {
        final content = event.event as DailyContent;
        widget.onEventTap(content);
      },
    );
  }
}
