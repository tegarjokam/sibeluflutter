import 'package:flutter/material.dart';

import '../../../size_config_dashboard.dart';

class AppsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: getProportionateScreenWidth(313),
      height: getProportionateScreenHeight(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: Color(0xFF3E4067)),
        boxShadow: [
          BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.16)),
        ],
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.red,
              ),
              Text('Siratu')
            ]),
            SizedBox(
              width: 10,
            ),
            Column(children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.cyan,
              ),
              SizedBox(
                height: 2,
              ),
              Text('Aduan')
            ]),
            SizedBox(
              width: 10,
            ),
            Column(children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.green,
              ),
              Text('Capaian')
            ]),
            SizedBox(
              width: 10,
            ),
            Column(children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.amber,
              ),
              Text('Hukum')
            ]),
          ],
        ),
      ),
    );
  }
}
