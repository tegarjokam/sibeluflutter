import 'package:flutter/material.dart';
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
              scale: 7 / 5,
            ),
            Text(
              'SiBeLu.',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
            Text(
              'Design and developed by BCKanwilMaluku',
              style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              indent: MediaQuery.of(context).size.width * 0.2,
              endIndent: MediaQuery.of(context).size.width * 0.2,
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sibelu merupakan aplikasi yang dibuat untuk memudahkan proses bisnis pada Kantor Wilayah DJBC Maluku',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 150,
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
                        fontSize: 25,
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
