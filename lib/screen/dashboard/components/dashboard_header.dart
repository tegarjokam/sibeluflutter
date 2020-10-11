import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sibeluapp/screen/dashboard/components/apps_dashboard.dart';
import 'package:sibeluapp/widget/profile_image.dart';

import '../../../size_config_dashboard.dart';
import 'package:sibeluapp/models/user_model.dart';

class DashboardHeader extends StatelessWidget {
  final User user;

  DashboardHeader({this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/img/bg_landing.jpg",
          height: getProportionateScreenWidth(290),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Hero(
                tag: 'profileImage',
                child: ProfileImage(
                  height: 100,
                  width: 100,
                  imageUrl:
                      'https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tegar Pribadi Putra',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Pelaksana Pemeriksa',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'Kantor Wilayah Maluku',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ],
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-50),
          child: AppsDashboard(),
        )
      ],
    );
  }
}
