import 'package:flutter/material.dart';

class PerspektifDataChart {
  String perspektif;
  int realisasi;
  String jumlahIku;
  Color color;
  PerspektifDataChart(
      this.perspektif, this.realisasi, this.jumlahIku, this.color);
}

class SasaranStrategiDataChart {
  String perspektif;
  int realisasi;
  String jumlahIku;
  Color color;
  SasaranStrategiDataChart(
      this.perspektif, this.realisasi, this.jumlahIku, this.color);
}

class NKODataChart {
  int tahun;
  int nko;
  NKODataChart(this.tahun, this.nko);
}

class ChartData {
  ChartData(this.x, this.y, this.color, this.label);
  final String x;
  final int y;
  final Color color;
  final String label;
}
