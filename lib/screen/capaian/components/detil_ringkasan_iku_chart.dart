import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetilRingkasanIKUChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<ChartData> chartData = args["chart"];

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SfCircularChart(
                onDataLabelTapped: (DataLabelTapDetails args) {
                  print(args.seriesIndex);
                },
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                ),
                onPointTapped: (PointTapArgs args) {
                  print(args.pointIndex);
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
            ),
            ...chartData.map((data) {
              return _chartData(context, data);
            }).toList()
          ],
        ),
      ),
    );
  }

  Widget _chartData(BuildContext context, ChartData data) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: data.x.toLowerCase() == "hijau"
            ? Colors.green
            : data.x.toLowerCase() == "kuning"
                ? Colors.yellow
                : data.x.toLowerCase() == "merah"
                    ? Colors.red
                    : data.x.toLowerCase() == "abu-abu"
                        ? Colors.grey
                        : Colors.white,
      ),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              "${data.x} (${data.iku.length.toString()} IKU)",
              style: TextStyle(
                color: data.x.toLowerCase() == "hijau"
                    ? Colors.white
                    : data.x.toLowerCase() == "kuning"
                        ? Colors.black87
                        : data.x.toLowerCase() == "merah"
                            ? Colors.white
                            : data.x.toLowerCase() == "abu-abu"
                                ? Colors.white
                                : Colors.white,
              ),
            ),
            children: [
              ...data.iku.map((iku) {
                return ExpansionTile(
                  title: Text(
                    iku.nama,
                    style: TextStyle(
                      color: data.x.toLowerCase() == "hijau"
                          ? Colors.white
                          : data.x.toLowerCase() == "kuning"
                              ? Colors.black
                              : data.x.toLowerCase() == "merah"
                                  ? Colors.white
                                  : data.x.toLowerCase() == "abu-abu"
                                      ? Colors.white
                                      : Colors.white,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      iku.kode,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.amber,
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(50),
                          vertical: ScreenUtil().setWidth(10)),
                      color: data.x.toLowerCase() == "hijau"
                          ? Colors.lightGreen
                          : data.x.toLowerCase() == "kuning"
                              ? Colors.yellow[300]
                              : data.x.toLowerCase() == "merah"
                                  ? Colors.redAccent
                                  : data.x.toLowerCase() == "abu-abu"
                                      ? Colors.white
                                      : Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Target",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                iku.target.m1.toString(),
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Realisasi",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                iku.realisasi.m1.toString(),
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('CAPAIAN KINERJA',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
