import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerspektifChart extends StatelessWidget {
  final List<PerspektifDataChart> perspektifData;
  PerspektifChart(this.perspektifData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        annotations: <CartesianChartAnnotation>[
          CartesianChartAnnotation(
              widget: Container(child: Text('${perspektifData[0].realisasi}%')),
              coordinateUnit: CoordinateUnit.point,
              x: '${perspektifData[0].perspektif}',
              y: perspektifData[0].realisasi + 10),
          CartesianChartAnnotation(
              widget: Container(child: Text('${perspektifData[1].realisasi}%')),
              coordinateUnit: CoordinateUnit.point,
              x: '${perspektifData[1].perspektif}',
              y: perspektifData[1].realisasi + 10),
          CartesianChartAnnotation(
              widget: Container(child: Text('${perspektifData[2].realisasi}%')),
              coordinateUnit: CoordinateUnit.point,
              x: '${perspektifData[2].perspektif}',
              y: perspektifData[2].realisasi + 10),
          CartesianChartAnnotation(
              widget: Container(child: Text('${perspektifData[3].realisasi}%')),
              coordinateUnit: CoordinateUnit.point,
              x: '${perspektifData[3].perspektif}',
              y: perspektifData[3].realisasi + 10),
        ],
        indicators: <TechnicalIndicators<dynamic, dynamic>>[
          AtrIndicator<dynamic, dynamic>(period: 3, seriesName: 'HiloOpenClose')
        ],
        series: <ChartSeries>[
          ColumnSeries<PerspektifDataChart, String>(
            dataSource: perspektifData,
            xValueMapper: (PerspektifDataChart data, _) => data.perspektif,
            yValueMapper: (PerspektifDataChart data, _) => data.realisasi,
            pointColorMapper: (PerspektifDataChart data, _) => data.color,
          )
        ],
      ),
    );
  }
}
