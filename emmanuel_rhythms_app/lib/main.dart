import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/dependencies.dart';
import 'package:emmanuel_rhythms_app/firebase_options.dart';
import 'package:emmanuel_rhythms_app/models/notification.dart';
import 'package:emmanuel_rhythms_app/pages/church_selection_page.dart';
import 'package:emmanuel_rhythms_app/pages/home_page.dart';
import 'package:emmanuel_rhythms_app/pages/item_details_page.dart';
import 'package:emmanuel_rhythms_app/pages/notification_consent_page.dart';
import 'package:emmanuel_rhythms_app/pages/resource_categories_page.dart';
import 'package:emmanuel_rhythms_app/pages/resources_page.dart';
import 'package:emmanuel_rhythms_app/repositories/local_storage_repository.dart';
import 'package:emmanuel_rhythms_app/view_models/tags_view_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Dependencies.register();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    _firebaseMessagingHandler(message);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => GetIt.I.get<TagsViewModel>(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Emmanuel Rhythms',
          navigatorObservers: [observer],
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            textTheme: AppTextStyle.theme(context),
          ),
          onGenerateRoute: _onGenerateRoute,
          initialRoute: '/',
          onGenerateInitialRoutes: (String initialRouteName) {
            final localStorageRepo = GetIt.I.get<LocalStorageRepository>();

            return [
              localStorageRepo.hasSelectedChurch
                  ? MaterialPageRoute<dynamic>(
                      builder: (context) {
                        return HomePage();
                      },
                    )
                  : MaterialPageRoute<dynamic>(
                      builder: (context) {
                        return ChurchSelectionPage();
                      },
                      settings: RouteSettings(
                          arguments: ChurchSelectionPageArgs(
                        true,
                      )),
                    )
            ];
          },
        );
      },
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    Widget? page;

    switch (settings.name) {
      case HomePage.route:
        page = HomePage();
        break;
      case ResourceCategoriesPage.route:
        page = ResourceCategoriesPage();
        break;
      case ResourcesPage.route:
        page = ResourcesPage();
        break;
      case ChurchSelectionPage.route:
        page = ChurchSelectionPage();
        break;
      case ItemDetailsPage.route:
        page = ItemDetailsPage();
        break;
      case NotificationConsentPage.route:
        page = NotificationConsentPage();
        break;
    }

    if (page != null) {
      return MaterialPageRoute<dynamic>(
        builder: (context) {
          return page!;
        },
        settings: settings,
      );
    }

    return null;
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  final repo = SharedPreferencesLocalStorageRepository(await SharedPreferences.getInstance());

  if(message.notification?.body != null)
  {
    final notification = ELRNotification(
        id: message.messageId ?? 'unknown',
        text: message.notification!.body!,
        timestamp: DateTime.now(),
        title: message.notification?.title
    );

    repo.addNotification(notification);
  }


  print("Handling a background message: ${message.messageId}");
}
