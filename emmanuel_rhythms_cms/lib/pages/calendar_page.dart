import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
import 'package:emmanuel_rhythms_cms/models/header_command.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/view_models/calendar_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/item_details_widget.dart';
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
                                child: ItemDetailsWidget(
                                    initialItem: Item.defaultItem,
                                    isNewItem: true,
                                dismiss: () => Navigator.pop(context)),
                                backgroundColor: Colors.white,
                              ));
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
                        final item = event.event as Item;
                        showDialog(
                            context: context,
                            builder: (ctx) => Dialog(
                              child: ItemDetailsWidget(
                                  initialItem: item,
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

  void _syncEvents(BuildContext context, List<CalendarEventData<Item>> events) {
    final controller = CalendarControllerProvider
        .of(context)
        .controller;

    controller.removeWhere((element) => true);

    controller.addAll(events);
  }
}
