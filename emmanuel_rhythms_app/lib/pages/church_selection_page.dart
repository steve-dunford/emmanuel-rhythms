import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/models/church.dart';
import 'package:emmanuel_rhythms_app/pages/home_page.dart';
import 'package:emmanuel_rhythms_app/view_models/church_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ChurchSelectionPage extends StatelessWidget {
  static const route = 'churchSelection';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ChurchSelectionPageArgs;

    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<ChurchSelectionViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<ChurchSelectionViewModel>();

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: AppColours.emmanuelBlue,
                title: Text('Select Church',
                    style: Theme.of(context).textTheme.headline3),
                automaticallyImplyLeading: !args.isInitialSelection,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              'Please choose which church family you are part of.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 20),
                          ...Church.values
                              .map((church) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(church.displayName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4),
                                        Checkbox(
                                            value: viewModel
                                                .isChurchSelected(church),
                                            onChanged: (selected) => viewModel
                                                .setSelectedChurch(church))
                                      ],
                                    ),
                                  ))
                              .toList(),
                          const Spacer(),
                          GestureDetector(
                              onTap: () => args.isInitialSelection
                                  ? Navigator.of(context)
                                      .pushReplacementNamed(HomePage.route)
                                  : Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: AppColours.emmanuelBlue),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  child: Text(
                                    'Confirm',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ))
                        ]),
                  ),
                ),
              ));
        });
  }
}

class ChurchSelectionPageArgs {
  final bool isInitialSelection;

  ChurchSelectionPageArgs(this.isInitialSelection);
}
