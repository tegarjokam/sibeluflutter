import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/components/capaian_tab.dart';

class Body extends StatefulWidget {
  final List<Tab> tab;
  Body({Key key, @required this.tab}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  List<Tab> tab;

  @override
  Widget build(BuildContext context) {
    // print(tab.length);
    return TabBarView(
      children: [
        ...widget.tab.map((data) {
          return CapaianTab();
        }).toList(),
      ],
    );
  }
}
