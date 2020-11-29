import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/body.dart';

class Capaian extends StatefulWidget {
  @override
  _CapaianState createState() => _CapaianState();
}

class _CapaianState extends State<Capaian> {
  List<Tab> tab = [
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tab.length,
      initialIndex: tab.length - 1,
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.date_range,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
          elevation: 10,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                builder: (context) {
                  return Container(
                    height: ScreenUtil().setWidth(400),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: _buttomNavigationMenu(),
                    ),
                  );
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Body(
          tab: [...tab.map((data) => data).toList()],
        ),
      ),
    );
  }

  Column _buttomNavigationMenu() {
    return Column(children: [
      ListTile(
        title: Text("Triwulan"),
        onTap: () {
          setState(() {
            tab = [
              Tab(
                child:
                    Text("Triwulan 1", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 2", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 3", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 4", style: TextStyle(color: Colors.white)),
              ),
            ];
          });
        },
      ),
      ListTile(
        title: Text("Semesteran"),
        onTap: () {
          setState(() {
            tab = [
              Tab(
                child: Text("Senester 1 2019",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Senester 2 2019",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Senester 1 2020",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Semester 2 2020",
                    style: TextStyle(color: Colors.white)),
              )
            ];
          });
        },
      ),
      ListTile(
        title: Text("Tahunan"),
        onTap: () {
          setState(() {
            tab = [
              Tab(
                child:
                    Text("Tahun 2016", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2017", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2018", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2019", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2020", style: TextStyle(color: Colors.white)),
              )
            ];
          });
        },
      )
    ]);
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
          ...tab.map((data) => data).toList(),
        ],
      ),
    );
  }
}

class FloatingActionButtonCapaian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      showBottomSheet(
          context: context,
          builder: (context) => Container(
                color: Colors.red,
              ));
    });
  }
}
