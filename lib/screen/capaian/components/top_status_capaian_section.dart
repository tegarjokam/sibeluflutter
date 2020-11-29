import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopStatusCapaianSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(50),
            vertical: ScreenUtil().setWidth(50)),
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
            vertical: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFC6E1FF)),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "NKO",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4D88E1)),
                  ),
                  Text(
                    "120",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF05BE0C)),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xFFB6C9E5),
              thickness: 1,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "IKU \nHijau",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4D88E1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(20),
                          ),
                          child: Text(
                            "9",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(50),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF05BE0C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Color(0xFFB6C9E5),
                      thickness: 1,
                      indent: 2,
                      endIndent: 2,
                    ),
                    Column(
                      children: [
                        Text(
                          "IKU \nKuning",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4D88E1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(20),
                          ),
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(50),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFAFF00),
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Color(0xFFB6C9E5),
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Column(
                      children: [
                        Text(
                          "IKU \nMerah",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4D88E1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(20),
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(50),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFD6969),
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Color(0xFFB6C9E5),
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Column(
                      children: [
                        Text(
                          "IKU \nAbu-abu",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4D88E1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(20),
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(50),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA4A4A4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
