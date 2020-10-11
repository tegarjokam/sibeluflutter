import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/dashboard/components/section_title.dart';

import '../../../constants.dart';
import '../../../size_config_dashboard.dart';
import '../../../travel_model.dart';

class Announcement extends StatelessWidget {
  const Announcement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SectionTitle(title: 'Information'),
      VerticalSpacing(of: 20),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(children: [
          ...List.generate(information.length, (index) {
            return Padding(
              padding: EdgeInsets.only(left: 20),
              child: AnnouncementCard(
                information: information[index],
                press: () {},
              ),
            );
          }),
          SizedBox(
            width: getProportionateScreenWidth(20),
          )
        ]),
      ),
    ]);
  }
}

class AnnouncementCard extends StatelessWidget {
  final TravelSpot information;
  final GestureTapCallback press;

  const AnnouncementCard({
    Key key,
    @required this.information,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(kDefaultPadding),
            ),
            width: 200,
            decoration: BoxDecoration(
              // border: Border.all(style: BorderStyle.solid),
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [kDefaultShadow],
            ),
            child: Text(
              information.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(150),
            padding: EdgeInsets.all(
              getProportionateScreenWidth(kDefaultPadding),
            ),
            decoration: BoxDecoration(
              // border: Border.all(style: BorderStyle.solid),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [kDefaultShadow],
            ),
            child: Column(
              children: [
                Text(
                  information.date,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
