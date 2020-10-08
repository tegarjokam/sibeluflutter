import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/landing_page.dart';

void main() {
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
      home: LandingPage(),
      routes: {
        '/landing-page': (ctx) => LandingPage(),
      },
    );
  }
}
