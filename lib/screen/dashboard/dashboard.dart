import 'package:flutter/material.dart';
import 'package:sibeluapp/size_config_dashboard.dart';

import 'components/body.dart';
import 'package:sibeluapp/models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  final User user;

  DashboardScreen({this.user});

  @override
  _DashboardScreenState createState() => _DashboardScreenState(user: user);
}

class _DashboardScreenState extends State<DashboardScreen> {
  final User user;

  _DashboardScreenState({this.user});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ));
  }
}
