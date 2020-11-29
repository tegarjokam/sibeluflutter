import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/capaian_tab.dart';
import 'package:sibeluapp/screen/capaian/components/top_status_capaian_section.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CapaianTab(),
        CapaianTab(),
        CapaianTab(),
        CapaianTab(),
        CapaianTab(),
        CapaianTab(),
      ],
    );
  }
}
