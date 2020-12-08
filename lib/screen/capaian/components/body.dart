import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/capaian/capaian.dart';
import 'package:sibeluapp/screen/capaian/components/capaian_tab.dart';

class Body extends StatefulWidget {
  final List<Tab> tab;
  final List<IsiTab> isiTab;
  Body({Key key, @required this.tab, @required this.isiTab}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  List<Tab> tab;
  List<IsiTab> isiTab;
  int indexTab = -1;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ...widget.tab.map((data) {
          indexTab++;
          return CapaianTab();
        }).toList(),
      ],
    );
  }
}
