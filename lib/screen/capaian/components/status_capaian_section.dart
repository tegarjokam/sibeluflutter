import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/perspektif_chart.dart';
import 'package:sibeluapp/screen/capaian/components/ringkasan_iku_chart.dart';
import 'package:sibeluapp/screen/capaian/components/sasaran_strategis_chart.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatusCapaianSection extends StatelessWidget {
  TargetIKU target1 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target2 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target3 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target4 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target5 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target6 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target7 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target8 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target9 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target10 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target11 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target12 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target13 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target14 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  TargetIKU target15 =
      TargetIKU("BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);

  RealisasiIKU realisasi1 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi2 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi3 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi4 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi5 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi6 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi7 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi8 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi9 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi10 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi11 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi12 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi13 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi14 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);
  RealisasiIKU realisasi15 = RealisasiIKU(
      "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112);

  final List<ChartData> chartData = [
    ChartData('Hijau', ((9 / 17) * 100).toInt(), Color(0xFF05BE0C),
        "${((9 / 17) * 100).toInt()}%", [
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "2a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "3a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "4a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "5a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),

      // "Persentase efektivitas peningkatan nilai ekspor",

      // "Tingkat efektivitas pengawasan dan penegakan hukum kepabeanan dan cukai",
      // "Indeks kepuasan pengguna jasa",
      // "Persentase piutang bea dan cukai yang diselesaikan",
      // "Persentase kualitas perencanaan satuan kerja",
      // "Indeks penyelesaian kajian di bidang kepabeanan dan cukai",
      // "Indeks efektivitas komunikasi dan edukasi",
      // "Persentase efektivitas kegiatan patroli dan operasi kepabeanan dan cukai",
      // "Persentase efektivitas patroli laut",
      // "Persentase efektivitas kegiatan patroli dan operasi kepabeanan dan cukai",
      // "Persentase efektivitas patroli laut",
      // "Persentase efektivitas kegiatan patroli dan operasi kepabeanan dan cukai",
      // "Persentase efektivitas patroli laut"
    ]),
    ChartData('Kuning', ((4 / 17) * 100).toInt(), Color(0xFFFAFF00),
        "${((4 / 17) * 100).toInt()}%", [
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
    ]),
    ChartData('Merah', ((2 / 17) * 100).toInt(), Color(0xFFFC7656),
        "${((2 / 17) * 100).toInt()}%", [
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
    ]),
    ChartData('Abu-abu', ((2 / 17) * 100).toInt(), Color(0xFFA4A4A4),
        "${((2 / 17) * 100).toInt()}%", [
      Iku(
          kode: "1a",
          nama: "Persentase realiasi penerimaan kepabeanan dan cukai",
          target: TargetIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112),
          realisasi: RealisasiIKU(
              "BULANAN", 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 111, 112)),
    ])
  ];

  final List<PerspektifDataChart> perspektifData = [
    PerspektifDataChart("Stakeholder", 120, "3 IKU", Colors.teal),
    PerspektifDataChart("Customer", 100, "2 IKU", Colors.teal),
    PerspektifDataChart("Internal Process", 80, "7 IKU", Colors.yellow),
    PerspektifDataChart("Learning ..", 100, "3 IKU", Colors.teal)
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
