import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrenNKOSection extends StatelessWidget {
  final List<NKODataChart> nkoData = [
    NKODataChart("Januari", 90),
    NKODataChart("Februari", 95),
    NKODataChart("Maret", 105),
    NKODataChart("April", 110),
    NKODataChart("Mei", 100),
    NKODataChart("Juni", 90),
    NKODataChart("Juli", 95),
    NKODataChart("Agustus", 105),
    NKODataChart("September", 110),
    NKODataChart("Oktober", 100),
    NKODataChart("November", 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(50),
          vertical: ScreenUtil().setWidth(50)),
      decoration: BoxDecoration(
          color: Color(0xFFC6E1FF), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(50),
                vertical: ScreenUtil().setWidth(50)),
            decoration: BoxDecoration(
                color: Color(0xFFC6E1FF),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Nilai Kinerja Organisasi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4D88E1),
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFC6E1FF),
            ),
            height: ScreenUtil().setWidth(400),
            child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30)),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                            labelRotation: -45,
                            maximumLabels: 12,
                            desiredIntervals: 10),
                        series: <ChartSeries>[
                          AreaSeries<NKODataChart, String>(
                              dataSource: nkoData,
                              xValueMapper: (NKODataChart data, _) =>
                                  data.tahun,
                              yValueMapper: (NKODataChart data, _) => data.nko)
                        ]))),
          ),
        ],
      ),
    );
  }
}
