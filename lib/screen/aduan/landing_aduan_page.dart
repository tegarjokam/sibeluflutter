import 'package:flutter/material.dart';

import 'components/custom_button.dart';

class LandingAduanPage extends StatefulWidget {
  @override
  _LandingAduanPageState createState() => _LandingAduanPageState();
}

class _LandingAduanPageState extends State<LandingAduanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Pojok Aduan.',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text('Designed and developed by BCKanwilMaluku'),
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: 'logo-aduan',
              child: Image.asset(
                'assets/img/logo_aduan.png',
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Pojok Aduan adalah portal untuk melaporkan kejadian yang berkaitan dengan pelanggaran disiplin dan/atau kode etik yang dilakukan oleh pegawai Kantor Wilayah Direktorat Jenderal Bea dan Cukai Maluku',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, wordSpacing: 3),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aduan-page');
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
