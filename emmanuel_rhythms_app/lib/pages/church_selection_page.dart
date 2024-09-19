import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/models/churchV2.dart';
import 'package:emmanuel_rhythms_app/pages/home_page.dart';
import 'package:emmanuel_rhythms_app/pages/notification_consent_page.dart';
import 'package:emmanuel_rhythms_app/repositories/analytics_repository.dart';
import 'package:emmanuel_rhythms_app/view_models/church_selection_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
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
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white, // Status bar
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColours.emmanuelBlue,
                centerTitle: true,
                title: Text('Select Church'.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall),
                automaticallyImplyLeading: !args.isInitialSelection,
                elevation: 2,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ShaderMask(
                          shaderCallback: (Rect rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, AppColours.lightGrey],
                              stops: [0.9, 1.0],
                            ).createShader(rect);
                          },
                          blendMode: BlendMode.dstOut,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                    'Please choose which church family you are part of.',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyMedium),
                                const SizedBox(height: 20),
                                ...ChurchV2.values
                                    .map((church) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: GestureDetector(
                                      onTap: () => viewModel
                                          .setSelectedChurch(church),
                                      child: Image.asset(
                                          viewModel.isChurchSelected(church) ? church.selectedImageName : church.unselectedImageName
                                      )

                                  ),
                                ))
                                    .toList(),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      StandardButton(
                        onTap: () async {

                          GetIt.I<AnalyticsRepository>().track('church_selected', {
                            'church': viewModel.selectedChurch?.name ?? 'none'
                          });

                          if(args.isInitialSelection) {
                            if (await Permission.notification.isDenied) {
                              Navigator.of(context)
                                  .pushReplacementNamed(NotificationConsentPage.route);
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed(HomePage.route);
                            }
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        text: 'CONFIRM',
                        isEnabled: viewModel.hasSelectedChurch,
                      ),
                    ],
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
