import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/pages/resources_page.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:emmanuel_rhythms_app/view_models/resource_categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ResourceCategoriesPage extends StatelessWidget {
  static const route = 'resourceCategories';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<ResourceCategoriesViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<ResourceCategoriesViewModel>();

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
              body: viewModel.categories == null ?
              const Center(
                child: CircularProgressIndicator(
                  color: AppColours.emmanuelBlue,),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: viewModel.categories!
                    .map((c) =>
                    GestureDetector(
                      onTap: () {
                        GetIt.I.get<AnalyticsRepository>().track('resource_category_selected', {
                          'category': c.caption
                        });
                        Navigator.of(context).pushNamed(ResourcesPage.route,
                              arguments: ResourcesPageArgs(c));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.0, color: AppColours.midGrey),
                            ),
                          ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  c.caption,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline3,
                                ),
                                Image.asset(Assets.rightIcon)
                              ],
                            )
                        ),
                      ),
                    ))
                    .toList(),
              )
          );
        });
  }
}