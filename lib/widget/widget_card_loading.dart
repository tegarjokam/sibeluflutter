import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCardLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
          child: Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}