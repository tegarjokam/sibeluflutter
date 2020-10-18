import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config_dashboard.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback press;

  const SectionTitle({Key key, @required this.title, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          GestureDetector(
            onTap: press,
            child: Text('See all',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
