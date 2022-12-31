import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/date_field.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ItemDetailsWidget extends StatefulWidget {
  final Item initialItem;
  final VoidCallback dismiss;

  const ItemDetailsWidget(
      {Key? key, required this.initialItem, required this.dismiss})
      : super(key: key);

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.initialItem!.title;
    descriptionController.text = widget.initialItem!.description ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ItemDetailsViewModel(
            GetIt.I.get(), GetIt.I.get(), widget.initialItem),
        builder: (context, child) {
          final viewModel = context.watch<ItemDetailsViewModel>();

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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Schedule Type:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      DropdownButton<ScheduleTypeOption>(
                                          value: viewModel.scheduleType,
                                          items: viewModel.scheduleTypeOptions
                                              .map((e) => DropdownMenuItem<
                                                      ScheduleTypeOption>(
                                                  value: e,
                                                  child: Text(e.displayName)))
                                              .toList(),
                                          onChanged: viewModel.setScheduleType)
                                    ],
                                  ),
                                  _schduleOptions(context, viewModel)
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Text('Details',
                                style: Theme.of(context).textTheme.headline5),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColours.emmanuelBlue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Title:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      SizedBox(
                                        height: 30,
                                        width: 200,
                                        child: TextField(
                                          controller: titleController,
                                          onChanged: viewModel.setTitle,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Description:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      SizedBox(
                                        width: 300,
                                        height: 120,
                                        child: TextField(
                                          controller: descriptionController,
                                          onChanged: viewModel.setDescription,
                                          maxLines: 4,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Image:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      GestureDetector(
                                        onTap: () async {
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles(allowMultiple: false);

                                          if (result?.count == 1) {
                                            viewModel
                                                .setImage(result!.files.first);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColours.emmanuelBlue)),
                                          width: 300,
                                          height: 120,
                                          child: viewModel.isSettingImage
                                              ? const Center(

                                                child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child:
                                                        CircularProgressIndicator()),
                                              )
                                              : viewModel.item
                                                          .backgroundImage !=
                                                      null
                                                  ? Image.network(viewModel
                                                      .item.backgroundImage!)
                                                  : null,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Item Type:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      DropdownButton<ItemTypeOption>(
                                          value: viewModel.selectedItemType,
                                          items: viewModel.itemTypeOptions
                                              .map((e) {
                                            return DropdownMenuItem<
                                                    ItemTypeOption>(
                                                value: e,
                                                child: Text(e.displayName));
                                          }).toList(),
                                          onChanged: viewModel.setItemType)
                                    ],
                                  ),
                                  _itemTypeOptions(context, viewModel)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 140),
                          child: ThemedButton(
                            onTap: () {
                              widget.dismiss();
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
                              await viewModel.save();
                              widget.dismiss();
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

  Widget _schduleOptions(BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.scheduleType.scheduleType == ScheduleType.oneDay) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Date:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 5),
          DateField(
            value: viewModel.item.startDate,
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
              value: viewModel.item.startDate,
              onValueChanged: viewModel.setStartDate,
            ),
            const SizedBox(width: 30),
            Text(
              'To Date:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 5),
            DateField(
              value: viewModel.item.endDate,
              onValueChanged: viewModel.setEndDate,
            )
          ],
        ),
        if (viewModel.scheduleType.scheduleType == ScheduleType.daysOfWeek)
          Wrap(
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                'Days:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(width: 5),
              ...viewModel.dayOfWeekOptions.map((option) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(option.displayName,
                            style: Theme.of(context).textTheme.bodyText2),
                        Checkbox(
                            value: viewModel.isDayOfWeekSelected(option.day),
                            onChanged: (selected) => viewModel.setDaySelected(
                                option.day, selected ?? false))
                      ],
                    ),
                  ))
            ],
          ),
      ],
    );
  }

  Widget _itemTypeOptions(
      BuildContext context, ItemDetailsViewModel viewModel) {
    return Container();
  }
}
