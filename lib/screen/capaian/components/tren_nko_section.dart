import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrenNKOSection extends StatelessWidget {
    final List<NKODataChart> nkoData = [
    NKODataChart(2016, 90),
    NKODataChart(2017, 95),
    NKODataChart(2018, 105),
    NKODataChart(2019, 110),
    NKODataChart(2020, 100),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(50),
                vertical: ScreenUtil().setWidth(50)),
            decoration: BoxDecoration(
                color: Color(0xFFC6E1FF),
                borderRadius: BorderRadius.circular(10)),
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
                          child: SfCartesianChart(series: <ChartSeries>[
                            AreaSeries<NKODataChart, int>(
                                dataSource: nkoData,
                                xValueMapper: (NKODataChart data, _) =>
                                    data.tahun,
                                yValueMapper: (NKODataChart data, _) =>
                                    data.nko)
                          ]))),
                ),
              ],
            ),
          ),
  }
}