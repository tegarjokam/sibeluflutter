import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/constants.dart';
import 'package:sibeluapp/screen/dashboard/components/dashboard_header.dart';
import 'package:sibeluapp/screen/dashboard/components/section_title.dart';
import 'package:sibeluapp/size_config_dashboard.dart';
import 'package:sibeluapp/travel_model.dart';

import 'announcement.dart';
import 'office_news.dart';

import 'package:sibeluapp/models/user_model.dart';

class Body extends StatelessWidget {
  final User user;

  Body({this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          DashboardHeader(),
          VerticalSpacing(of: ScreenUtil().setWidth(140)),
          Announcement(),
          VerticalSpacing(),
          OfficeNews(),
          VerticalSpacing(),
        ],
      ),
    );
  }
}
