import 'dart:html';
import 'dart:ui' as ui;
import 'package:calendar_view/calendar_view.dart';
import 'package:emmanuel_rhythms_cms/dependencies.dart';
import 'package:emmanuel_rhythms_cms/firebase_options.dart';
import 'package:emmanuel_rhythms_cms/pages/calendar_page.dart';
import 'package:emmanuel_rhythms_cms/pages/login_page.dart';
import 'package:emmanuel_rhythms_cms/pages/resources_page.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/auth_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Dependencies.register();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GetIt.I.get<AuthModel>(),
        builder: (BuildContext context, _) {
          final authModel = context.watch<AuthModel>();
          return CalendarControllerProvider(
              controller: EventController(),
              child: MaterialApp(
                title: 'Emmanuel Rhythms CMS',
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
                ),
                onGenerateRoute: (settings) =>
                    _onGenerateRoute(settings, authModel),
              ));
        });
  }

  Route? _onGenerateRoute(RouteSettings settings, AuthModel model) {
    Widget? page;

    if (settings.name == Routes.login || model.currentUser == null) {
      page = LoginPage();
    } else {
      switch (settings.name) {
        case Routes.home:
          page = CalendarPage();
          break;
        case Routes.resources:
          page = ResourcesPage();
          break;
      }
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
