import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
import 'package:emmanuel_rhythms_cms/models/header_command.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/resources_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/item_details_widget.dart';
import 'package:emmanuel_rhythms_cms/widgets/resource_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ResourcesViewModel(GetIt.I.get()),
        builder: (context, _) {
          final model = context.watch<ResourcesViewModel>();

          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                HeaderWidget(
                  commands: [
                    HeaderCommand(
                        caption: 'Add Resource',
                        assetName: Assets.addIcon,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => Dialog(
                                    child: ResourceDetailsWidget(
                                        initialResource: Item.defaultItem,
                                        isNewResource: true,
                                        dismiss: () => Navigator.pop(context)),
                                    backgroundColor: Colors.white,
                                  ));
                        }),
                    HeaderCommand(
                        caption: 'Daily Content',
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(Routes.home);
                        })
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: model.resources == null
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppColours.emmanuelBlue))
                      : Wrap(
                          children: model.resources!
                              .map((resource) => GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => Dialog(
                                                child: ResourceDetailsWidget(
                                                    initialResource: resource,
                                                    dismiss: () =>
                                                        Navigator.pop(context)),
                                                backgroundColor: Colors.white,
                                              ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColours.emmanuelBlue),
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(
                                          child: Text(
                                            resource.title,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.subtitle2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                ))
              ],
            ),
          );
        });
  }
}
