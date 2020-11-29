import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/perspektif_chart.dart';
import 'package:sibeluapp/screen/capaian/components/ringkasan_iku_chart.dart';
import 'package:sibeluapp/screen/capaian/components/sasaran_strategis_chart.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatusCapaianSection extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Hijau', ((9 / 17) * 100).toInt(), Color(0xFF05BE0C),
        "${((9 / 17) * 100).toInt()}%"),
    ChartData('Kuning', ((4 / 17) * 100).toInt(), Color(0xFFFAFF00),
        "${((4 / 17) * 100).toInt()}%"),
    ChartData('Merang', ((2 / 17) * 100).toInt(), Color(0xFFFC7656),
        "${((2 / 17) * 100).toInt()}%"),
    ChartData('Abu-abu', ((2 / 17) * 100).toInt(), Color(0xFFA4A4A4),
        "${((2 / 17) * 100).toInt()}%")
  ];

  final List<PerspektifDataChart> perspektifData = [
    PerspektifDataChart("Stakeholder", 120, "3 IKU", Colors.teal),
    PerspektifDataChart("Customer", 100, "2 IKU", Colors.teal),
    PerspektifDataChart("Internal Process", 80, "6 IKU", Colors.yellow),
    PerspektifDataChart("Learning ..", 100, "6 IKU", Colors.teal)
  ];

  final List<SasaranStrategiDataChart> sasaranData = [
    SasaranStrategiDataChart("SS 1", 120, "3 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 2", 100, "2 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 3", 80, "6 IKU", Colors.yellow),
    SasaranStrategiDataChart("SS 4", 100, "6 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 5", 120, "3 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 6", 100, "2 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 7", 80, "6 IKU", Colors.yellow),
    SasaranStrategiDataChart("SS 8", 100, "6 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 9", 100, "6 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 10", 100, "2 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 11", 80, "6 IKU", Colors.yellow),
    SasaranStrategiDataChart("SS 12", 100, "6 IKU", Colors.teal),
    SasaranStrategiDataChart("SS 13", 100, "6 IKU", Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(50),
          vertical: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Color(0xFF8CC3FF), borderRadius: BorderRadius.circular(10)),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: ScreenUtil().setWidth(150),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Color(0xFFC6E1FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                labelColor: Color(0xFF4D88E1),
                tabs: [
                  Tab(
                    child: Text(
                      'Ringkasan \nIKU',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4D88E1),
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Perspektif',
                      style: TextStyle(
                        color: Color(0xFF4D88E1),
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sasaran \nStrategis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4D88E1),
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color(0xFFC6E1FF),
              ),
              height: ScreenUtil().setWidth(500),
              child: TabBarView(
                children: [
                  RingkasanIkuChart(chartData),
                  PerspektifChart(perspektifData),
                  SasaranStrategisChart(sasaranData),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
