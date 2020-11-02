import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setWidth(210),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              offset: Offset(5, 5),
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
                margin: EdgeInsets.only(bottom: 5),
              ),
              Text('Siratu')
            ]),
            SizedBox(
              width: 10,
            ),
            Material(
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: Colors.amberAccent,
                onTap: () {
                  Navigator.of(context).pushNamed('/aduan/landing');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo-aduan',
                      child: Image.asset(
                        'assets/img/logo_aduan.png',
                        height: ScreenUtil().setHeight(80),
                        width: ScreenUtil().setHeight(80),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Aduan',
                      style: TextStyle(fontSize: ScreenUtil().setSp(27)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.green,
                margin: EdgeInsets.only(bottom: 5),
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
                margin: EdgeInsets.only(bottom: 5),
              ),
              Text('Hukum')
            ]),
          ],
        ),
      ),
    );
  }
}
