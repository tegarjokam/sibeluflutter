import 'dart:ffi';

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
  String tahun;
  int nko;
  NKODataChart(this.tahun, this.nko);
}

class ChartData {
  ChartData(this.x, this.y, this.color, this.label, this.iku);
  final String x;
  final int y;
  final Color color;
  final String label;
  final List<Iku> iku;
}

class Iku {
  Iku({this.kode, this.nama, this.target, this.realisasi});
  String kode;
  String nama;
  TargetIKU target;
  RealisasiIKU realisasi;
}

class TargetIKU {
  TargetIKU(this.tipe, this.m1, this.m2, this.m3, this.m4, this.m5, this.m6,
      this.m7, this.m8, this.m9, this.m10, this.m11, this.m12);
  String tipe;
  double m1;
  double m2;
  double m3;
  double m4;
  double m5;
  double m6;
  double m7;
  double m8;
  double m9;
  double m10;
  double m11;
  double m12;
}

class RealisasiIKU {
  RealisasiIKU(this.tipe, this.m1, this.m2, this.m3, this.m4, this.m5, this.m6,
      this.m7, this.m8, this.m9, this.m10, this.m11, this.m12);
  String tipe;
  double m1;
  double m2;
  double m3;
  double m4;
  double m5;
  double m6;
  double m7;
  double m8;
  double m9;
  double m10;
  double m11;
  double m12;
}
