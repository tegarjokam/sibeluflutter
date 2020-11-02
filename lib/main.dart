import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/aduan/aduan_page.dart';
import 'package:sibeluapp/screen/aduan/aduan_webview.dart';
import 'package:sibeluapp/screen/aduan/detail_aduan_admin.dart';
import 'package:sibeluapp/screen/aduan/landing_aduan_page2.dart';
import 'package:sibeluapp/screen/aduan/tindak_lanjut_aduan.dart';
import 'package:sibeluapp/screen/dashboard/dashboard.dart';
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
    // ScreenUtil.init(context,
    //     designSize: Size(750, 1334), allowFontScaling: true);
    return MaterialApp(
      title: 'Sibelu',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
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
        '/landing-login-page': (ctx) => LandingDashboardPage(),
        '/login': (ctx) => LoginPage(),
        '/dashboard': (ctx) => DashboardScreen(),
        '/aduan/landing': (ctx) => LandingAduanPage(),
        '/aduan/webview': (ctx) => AduanWebview(),
        // '/aduan-page': (ctx) => AduanPage(),
        // '/detail-item-aduan-admin': (ctx) => DetailAduanAdminPage(),
        // '/tindaklanjut-aduan': (ctx) => TindakLanjutAduan(),
      },
    );
  }
}
