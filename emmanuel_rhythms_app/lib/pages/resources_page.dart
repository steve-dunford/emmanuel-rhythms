import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/models/resource_category.dart';
import 'package:emmanuel_rhythms_app/view_models/resources_view_model.dart';
import 'package:emmanuel_rhythms_app/view_models/tags_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatelessWidget {
  static const route = 'resources';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)
        ?.settings
        .arguments as ResourcesPageArgs?;

    return ChangeNotifierProvider(
        create: (_) {
          final vm = GetIt.I.get<ResourcesViewModel>();
          vm.init(args?.category);
          return vm;
        },
        builder: (context, child) {
          final viewModel = context.watch<ResourcesViewModel>();

          return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white, // Status bar
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColours.emmanuelBlue,
                centerTitle: true,
                title: Text('RESOURCES',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline3),
                automaticallyImplyLeading: true,
                elevation: 2,
              ),
              body: viewModel.resources == null ?
              const Center(
                child: CircularProgressIndicator(
                  color: AppColours.emmanuelBlue,),
              )
                  : ItemListWidget(
                  items: viewModel.resources!)
          );
        });
  }
}

class ResourcesPageArgs {
  final ResourceCategory category;

  ResourcesPageArgs(this.category);
}
