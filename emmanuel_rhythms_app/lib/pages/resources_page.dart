import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/resources_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatelessWidget {
  static const route = 'resources';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<ResourcesViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<ResourcesViewModel>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: AppColours.emmanuelBlue,
              title: Text('Resources',
                  style: Theme.of(context).textTheme.headline3),
              automaticallyImplyLeading: true,
            ),
            body: viewModel.resources == null ?
                const Center(
                  child: CircularProgressIndicator(color: AppColours.emmanuelBlue,),
                )
            : ItemListWidget(
                items: viewModel.resources!)
          );
        });
  }
}
