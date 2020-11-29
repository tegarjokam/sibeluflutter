import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/components/body.dart';

class Capaian extends StatefulWidget {
  @override
  _CapaianState createState() => _CapaianState();
}

class _CapaianState extends State<Capaian> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 5,
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('CAPAIAN KINERJA',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: TabBar(
        isScrollable: true,
        indicatorColor: Colors.amber,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        tabs: [
          Tab(
            child: Text("Juni", style: TextStyle(color: Colors.white)),
          ),
          Tab(
            child: Text("Juli", style: TextStyle(color: Colors.white)),
          ),
          Tab(
            child: Text("Agustus", style: TextStyle(color: Colors.white)),
          ),
          Tab(
            child: Text("September", style: TextStyle(color: Colors.white)),
          ),
          Tab(
            child: Text("Oktober", style: TextStyle(color: Colors.white)),
          ),
          Tab(
            child: Text("November", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
