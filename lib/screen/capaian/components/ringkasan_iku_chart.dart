import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RingkasanIkuChart extends StatelessWidget {
  final List<ChartData> chartData;

  RingkasanIkuChart(this.chartData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        onDataLabelTapped: (DataLabelTapDetails args) {
          print(args.seriesIndex);
        },
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        onPointTapped: (PointTapArgs args) {
          // print(args.seriesIndex);
          print(args.pointIndex);
          Navigator.of(context).pushNamed('/capaian/ringkasaniku');
        },
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Text(
                '17 \nIKU',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF4D88E1),
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(40)),
              ),
            ),
          )
        ],
        series: [
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.label,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                useSeriesColor: true,
              )),
        ],
      ),
    );
  }
}
