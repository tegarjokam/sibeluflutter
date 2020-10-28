import 'package:flutter/material.dart';

final baseUrl = "http://192.168.1.6:8080/";
final clientId = 'sibeluApp';
final clientSecret = 'sibeluSecret';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1).withOpacity(0.2),
  borderRadius: BorderRadius.circular(30),
  border: Border.all(
    color: Colors.black.withOpacity(0.5),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kPrimaryColor = Color(0xFF3E4067);
const kTextColor = Color(0xFF3F4168);
const kIconColor = Color(0xFF5E5E5E);

const kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: Offset(10, 10),
  blurRadius: 10,
  color: Color(0xFFE9E9E9).withOpacity(0.56),
);
