import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SasaranStrategisChart extends StatelessWidget {
  final List<SasaranStrategiDataChart> sasaranData;
  SasaranStrategisChart(this.sasaranData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
            labelRotation: -45, plotOffset: 10, desiredIntervals: 10),
        annotations: <CartesianChartAnnotation>[
          ...sasaranData
              .map((data) => CartesianChartAnnotation(
                  widget: Container(child: Text('${data.realisasi}%')),
                  coordinateUnit: CoordinateUnit.point,
                  x: '${data.perspektif}',
                  y: data.realisasi + 10))
              .toList()
        ],
        indicators: <TechnicalIndicators<dynamic, dynamic>>[
          AtrIndicator<dynamic, dynamic>(period: 3, seriesName: 'HiloOpenClose')
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          ColumnSeries<SasaranStrategiDataChart, String>(
            enableTooltip: true,
            dataSource: sasaranData,
            xValueMapper: (SasaranStrategiDataChart data, _) => data.perspektif,
            yValueMapper: (SasaranStrategiDataChart data, _) => data.realisasi,
            pointColorMapper: (SasaranStrategiDataChart data, _) => data.color,
          )
        ],
      ),
    );
  }
}
