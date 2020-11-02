import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AduanWebview extends StatefulWidget {
  @override
  _AduanWebviewState createState() => _AduanWebviewState();
}

class _AduanWebviewState extends State<AduanWebview> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    Map<String, String> _link = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Pojok Aduan'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _link['link'],
            ))
          ],
        ));
  }
}
