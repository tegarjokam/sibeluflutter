import 'package:flutter/material.dart';

import 'package:sibeluapp/models/user_model.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  ProfileImage({
    this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fitHeight,
          image: new NetworkImage('$imageUrl'),
        ),
      ),
    );
    ;
  }
}
