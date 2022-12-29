import 'package:cell_calendar/cell_calendar.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
import 'package:emmanuel_rhythms_cms/view_models/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CalendarViewModel(GetIt.I.get()),
        builder: (context, _) {

          final model = context.watch<CalendarViewModel>();

          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                HeaderWidget(),
                CellCalendar(
                  events: model.events,
                )
              ],
            ),
          );
        });
  }
}
