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
import 'package:emmanuel_rhythms_cms/view_models/resource_details_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/item_details_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ResourceDetailsWidget extends StatelessWidget {
  final Item initialResource;
  final bool isNewResource;
  final VoidCallback dismiss;

  const ResourceDetailsWidget(
      {Key? key,
        required this.initialResource,
        this.isNewResource = false,
        required this.dismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ResourceDetailsViewModel(
                GetIt.I.get(), initialResource, isNewResource),
          ),
          ChangeNotifierProvider(
            create: (_) => ItemDetailsViewModel(
                GetIt.I.get(), initialResource),
          ),
        ],
        builder: (context, child) {
          final viewModel = context.watch<ResourceDetailsViewModel>();
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
                        child: ItemDetailsWidget(
                            initialItem: viewModel.resource),
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
                                  'Delete Resource',
                                  'Are you sure you want to delete the current resource?');

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
}
