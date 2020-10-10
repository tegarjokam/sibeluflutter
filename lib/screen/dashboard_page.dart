import 'package:flutter/material.dart';
import 'package:sibeluapp/widget/profile_image.dart';
import 'package:sibeluapp/widget/profile_on_dashboard.dart';

import 'package:sibeluapp/models/user_model.dart';

class DashboardPage extends StatefulWidget {
  final User user;
  DashboardPage({this.user});
  @override
  _DashboardPageState createState() => _DashboardPageState(user: user);
}

class _DashboardPageState extends State<DashboardPage> {
  final User user;
  final ProfileOnDashboard profileOnDashboard = ProfileOnDashboard();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  _DashboardPageState({this.user});

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "\$ ${post["price"]}",
                    //   style: const TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    profileOnDashboard.user = user;
    print('init');
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: profileOnDashboard,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: Column(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Apps & News',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppsItem(),
                          AppsItem(),
                          AppsItem(),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: ListView.builder(
                    controller: controller,
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      print('top container luar = $topContainer');
                      if (topContainer > 0.5) {
                        print('top container = $topContainer');
                        scale = index + 0.5 - topContainer;
                        // print('scale = $scale');
                        if (scale < 0) {
                          // print('SCALE < 0');
                          // print('index $index, scale : $scale');
                          scale = 0;
                        } else if (scale > 1) {
                          // print('SCALE > 1');
                          // print("")
                          // print('index $index, scale : $scale');
                          scale = 1;
                        }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.6,
                              alignment: Alignment.topCenter,
                              child: itemsData[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppsItem extends StatelessWidget {
  const AppsItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white54),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/img/logo_bc.png',
                height: 50,
                width: 50,
              ),
            ),
            Text(
              'SIRATU',
              style: TextStyle(fontSize: 13),
            ),
            Text(
              'Rumah Tangga',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}

const FOOD_DATA = [
  {
    "name": "Sosialisasi Pita Cukai",
    "brand": "Mino",
    "price": '',
    "image": "burger.png"
  },
  {
    "name": "Join Sinergi Dengan DJP",
    "brand": "Andi Chusna",
    "price": '',
    "image": "cheese_dip.png"
  },
  {
    "name": "Pemeriksaan Sarana Pengangkut",
    "brand": "Ferdi",
    "price": '',
    "image": "cola.png"
  },
  {
    "name": "HUT Bea Cukai Ke-74",
    "brand": "Daniel",
    "price": '',
    "image": "fries.png"
  },
  {
    "name": "Apel Luar Biasa",
    "brand": "Palito",
    "price": '',
    "image": "ice_cream.png"
  },
  {
    "name": "Banjir Ambon",
    "brand": "Akip",
    "price": '',
    "image": "noodles.png"
  },
  {
    "name": "Sosialisasi Cukai Plastik",
    "brand": "Aji",
    "price": '',
    "image": "pizza.png"
  },
  {
    "name": "Ramah Tamah",
    "brand": "Leni Nurlaeni",
    "price": '',
    "image": "sandwich.png"
  },
  {"name": "Wrap", "brand": "Subway", "price": 6.99, "image": "wrap.png"},
  {
    "name": "Join Sinergi Dengan DJP",
    "brand": "Yusuf",
    "price": '',
    "image": "ice_cream.png"
  },
  {
    "name": "Bintal Islam",
    "brand": "Bagus",
    "price": '',
    "image": "noodles.png"
  },
  {"name": "Pizza", "brand": "Dominos", "price": 17.99, "image": "pizza.png"},
  {
    "name": "Buka Puasa Bersama",
    "brand": "Rizal",
    "price": '',
    "image": "sandwich.png"
  },
  {
    "name": "Penguatan Integritas",
    "brand": "Zubaidy Yulianto",
    "price": '',
    "image": "wrap.png"
  }
];
