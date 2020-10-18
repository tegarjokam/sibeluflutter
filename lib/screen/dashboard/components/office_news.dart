import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/dashboard/components/section_title.dart';

import '../../../constants.dart';
import '../../../size_config_dashboard.dart';
import '../../../travel_model.dart';

class OfficeNews extends StatelessWidget {
  const OfficeNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "News In Office",
          press: () {},
        ),
        VerticalSpacing(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              ...List.generate(newsInOffice.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: OfficeNewsCard(
                    newsInOffice: newsInOffice[index],
                    press: () {},
                  ),
                );
              }),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OfficeNewsCard extends StatelessWidget {
  final TravelSpot newsInOffice;
  final GestureTapCallback press;
  const OfficeNewsCard({
    Key key,
    @required this.newsInOffice,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          getProportionateScreenWidth(MediaQuery.of(context).size.width * 0.8),
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                  image: AssetImage(newsInOffice.image), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(
                MediaQuery.of(context).size.width * 0.8),
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
                  newsInOffice.name,
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
