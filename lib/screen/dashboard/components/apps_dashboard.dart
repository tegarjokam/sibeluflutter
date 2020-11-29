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
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              spreadRadius: 10,
              // offset: Offset(
              //   5,
              //   5,
              // ),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.16)),
        ],
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                width: ScreenUtil().setHeight(80),
                height: ScreenUtil().setHeight(80),
                color: Colors.red,
              ),
              Text('Siratu')
            ]),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                      tag: 'logo-aduan',
                      child: Image.asset(
                        'assets/img/logo_aduan.png',
                        height: ScreenUtil().setHeight(80),
                        width: ScreenUtil().setHeight(80),
                      ),
                    ),
                    Text(
                      'Aduan',
                      style: TextStyle(fontSize: ScreenUtil().setSp(27)),
                    )
                  ],
                ),
              ),
            ),
            Material(
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: Colors.amberAccent,
                onTap: () {
                  Navigator.of(context).pushNamed('/capaian');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: ScreenUtil().setHeight(80),
                      height: ScreenUtil().setHeight(80),
                      color: Colors.green,
                    ),
                    Text(
                      'Capaian',
                      style: TextStyle(fontSize: ScreenUtil().setSp(27)),
                    )
                  ],
                ),
              ),
            ),
            // Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //   Container(
            //     width: ScreenUtil().setHeight(80),
            //     height: ScreenUtil().setHeight(80),
            //     color: Colors.green,
            //   ),
            //   Text('Capaian')
            // ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                width: ScreenUtil().setHeight(80),
                height: ScreenUtil().setHeight(80),
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
