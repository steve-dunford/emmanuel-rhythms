import 'package:emmanuel_rhythms_app/common/app_colours.dart';
import 'package:emmanuel_rhythms_app/pages/home_page.dart';
import 'package:emmanuel_rhythms_app/view_models/notification_consent_view_model.dart';
import 'package:emmanuel_rhythms_app/widgets/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class NotificationConsentPage extends StatelessWidget {
  static const route = 'notificationPermission';

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<NotificationConsentViewModel>(),
        builder: (context, child) {
          final viewModel = context.watch<NotificationConsentViewModel>();

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: AppColours.emmanuelBlue,
                centerTitle: true,
                title: Text('Notifications'.toUpperCase(),
                    style: Theme.of(context).textTheme.headline3),
                automaticallyImplyLeading: false,
                elevation: 2,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              'We would like to send notifications to your device to let you know about new '
                              'content and upcoming events. To allow this, please tap continue and allow notifications '
                              'when you are prompted to allow notifications.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1),

                          const Spacer(),
                          StandardButton(
                            onTap: () async {
                              await viewModel.requestNotificationPermission();
                              Navigator.of(context).pushNamed(HomePage.route);
                            },
                            text: 'CONTINUE',
                            isEnabled: true,
                          ),
                        ]),
                  ),
                ),
              ));
        });
  }
}
