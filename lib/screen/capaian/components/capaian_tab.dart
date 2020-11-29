import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/components/status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/top_status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/tren_nko_section.dart';

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
