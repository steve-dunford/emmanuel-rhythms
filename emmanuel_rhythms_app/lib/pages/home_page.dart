import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller =
      PageController(initialPage: HomeViewModel.initialPageIndex);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<HomeViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<HomeViewModel>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Daily Content',
                  style: Theme.of(context).textTheme.headline3),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => controller.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut),
                            child: Image.asset(Assets.leftIcon)),
                        Expanded(
                          child: Center(
                            child: Text(
                              viewModel.title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut),
                            child: Image.asset(Assets.rightIcon)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: PageView.builder(
                        controller: controller,
                        onPageChanged: (index) =>
                            viewModel.setCurrentIndex(index),
                        itemBuilder: (context, index) {
                          if (viewModel.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColours.emmanuelBlue,
                              ),
                            );
                          }

                          return ItemListWidget(
                              items: viewModel.itemsForIndex(index));
                        }))
              ],
            ),
          );
        });
  }
}
