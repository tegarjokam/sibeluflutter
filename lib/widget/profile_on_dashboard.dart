import 'package:flutter/material.dart';

import 'package:sibeluapp/models/user_model.dart';
import 'package:sibeluapp/widget/profile_image.dart';

class ProfileOnDashboard extends StatelessWidget {
  User user;

  ProfileOnDashboard({this.user});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: categoryHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Hero(
                  tag: 'profileImage',
                  child: ProfileImage(
                    imageUrl: user.imageUrl,
                    width: 110,
                    height: 110,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          user.fullName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
