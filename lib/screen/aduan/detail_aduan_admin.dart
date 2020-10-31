import 'package:flutter/material.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/screen/aduan/components/hero_header.dart';

class DetailAduanAdminPage extends StatefulWidget {
  @override
  _DetailAduanAdminPageState createState() => _DetailAduanAdminPageState();
}

class _DetailAduanAdminPageState extends State<DetailAduanAdminPage> {
  Widget _scrollView(BuildContext context, Map<String, AduanBody> data) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HeroHeader(
                minExtent: 150.0,
                maxExtent: 250.0,
                data: data['result'],
                onLayoutToggle: () => Navigator.of(context).pop()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Kronologi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(data['result'].kronologi),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Bukti',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(5)),
              child: Text('List Bukti ...'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Profil Pengadu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  // color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      Text(data['result'].fullName),
                      Text(data['result'].phoneNumber),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildButton(context, 'Tindak Lanjut', Colors.greenAccent,
                      Colors.green, () {})
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, AduanBody> data =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _scrollView(context, data),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    Color color,
    Color splashColor,
    Function onPressed,
  ) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.04,
      child: RaisedButton(
        splashColor: splashColor,
        color: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 10, color: Colors.red),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

EdgeInsets _edgeInsetsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
  } else {
    return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
  }
}
