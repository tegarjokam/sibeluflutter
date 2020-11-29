import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/top_status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/tren_nko_section.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CapaianTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopStatusCapaianSection(),
          StatusCapaianSection(),
          TrenNKOSection(),
        ],
      ),
    );
  }
}
