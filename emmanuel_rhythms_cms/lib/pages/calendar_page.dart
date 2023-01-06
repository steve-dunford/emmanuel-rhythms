import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
import 'package:emmanuel_rhythms_cms/models/header_command.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/calendar_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/daily_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CalendarViewModel(GetIt.I.get()),
        builder: (context, _) {

          final model = context.watch<CalendarViewModel>();

          _syncEvents(context, model.events);

          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                HeaderWidget(
                  commands: [
                    HeaderCommand(
                        caption: 'Add Item',
                        assetName: Assets.addIcon,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => Dialog(
                                child: DailyContentWidget(
                                    initialContent: DailyContent.defaultContent,
                                    isNewContent: true,
                                dismiss: () => Navigator.pop(context)),
                                backgroundColor: Colors.white,
                              ));
                        }),
                    HeaderCommand(
                        caption: 'Resources',
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(Routes.resources);
                        })
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MonthView(
                      headerStringBuilder: (date, {secondaryDate}) {
                        final formatter = DateFormat('MMM yyyy');
                        return formatter.format(date);
                      },
                      cellAspectRatio: 1.5,
                      onPageChange: (date, page) =>
                        model.setMonth(date),
                      onEventTap: (event, date) {
                        final content = event.event as DailyContent;
                        showDialog(
                            context: context,
                            builder: (ctx) => Dialog(
                              child: DailyContentWidget(
                                  initialContent: content,
                                  dismiss: () => Navigator.pop(context)),
                              backgroundColor: Colors.white,
                            ));
                      },
                    ),
                  )
                )
              ],
            ),
          );
        });
  }

  void _syncEvents(BuildContext context, List<CalendarEventData<DailyContent>> events) {
    final controller = CalendarControllerProvider
        .of(context)
        .controller;

    controller.removeWhere((element) => true);

    controller.addAll(events);
  }
}
