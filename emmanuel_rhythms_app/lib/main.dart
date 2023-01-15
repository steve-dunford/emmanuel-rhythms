import 'package:emmanuel_rhythms_app/common/app_text_style.dart';
import 'package:emmanuel_rhythms_app/dependencies.dart';
import 'package:emmanuel_rhythms_app/firebase_options.dart';
import 'package:emmanuel_rhythms_app/pages/home_page.dart';
import 'package:emmanuel_rhythms_app/pages/resources_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Emmanuel Rhythms',
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
      initialRoute: HomePage.route,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    Widget? page;

    switch (settings.name) {
      case HomePage.route:
        page = HomePage();
        break;
      case ResourcesPage.route:
        page = ResourcesPage();
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
