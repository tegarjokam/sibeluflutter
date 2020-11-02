import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/login_page.dart';

class LandingPage extends StatelessWidget {
  Widget _stackBuild(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg_landing.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blue.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo_bc.png',
              height: ScreenUtil().setWidth(300),
              width: ScreenUtil().setWidth(400),
            ),
            Text(
              'SiBeLu.',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(90),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
            Text(
              'Design and developed by BCKanwilMaluku',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Divider(
              indent: ScreenUtil().setWidth(154),
              endIndent: ScreenUtil().setWidth(154),
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              height: ScreenUtil().setWidth(80),
              width: ScreenUtil().setWidth(300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                },
                splashColor: Colors.white,
                highlightColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(768, 1280), allowFontScaling: true);
    print('ukuran ${ScreenUtil().setWidth(154)}');
    double a = MediaQuery.of(context).size.width * 0.2;
    print('size $a');
    return Scaffold(
      body: PageView(
        children: [
          _stackBuild(context),
          LoginPage(),
        ],
      ),
    );
  }
}
