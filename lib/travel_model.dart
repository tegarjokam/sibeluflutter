import 'package:flutter/material.dart';

class TravelSpot {
  final String name, image;
  final String date;

  TravelSpot({
    @required this.name,
    @required this.image,
    this.date,
  });
}

List<TravelSpot> newsInOffice = [
  TravelSpot(
    name: "Bakti Sosial",
    image: "assets/img/Bakti_Sosial.jpg",
    // date: DateTime(2020, 10, 15),
  ),
  TravelSpot(
    name: "Upacara Pelantikan Pejabat Fungsional",
    image: "assets/img/Upacara_Pelantikan.jpg",
    // date: DateTime(2020, 3, 10),
  ),
  TravelSpot(
    name: "Sharing Session KC",
    image: "assets/img/Red_Mountains.png",
    // date: DateTime(2020, 10, 15),
  ),
  TravelSpot(
    name: "Mutasi Pegawai",
    image: "assets/img/Red_Mountains.png",
    // date: DateTime(2020, 10, 15),
  ),
];

List<TravelSpot> information = [
  TravelSpot(
    name: "Rapid Test Pegawai",
    image: "assets/img/Bakti_Sosial.jpg",
    date: 'Senin, 2 Oktober 2020',
  ),
  TravelSpot(
    name: "Sosialisasi Pita Cukai",
    image: "assets/img/Upacara_Pelantikan.jpg",
    date: 'Selasa, 3 Oktober 2020',
  ),
  TravelSpot(
    name: "Sharing Session KC",
    image: "assets/img/Red_Mountains.png",
    date: 'Rabu, 4 Oktober 2020',
  ),
  TravelSpot(
    name: "Mutasi Pegawai",
    image: "assets/img/Red_Mountains.png",
    date: 'Kamis, 5 Oktober 2020',
  ),
];
