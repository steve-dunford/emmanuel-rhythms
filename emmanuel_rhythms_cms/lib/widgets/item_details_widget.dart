import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ItemDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ItemDetailsViewModel(GetIt.I.get(), Item.defaultItem),
        builder: (context, child) {
          final viewModel = context.watch<ItemDetailsViewModel>();

          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                Text('Schedule', style: Theme.of(context).textTheme.subtitle1),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColours.emmanuelBlue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Schedule Type:',
                              style: Theme.of(context).textTheme.bodyText1),
                          DropdownButton<ScheduleTypeOption>(
                              items: viewModel.scheduleTypeOptions
                                  .map((e) => DropdownMenuItem<ScheduleTypeOption>(
                                  value: e,
                                  child: Text(e.displayName)))
                                  .toList(),
                              onChanged: viewModel.setScheduleType)
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Item Type',
                        style: Theme.of(context).textTheme.bodyText1),
                    //DropdownButton(items: items, onChanged: onChanged)
                  ],
                ),
              ],
            ),
          );
        });
  }
}
