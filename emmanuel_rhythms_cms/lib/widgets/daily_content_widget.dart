import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/utils.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/date_field.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/models/items/daily_content.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/items/schedule_type.dart';
import 'package:emmanuel_rhythms_cms/view_models/daily_content_view_model.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/item_details_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class DailyContentWidget extends StatelessWidget {
  final DailyContent initialContent;
  final bool isNewContent;
  final VoidCallback dismiss;

  const DailyContentWidget(
      {Key? key,
      required this.initialContent,
      this.isNewContent = false,
      required this.dismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DailyContentViewModel(
                GetIt.I.get(), initialContent, isNewContent),
          ),
          ChangeNotifierProvider(
            create: (_) => ItemDetailsViewModel(
                GetIt.I.get(), initialContent.item),
          ),
        ],
        builder: (context, child) {
          final viewModel = context.watch<DailyContentViewModel>();
          final itemViewModel = context.watch<ItemDetailsViewModel>();

          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          children: [
                            Text('Schedule',
                                style: Theme.of(context).textTheme.headline5),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColours.emmanuelBlue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Schedule Type:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColours.emmanuelBlue),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: DropdownButton<
                                                    ScheduleTypeOption>(
                                                underline: Container(),
                                                value: viewModel.scheduleType,
                                                items: viewModel
                                                    .scheduleTypeOptions
                                                    .map((e) => DropdownMenuItem<
                                                            ScheduleTypeOption>(
                                                        value: e,
                                                        child: Text(
                                                            e.displayName)))
                                                    .toList(),
                                                onChanged:
                                                    viewModel.setScheduleType),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    _schduleOptions(context, viewModel)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ItemDetailsWidget(
                                initialItem: viewModel.content.item)
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 140),
                          child: ThemedButton(
                            onTap: () async {
                              bool confirm = await showConfirmationDialog(
                                  context,
                                  'Delete Item',
                                  'Are you sure you want to delete the current item?');

                              if (confirm) {
                                viewModel.delete();
                                dismiss();
                              }
                            },
                            text: 'Delete',
                            height: 30,
                            isEnabled: viewModel.canDelete,
                          ),
                        ),
                        const Spacer(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 140),
                          child: ThemedButton(
                            onTap: () {
                              dismiss();
                            },
                            text: 'Cancel',
                            height: 30,
                          ),
                        ),
                        const SizedBox(width: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 140),
                          child: ThemedButton(
                            onTap: () async {
                              viewModel.setItem(itemViewModel.item);
                              await viewModel.save();
                              dismiss();
                            },
                            text: 'Save',
                            height: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _schduleOptions(
      BuildContext context, DailyContentViewModel viewModel) {
    if (viewModel.scheduleType.scheduleType == ScheduleType.oneDay) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Date:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 10),
          DateField(
            value: viewModel.content.startDate,
            onValueChanged: viewModel.setStartDate,
          )
        ],
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From Date:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 5),
            DateField(
              value: viewModel.content.startDate,
              onValueChanged: viewModel.setStartDate,
            ),
            const SizedBox(width: 30),
            Text(
              'To Date:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 5),
            DateField(
              value: viewModel.content.endDate,
              onValueChanged: viewModel.setEndDate,
            )
          ],
        ),
        if (viewModel.scheduleType.scheduleType == ScheduleType.daysOfWeek)
          Column(
            children: [
              const SizedBox(height: 20),
              Wrap(
                  runAlignment: WrapAlignment.center,
                  children: viewModel.dayOfWeekOptions
                      .map((option) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(option.displayName,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Checkbox(
                                    value: viewModel
                                        .isDayOfWeekSelected(option.day),
                                    onChanged: (selected) =>
                                        viewModel.setDaySelected(
                                            option.day, selected ?? false))
                              ],
                            ),
                          ))
                      .toList()),
            ],
          ),
      ],
    );
  }
}
