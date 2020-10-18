import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  CustomButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.amber,
      splashColor: Colors.amberAccent,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 14, bottom: 14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              "LAPORKAN",
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
