import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/pages/church_selection_page.dart';
import 'package:emmanuel_rhythms_app/pages/resource_categories_page.dart';
import 'package:emmanuel_rhythms_app/pages/resources_page.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/style/assets.dart';
import 'package:emmanuel_rhythms_app/view_models/home_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/item_list_widget.dart';
import 'package:emmanuel_rhythms_app/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final PageController _pageController =
      PageController(initialPage: HomeViewModel.initialPageIndex);
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurveTween(curve: Curves.fastOutSlowIn).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<HomeViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<HomeViewModel>();

          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text('DAILY CONTENT',
                    style: Theme.of(context).textTheme.headline3),
                elevation: 0,
                leading: IconButton(
                  icon: Image.asset(Assets.menuIcon),
                  onPressed: () => _showMenuOverlay(viewModel),
                )),
            body: Column(
              children: [
                Container(
                  color: AppColours.dateSelector,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 5.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              GetIt.I.get<AnalyticsRepository>().track('prev_date', {});
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            },
                            child: Image.asset(Assets.leftIcon)),
                        Expanded(
                          child: Center(
                            child: Text(
                              viewModel.title.toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              GetIt.I.get<AnalyticsRepository>().track('next_date', {});
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            },
                            child: Image.asset(Assets.rightIcon)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: PageView.builder(
                        controller: _pageController,
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

  _showMenuOverlay(HomeViewModel viewModel) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return FadeTransition(
          opacity: animation!,
          child: SafeArea(
            child: MenuWidget(
              onClose: () async {
                await animationController?.reverse();
                overlayEntry!.remove();
              },
              menuItems: [
                MenuEntry('RESOURCES', () {
                  overlayEntry!.remove();
                  GetIt.I.get<AnalyticsRepository>().track('resources_tap', {});
                  Navigator.of(context).pushNamed(ResourceCategoriesPage.route);
                }),
                MenuEntry('SWITCH CHURCH', () async {
                  overlayEntry!.remove();

                  GetIt.I.get<AnalyticsRepository>().track('switch_church_tap', {});

                  await Navigator.of(context).pushNamed(
                      ChurchSelectionPage.route,
                      arguments: ChurchSelectionPageArgs(false));
                  viewModel.onSelectedChurchChanged();
                })
              ],
            ),
          ));
    });
    animationController!.addListener(() {
      overlayState!.setState(() {});
    });
    // inserting overlay entry
    overlayState!.insert(overlayEntry);
    animationController!.forward();
  }
}
