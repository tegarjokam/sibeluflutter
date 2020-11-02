import 'package:flutter/material.dart';

class LandingAduanPage extends StatelessWidget {
  final _links = [
    'https://www.beacukai.go.id/pengaduan.html',
    'https://www.wise.kemenkeu.go.id/'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pojok Aduan.',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            // Text('Designed and developed by BCKanwilMaluku'),
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: 'logo-aduan',
              child: Image.asset(
                'assets/img/logo_aduan.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Portal untuk menyampaikan pengaduan pelanggaran melalui Aplikasi SIPUMA atau WISE',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, wordSpacing: 2),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, 'SIPUMA', Colors.amber,
                    Colors.amberAccent, 10, 0, 10, 0, () {
                  Navigator.of(context)
                      .pushNamed('/aduan/webview', arguments: <String, String>{
                    'link': _links[0],
                  });
                }),
                _buildButton(context, 'WISE', Colors.amber, Colors.amberAccent,
                    0, 10, 0, 10, () {
                  Navigator.of(context)
                      .pushNamed('/aduan/webview', arguments: <String, String>{
                    'link': _links[1],
                  });
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    Color color,
    Color splashColor,
    double topLeftRadius,
    double topRightRadius,
    double bottomLeftRadius,
    double bottomRightRadius,
    Function onPressed,
  ) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.05,
      child: RaisedButton(
        splashColor: splashColor,
        color: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(bottomRightRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              topLeft: Radius.circular(topLeftRadius)),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
