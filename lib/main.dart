import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/screen/dashboard_page.dart';
import 'package:sibeluapp/screen/dashboard_page_2.dart';
import 'package:sibeluapp/screen/landing_dashboard_page.dart';
import 'package:sibeluapp/screen/landing_page.dart';
import 'package:sibeluapp/screen/login_page.dart';

import 'injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sibelu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber[50],
        canvasColor: Colors.blue,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(
                  // color: Color.fromARGB(20, 51, 51, 1),
                  ),
              headline1: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: LandingPage(),
      home: LoginPage(),
      routes: {
        '/landing-page': (ctx) => LandingPage(),
        '/landing-login-page': (ctx) => LandingDashboardPage(),
        '/login': (ctx) => LoginPage(),
      },
    );
  }
}
