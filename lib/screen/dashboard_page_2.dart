import 'package:flutter/material.dart';

class DashboardPageSecond extends StatefulWidget {
  @override
  _DashboardPageSecondState createState() => _DashboardPageSecondState();
}

class _DashboardPageSecondState extends State<DashboardPageSecond> {
  final List<Map<String, dynamic>> FOOD_DATA = [
    {
      "name": "Burger",
      "brand": "Hawkers",
      "price": 2.99,
      "image": "burger.png",
      "color": 428543
    },
    {
      "name": "Cheese Dip",
      "brand": "Hawkers",
      "price": 4.99,
      "image": "cheese_dip.png",
      "color": 428543
    },
    {
      "name": "Cola",
      "brand": "Mcdonald",
      "price": 1.49,
      "image": "cola.png",
      "color": 428543
    },
    {
      "name": "Fries",
      "brand": "Mcdonald",
      "price": 2.99,
      "image": "fries.png",
      "color": 428543
    },
    {
      "name": "Ice Cream",
      "brand": "Ben & Jerry's",
      "price": 9.49,
      "image": "ice_cream.png",
      "color": 428543
    },
    {
      "name": "Noodles",
      "brand": "Hawkers",
      "price": 4.49,
      "image": "noodles.png",
      "color": 428543
    },
    {
      "name": "Pizza",
      "brand": "Dominos",
      "price": 17.99,
      "image": "pizza.png",
      "color": 428543
    },
    {
      "name": "Sandwich",
      "brand": "Hawkers",
      "price": 2.99,
      "image": "sandwich.png",
      "color": 428543
    },
    {
      "name": "Wrap",
      "brand": "Subway",
      "price": 6.99,
      "image": "wrap.png",
      "color": 428543
    },
    {
      "name": "Wrap",
      "brand": "Subway",
      "price": 6.99,
      "image": "wrap.png",
      "color": 428543
    }
  ];

  final scrollController = ScrollController();

  void onListen() {
    // print('scrollController: ${scrollController.offset}');
    setState(() {
      print('Jalan');
    });
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // print(index);
                final foodData = FOOD_DATA[index];
                final itemPositionOffset = index * 150;
                final difference = scrollController.offset - itemPositionOffset;
                final percent = 1 - (difference / 150);
                // if (index == 0) print('percent = $percent');
                double opacity = percent;
                double scale = percent;
                if (opacity > 1.0) {
                  // print(opacity);
                  opacity = 1.0;
                }
                if (opacity < 0.0) opacity = 0.0;
                if (percent > 1.0) scale = 1.0;
                // print('offset ${scrollController.offset}');
                // print('index = $index');
                return Align(
                  heightFactor: 0.8,
                  child: Opacity(
                    opacity: opacity,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(scale, 1.0),
                      child: Card(
                        color: Colors.amber,
                        child: SizedBox(
                          height: 150,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(foodData['name'])),
                              ),
                              Text(foodData['image']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: FOOD_DATA.length,
            ),
          ),
        ],
      ),
    );
  }
}
